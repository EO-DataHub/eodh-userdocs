# Data publishing

The Hub allows users to upload and publish their data for others to access and use, for example in workflow processing or Jupyter Notebooks. This guide will take you through first how to upload metadata to your workspace, how to upload associated data files to your workspace and then how to publish this data so others can discover it via the Hub APIs.

## What is Metadata?

Metadata on the Hub takes the form of SpatioTemporal Asset Catalogs (STAC), which provides definitions for datasets formatted as JSON files, similar to GEOJSON, with agreed keys such as spatial and temporal data. STAC provides a standardized way to expose collections of spatial temporal data. STAC is used through the DataHub, including in our Resource Catalogue API, see this example here for a dataset hosted on the Hub. This example is for a STAC Collection with links to a number of Items, which define the actual data points in the dataset. Each Item may then contain a number of assets, which are files containing the data defined inside the dataset, for example these might be COG (Cloud-Optimised GeoTIFS) or NetCDF files.

## Uploading Metadata

The Hub provides a Metadata Loader which can be used to upload metadata into the your workspace object stores for this to then be harvested into the workspace Catalog within the Resource Catalogue on the Hub. The Data Loader takes STAC metadata files and loads these into your private workspace Catalog.

First navigate to the [Workspaces](https://staging.eodatahub.org.uk/workspaces/) page on the Hub, logging in if necessary, and select the workspace you wish to load data into from the icons on the left. Then select STAC Metadata Loader from the menu on the left side of the page.

__INSERT IMAGE__

The first step is to select the Catalog in which you wish to load your new STAC metadata. The available catalogs in your workspace will be listed in the drop-down, in descending order of depth. Select the Catalog in which you wish to load your STAC metadata.

__INSERT IMAGE__

As STAC data is organised into Catalogs, Collections and Items, you must next select the Collection you wish to load any STAC Items into. Another drop-down list is provided containing any Collections within the selected Catalog, if instead you wish to load your data into a new Collection, you can specify a new Collection ID in the text box, to invoke the creation of a new template Collection.

__INSERT IMAGE__

Some CTA boxes are also provided to quickly view details of the Catalog, Collection and current Items before uploading your data to ensure you are happy with your selections.

__INSERT IMAGE__

Now you are ready to upload your STAC Item metadata files. Select the Choose Files box and select any STAC Items you wish to upload to your selected Catalog and Collection.

__INSERT IMAGE__

Once you have selected the Items you wish to upload to your selected Catalog and Collection, click the Submit button.

__INSERT IMAGE__

This will send your chosen Items for validation to ensure they are valid STAC JSON before you upload them to the Hub. Note, throughout the validation, uploading and loading steps process updates will be reported in the bottom left of the page to update you on the status of your loader.

__INSERT IMAGE__

The final loading step may take some time to complete, but once done so you will see the View Data button available which will take you directly to the Items you just uploaded inside the resource Catalogue.

An example STAC Feature Collection below.

```json
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "stac_version": "1.0.0",
      "stac_extensions": [],
      "id": "test-item",
      "collection": "test",
      ...
    },
    {
      "type": "Feature",
      "stac_version": "1.0.0",
      "stac_extensions": [],
      "id": "test-item-2",
      "collection": "test",
      ...
    },
    {
      "type": "Feature",
      "stac_version": "1.0.0",
      "stac_extensions": [],
      "id": "test-item-3",
      "collection": "test",
      ...
    }
  ]
}
```

## Uploading Data

STAC metadata is usually associated with some data which is of most use to scientists and app-developers. This data can take many forms but is often provided as COGs or GEOTIFS, and these are linked to in the assets sections of STAC Items.

To upload data files to your workspace, you will need to use the S3 credentials generated from the Workspaces UI, or you can use the S3 directory in a Jupyter Notebook, launched in the correct workspace. These processes will upload your files to your Workspace object store, and can then be accessed either via an S3 client, inside your Jupyter Notebook or via HTTPS, just as with other object store data files.

In order for this data to be discoverable within the Resource Catalogue, you need to make sure the STAC Items you load have the assets correctly linked to. The assets in your Item must follow the below structure.

```json
"assets": {
    "asset-title": {
        "href": "https://<workspace>.workspaces.eodhp.eco-ke-staging.com/files/workspaces-eodhp/path/to/data/asset",
        "type": "image/png",
        "roles": [
            "data"
        ]
    }
}
```

!!! tip

    You need to construct the HREF link based on the location of the file inside your object store. 
    
    For example, if you upload a file to your workspace, called `test-workspace`, with the object store at `/saved-data/assets/asset1.tif` you can construct your HTTP reference for that file as `https://test-workspace.workspaces.<domain>/files/workspaces-eodhp/saved-data/assets/asset1.tif`. 

    Once you have added this HREF to your STAC Item you can upload and load it following the previous guidance and your asset will then be accessible directly from the asset links provided in the Resource Catalogue STAC entry for this Item.


## Publishing Datasets

Currently, all the metadata and data uploaded previously in this tutorial will be set as private in the workspace object store and Resource Catalogue, meaning it is only accessible to users who are a member of the workspace that owns the data in the Hub. However, you are also able to publish data so that others can find it publicly without needing to be a member of the owning workspace.

Data publishing is handled via the Publisher, with inputs also being structured as JSON but with a unique format that must be followed to update the access policies for your data.

Access policies allow you to specify directories (datasets) and data within your workspace that are marked as public or private. You can set these policies for the following workspace data:

* Workspace Object Store Data
* Workspace Block Store Data
* Resource Catalogue entries
* Workflows

The Publisher allows you to configure the access policies by uploading a JSON file defining paths with associated access settings, as in the below example.

```json
{
    "block-store": {
        "/path/to/directory": {"access": "public"},
        "/path/to/file/another.json": {"access": "private"}
    },
    "object-store": {
        "/path/to/file/qa-check": {"access": "public"}
    },
    "catalogue": {
        "/catalogs/user/catalogs/workspace/catalogs/test-catalog": {"access": "public"},
"/catalogs/user/catalogs/workspace/catalogs/other-test-catalog/collections/test-collection": {"access": "public"}
    },
    "workflows": {
        "my-workflow-name": {"access": "public"}
    }
}
```

This example marks the following block store paths as public:

```bash
/path/to/directory
/path/tofile/another.json
```

It also marks the following object store data as public:

```bash
/path/to/file/qa-check
```

As well as the following Catalog and Collection in the Resource Catalogue as public:

```bash
/catalogs/user/catalogs/workspace/catalogs/test-catalog
/catalogs/user/catalogs/workspace/catalogs/other-test-catalog/collections/test-collection
```

And marks the following workflow as public:

```bash
my-workflow-name
```

Once you have configured such a file locally, you can then apply this access policy to your workspace. To do so, first open the Publisher page in the Workspaces UI

__INSERT IMAGE__

Select the file you wish to upload.

__INSERT IMAGE__

Then click Submit to validate the file and upload it to apply the changed to your workspace data stores.

You can now verify the access has been applied by attempting to access any files you have set as public from an unauthenticated browser, via HTTPS, or for workflows you can try accessing the Workflow Runner API process definitions for any of your public workflows with another user account.

For example for a workflow output located at the following URL in the Resource Catalogue `https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/catalogs/processing-results/catalogs/<workflow-id>` logout of the Hub using the Homepage and revisit the URL to confirm you can access the data without authentication.

