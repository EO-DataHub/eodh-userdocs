# Application packages

On the EO DataHub Workflow are defined in the form of OGC Application Packages. These packages require a script to be defined in Common Workflow Language (CWL), which is a YAML formatted file defining a service as a sequence of steps, including inputs and ouputs, both globally for the entire workflow, as well as those for each step within the workflow. Most CWL files will include references to Docker images specifying the processing that is done in each step of the workflow.

## Set up

An example CWL script, defining a Hub-compliant workflow, can be found here. This script takes as inputs: a URL to an image file, a function name and a scale factor, provided as a percentage. It then executes the chosen function on the image. In this case this function is a resize by the provided scale factor. This image is then output, along with a STAC catalogue defining the resulting image asset.

Some best practices when creating application packages can be found here and include requirements that a workflow needs to comply with in order to work correctly with the Workflow Runner API. These practices should be followed when considering the type of inputs and outputs your workflow will produce, as well as how these are handled by the workflow upon completion.

Specific restrictions of note which must be followed:

* Your final outputs must be captured in a `glob` command and must capture a directory containing a catalog.json file as well as any other outputs you wish to export, including STAC items and assets, such as GeoTIF or NetCDF files.
* You may define defaults in the workflow but these are not currently used during execution, so you must also provide these values again when executing a workflow.
* It is recommended you include resource requirements as defined below to ensure your workflow is allocated sufficient resources to run correctly on the Hub. By default this is set to 1 CPU and 1 GB of RAM. Note, that if your workflow attempts to assume more resources than defined, the workflow will fail with an Out of Memory error, so ensure you specify enough RAM. Increased resources could also lead to increased costs incurred by the execution request.
* Your workflow must produce a catalog.json STAC Catalog which points to your generated STAC items, these must be captured in the output of the CWL using a "glob".
* CWL inputs are passed as command line strings and there is a limit in how long these can be. Currently on the cluster this is 2621440 bytes, meaning longer command line arguments will lead to errors. Instead you should attempt to load such data from a file, either in S3 or your workspace Block Store, for example using the STAGEIN functionality discussed later.
B
elow is an example of defining resource requirements for a workflow step, here the user is specifying a limit of 1 CPU core and 512 MB of RAM. These can be specified for each step in your workflow and you can increase these as required.

```yaml
- class: CommandLineTool
    id: convert
    requirements:
      ResourceRequirement:
        coresMax: 1
        ramMax: 512
```

The Workflow Runner also includes two built-in steps that are run automatically, when required, for each workflow.

* A __STAGEIN__ step which is run whenever a defined workflow includes a Directory definition pointing to a STAC item. This step extracts the STAC data from the provided location and downloads it ready for local processing. The data provided in the Directory input can come from either a URL, workspace Block Store or S3 Object store. Any Directory inputs must point to a STAC item (or Feature) and the STAGEIN step then extracts all Assets within this Item and constructs a new STAC Catalog containing the Item and any assets. This new Catalog is indexed locally with local file hrefs. See this example workflow that will invoke the STAGEIN step providing a URL to a STAC Feature.
* A __STAGEOUT__ step which is always run for a workflow and has the responsibility of extracting the workflow outputs and placing them in the correct Workspace S3 Object Store location, ready for harvesting and ingesting into the Resource Catalogue. This leads to a major requirement for OGC Application Packages: that they produce valid STAC catalog outputs containing a catalog.json file and any number of STAC Features and assets. You can see a simple function that constructs a minimal STAC Catalog and STAC Items here. Upon workflow completion the generated STAC Catalog (catalog.json) file must be present in the set of results files, and it must point to any STAC Features you also wish to be output from the workflow. An example catalog.json file can be seen below:

```json
{
  "stac_version": "1.0.0",
  "id": "catalog",
  "type": "Catalog",
  "description": "Root catalog",
  "links": [
    {
      "type": "application/geo+json",
      "rel": "item",
      "href": "item.json"
    },
    {
      "type": "application/json",
      "rel": "self",
      "href": "catalog.json"
    }
  ]
}
```

And an example of a STAC Feature, item.json, generated from the same workflow:

```json
{
  "stac_version": "1.0.0",
  "id": " item -1728909682.980245290",
  "type": "Feature",
  "geometry": {
  "type": "Polygon",
  "coordinates": [
    [
      [-180, -90],
      [-180, 90],
      [180, 90],
      [180, -90],
      [-180, -90]
    ]
    ]
  },
  "properties": {
    "created": "2024-10-14T12:41:22.980Z",
    "datetime": "2024-10-14T12:41:22.980Z",
    "updated": "2024-10-14T12:41:22.980Z"
  },
  "bbox": [-180, -90, 180, 90],
  "assets": {
    " item": {
      "type": "image/png",
      "roles": ["data"],
      "href": "item.png",
      "file:size": 19133
    }
  },
  "links": [
    {
      "type": "application/json",
      "rel": "parent",
      "href": "catalog.json"
    },
    {
      "type": "application/geo+json",
      "rel": "self",
      "href": "item.json"
    },
    {
      "type": "application/json",
      "rel": "root",
      "href": "catalog.json"
    }
  ]
}
```

It is vital that these outputs are generated correctly and are captured in the workflow outputs as the Workflow Runner uses the links in these files to ensure the outputs are captured and harvested into the Resource Catalogue.

!!! info
    While a STAC Catalog and Item are required as outputs, as these are used by the STAGEOUT step to gather the outputs, you do not need to provide a STAC Collection. If you omit this, the STAGEOUT step will generate a Collection automatically, using the jobID for the execution to generate the Collection ID `col_<jobID>`.

If you do provide STAC Collections in your outputs, and link to these from your Catalog.json file, these will be harvested as they are, without the need for a new collection to be generated by the STAGEOUT.

## Advanced STAC Outputs

The Workflow Runner will harvest your STAC Catalog exactly as found in the outputs, including the IDs of your Catalog, collections and items. This means you can generate data deterministically in your workspace catalogue, so ensure the IDs you use are useful to you, as this will specify where you can find your outputs in your section of the Resource Catalogue. You are also able to leave your Catalog and Collection IDs blank, see example below, if you wish to have the STAGEOUT generate them based on the jobID of your execution. In this case your Catalog and Collection IDs will be rewritten to `cat-<jobID>` and `col-<jobID>` respectively.

```json
{
  "stac_version": "1.0.0",
  "id": "",
  "type": "Catalog",
  "description": "Root catalog",
  "links": [
    {
      "type": "application/geo+json",
      "rel": "item",
      "href": "item.json"
    },
    {
      "type": "application/json",
      "rel": "self",
      "href": "catalog.json"
    }
  ]
}
```

## Workflow Restrictions

There are certain restrictions that the Workflow Runner requires when attempting to deploy a workflow to the Hub:

* Any steps in your top level workflow cannot begin with the keywords `node_stage_in` or `node_stage_out` as these are reserved for the Workflow Runner internal steps
* Your workflow cannot include the following inputs, as, again, they are reserved for internal use only
    * STAGE_AWS_ACCESS_KEY_ID
    * STAGE_AWS_SECRET_ACCESS_KEY
    * STAGE_AWS_SESSION_TOKEN
    * CALLING_WORKSPACE_ACCESS_TOKEN

!!! note
    Attempting to deploy a workflow that does not meet these criteria will result in a 400 Bad Request response, with the content detail clarifying what caused the error.