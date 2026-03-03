# App workflows and user services

A key way to provide applications to users is to define and deploy services via the Hub. These can be made available to other users via an API allowing them to carry out processing on their own datasets. This can be done via the Workflow Runner, in particular by deploying and publishing user services for other users.

## Workflows

A workflow is an OGC Application Packaged defined using Common Workflow Language, or CWL. This is a process description defining a sequence of processing on given inputs. A single workflow can define a number of steps, with the outputs from one step being fed into another, in order to generate a final results output, structures in a STAC Catalog. An example for such a process might be the calculate of Normalised Difference Vegetation Index, or NDVI, to generate an output file identifying areas of significant vegetation, for use in climate change studies and the impact on greenery.

Such a workflow might be written by a developer and published on the Hub for others to discover and use, using their own inputs either hosted on the Hub or uploaded by the user themselves. Such workflows will be provided as an API endpoint which can be shared with other users should they want to use these workflows.

This functionality allows users to develop and share their processing workflows as applications, while also providing cloud processing resources on which to run the workflows. Using the Hub's infrastructure will enable easier execution for user's who are less experienced with CWL or cloud-processing.

### Publishing Workflows

As an extension to Workflows, application developers can also publish their workflows for others to use, who do not have access to the workspace in which they were deployed. Setting a workflow public can be done via the Data Loader, by defining an access policy for your workflow and marking it as public.

```json
{
    "block-store": {},
    "object-store": {},
    "catalogue": {},
    "workflows": {
        "<workflow-id>": {
            "access": "public"
        }
    }
}
```

When this access policy is loaded into the Hub, it will update the specified workflow to be public, meaning other users can view and execute the workflow deployed into <workspace> using the API endpoint: 

```bash
/api/catalogue/stac/catalogs/user/catalogs/<workspace>/processes/<workflow-id>/execution
```

### Accounts and Billing

!!! note
    When a public workflow is executed by another workspace, it will be executed within that calling workspace, with any billing and charges being sent to that workspace, rather than the deploying workspace.

While the workspace is deployed to one workspace and executed in another, access is still handle as if the calling workspace owned that workflow, no additional access is allowed to the deploying workspace.

## User Services

An additional function when publishing workflows is to specify a workflow as a user service. This also allows other users to access the workflow, just as with setting it public, however this time the workflow will be executed within the deploying workspace, rather than the calling workspace.

### Accounts and Billing

As a user service is executed within the deploying workspace, any charges incurred will be sent to this workspace, rather than the calling workspace. It is then up to the deploying workspace account owner to settle these charges.

A user-service can be deployed as normal via the Workflow Runner API and then the access-policy for this workflow can be updated by specifying the type for that workflow as as "user-service".

```json
{
    "block-store": {},
    "object-store": {},
    "catalogue": {},
    "workflows": {
        "<workflow-id>": {
            "access": "private", 
            "type": "user-service"
        }
    }
}
```

Here, we specify the workflow as private, but also a user-service. Setting the type as a "user-service" will overwrite the "public" setting ensuring the workflow is only available as a user-service, rather than as a normal public workflow.

## Access Control

Note, when a workflow is executed in a workspace, it gains access to the object and block stores associated with that workspace, it can also use a workspace-scoped token for that workspace, meaning when a user service is executed, it can still make calls to the deploying workspace data stores. This allows the workflow to make use of workspace data that is private only to the deploying workspace. This is a key difference from simply publishing a workflow as public, as access there is restricted to only the calling workspace, just as when you execute a workflow deployed in your own workspace.

## Example Use Case

An example use case might be a workflow that takes some input, applies a preconfigured mask, and returns a final image. This workflow is deployed as a user service by workspace A and it being invoked by workspace X. In this case, the mask details can be stored in A's object store, and then inputs can come from workspace X's object store. The user service will have the correct access to retrieve the data first from X's store, and then from the A's object store, before returning the final output file to X's object store and resource catalogue sub-catalog.

## Example Workflow Applications

Some example published workflows are available at the following API endpoints, these are public, and not user services, meaning the services will be executed within the calling workspace and any associated resource usage will be logged against that workspace. You will need a valid workspace-scoped token in order to access these endpoints, please pass your token in the authorization header of your requests as a Bearer token: "Authorization: Bearer <your-token>".

* Take an image specified by a URL and [resize it by a given scale percentage](https://prod.eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/demo-workflows/processes/convert-url)
* Take an image specified by a [STAC item and resize it by a given scale percentage](https://prod.eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/demo-workflows/processes/convert-stac)
* Take STAC items, an area of interest, EPSG definition and a set of bands to [identify water bodies](https://prod.eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/demo-workflows/processes/water-bodies) based on NDWI and Otsu threshold

See some example inputs for these services in [this Notebook](https://github.com/EO-DataHub/eodhp-ades-demonstration/blob/main/eodhp-ades-demonstration.ipynb).