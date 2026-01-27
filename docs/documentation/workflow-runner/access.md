# Workflow workspace access

While workflow inputs can be freely defined in the CWL definition, and the workflow itself can load and process data however required, including loading it from external sources, the Workflow Runner also provides some advanced functionality to load inputs from various sources more simply, including loading private workspace data that is hosted on the Hub.

The Workflow Runner provides functionality to load STAC Items in an additional STAGEIN step that is run ahead of any workflow steps, whenever a particular input type is used in the workflow. We will discuss this additional functionality later in this page.

The simplest example is just to pass in a public URL pointing to a STAC item as a Directory input, the Workflow Runner will call that URL and download the data as a STAC Catalog, provided it is public, ready for processing. This URL can of course be data taken directly from the DataHub Resource Catalog, for example this Sentinel2_ARD item could be used as an input.

However, if you wish to pass in data from your own workspace, for example when trying to process private data, the WR supports passing in data files from both S3 Object Stores and AWS Block Stores.

## Workflow Runner Stage In

In order to make sure the STAGEIN step is run for your workflow, you need to define an input with the type set to `Directory`.

```yaml
inputs:
  stac:
    label: the image to convert as a STAC item
    doc: the image to convert as a STAC item
    type: Directory
```

This will trigger the STAGEIN step to run before your workflow executes, loading and saving the STAC Item locally in it's own STAC catalog.

The simplest example when using the Workflow Runner STAGEIN step is to define the STAC Item via a public URL. An example workflow can be found here. Note, the STAC Item must be available publicly (as JSON), as well as any assets within the item you wish to download for processing.

```yaml
{
  "inputs": {
    "stac": "https://raw.githubusercontent.com/EOEPCA/convert/refs/heads/main/stac/eoepca-logo.json"
  }
}
```

In our first example we will pass in a public URL pointing to a STAC item as a Directory input, the Workflow Runner will make a request to that URL and download the data, constructing a new STAC Catalog, ready for processing in your workflow steps. The directory containing this new STAC Catalog will then be passed as an input to your workflow, which can then find and use the Catalog dataset.

```bash
stacItemFile="$(cat "${dir}/catalog.json" | jq -r '[.links[] | select(.rel == "item")][0].href')"
```

This URL can also be for data available publicly on the DataHub, for example this Sentinel2_ARD item could be used as an input in the same way.

However, if you wish to pass in data from your own workspace, for example when trying to process private data in your block or object stores, or in your private catalog within the Resource Catalogue, the Workflow Runner can also make authorized requests to these locations, without any additional user configuration.

!!! info
    When we refer to "your workspace" we mean the workspace you are using to execute the workflow, i.e. the one which you are authenticated as when calling the execution endpoint. This does not depend on who deployed the workflow, only who is executing it, should you be calling a public workflow.

Given the same `stac` example above, you could also pass in a STAC item from your Resource Catalog private catalog, which will be prefixed by `api/catalogue/stac/catalogs/user/catalogs/<workspace>`.

```json
{
  "inputs": {
    "stac": "https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/catalogs/processing-results/catalogs/path/to/stac/item"
  }
}
```

Or you can pass in data from your S3 Object Storage by providing an S3 URI, prefixed with the bucket name and workspace name, for example `s3://workspaces-eodhp/<workspace>/...`.

```json
{
  "inputs": {
    "stac": "s3://workspaces-eodhp/<workspace>/item.json"
  }
}
```

You can also mount Object Store data via HTTPS, using the EODatahub workspaces domain.

```json
{
  "inputs": {
    "stac": "https://<workspace>.eodatahub-workspaces.org.uk/files/workspaces-eodhp/path/to/item.json"
  }
}
```

You can also stage data directly from your Block Store, which is mounted to the STAGEIN pod as a file system. This data is mounted at the `/workspace/pv-<workspace>/` path, so you can access your data by providing a file path prefixed with such path.

```json
{
  "inputs": {
    "stac": "/workspace/pv-<workspace>/path/to/item.json"
  }
}
```

## Accessing Data within Workflows

We have discussed above how using the STAGEIN functionality of the Workflow Runner can allow you to mount private STAC data into your workflow for processing. However, you can also load private data directly within your workflows, without relying on the STAGEIN step and also allowing you to load non-STAC data.

### Accessing S3 data within your workflows
The Workflow Runner automatically assigns AWS access credentials to your workflow during execution. This means your workflow will automatically assume these credentials and you are free to use them within your workflow steps. For example, you can instantiate a Boto3 client as in the below example, without specifying any credentials inputs to the function.

```py
import boto3

# Access is granted based on the service account of the running pod
s3_client = boto3.Client("s3")
```

### Accessing Workspace data within your workflows via HTTPS

The Workflow Runner automatically generates and provides credentials to access your workspace data within your workflow steps via HTTPS, either via access to S3 using HTTPS or through the Resource Catalogue API. These credentials are available in the Workflow Runner and need to be requested as an environment variable, `WORKSPACE_TOKEN`, within your workflow steps, so you will need to defined this variable as in this example. Ensure

This access is granted based on an additional workspace access token input, which is scoped to the workspace executing the workflow (whether executing a standard workflow or a user service). So first make sure your workflow sets this environment variable in its CWL definition.

!!! info
   To test this workflow locally, you can hardcode a token into the CWL script, rather than setting it as `<<REPLACE>>` as is required by the workflow runner to replace this variable.

To set the environment variable in your CWL, copy the following extract. This will set the `WORKSPACE_TOKEN` environment variable in your workflow container which you can use for any authenticated HTTPS requests to the Hub.

```yaml
EnvVarRequirement:
   envDef:
     WORKSPACE_TOKEN: <<REPLACE>>
```

You can then load and pass this token in the authorization header as a Bearer token, when making HTTPS requests to the Hub that need to be authorized. For example when accessing private workspace data in your catalog in the Resource Catalogue. A full workflow and Python script to test this access is provided here.

```py
import os
import requests

WORKSPACE_ACCESS_TOKEN = os.getenv("WORKSPACE_TOKEN", "your_api_token_here")

url = "https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/path/to/item"
response = requests.get(url, headers={"Authorization": f"Bearer {WORKSPACE_ACCESS_TOKEN}"})
```

### Accessing Workspace data within your workflows via Mounted Block Store

The Workflow Runner also mounts your workspace Block Store into each step of your workflow. This means you can access files in your Block Store just as if using local files within your workflow.

The Block Store is mounted at a specific file prefix, `/workspace/pv-<workspace>/...`, so you can access files here just as you would any other files in your workflow. This code first loads the files in the Block Store mount and then loads an example JSON file as a dictionary. You could add some logging statements to this example to print out the available files and file contents.

```py
import os

workpace = "<workspace>"

block_store_dir = f"/workspace/pv-{workspace}"

files = os.listdir(block_store_dir)

if files:
  with open(f"{block_store_dir}/file.json", "r") as f:
    json_file = f.read()
    json_dict = json.loads(json_file)
```

## Managing datasets in your workspace

To first manage datasets in your workspace Object and Block Stores you can use the [Notebooks](https://prod.eodatahub-workspaces.org.uk/notebooks/hub/home) (Jupyter Notebooks) application on the Hub. This allows you to upload data and create directories to organize your data as you wish. Make sure you open the Notebook in the correct workspace, which you can select from the drop-down at the top when starting your server.

You are also able to harvest datasets into your catalog within the Resource Catalogue, using the data loader functionality, available in the left-side menu on the workspaces UI. This will allow you to load STAC directly into your catalog and access this via the Resource Catalogue API.

Once you have the files you want to use in your Stores or Resource Catalogue you can construct a workflow that accesses this data either:

* Via STAGEIN when loading STAC Items for processing
* Via workflow access using S3 credentials, HTTPS or Block Store mounts