# Workspace usage

When you execute a workflow, it is automatically run within a dedicated workspace namespace in the cluster. This namespace is associated with the workspace you use to execute a workflow which also determines:

* The access a workflow has to data hosted on the Hub.
* Billing information for resource usage (coming soon)

## Workspace-Scoped Tokens

Workflows require workspace-scoped access tokens to access and execute. These tokens can be generated in the workspaces UI under `Credentials` in the left menu panel. It is the workspace defined in this token that will be used to determine workflow access when attempting to view the available workflows in a workspace. This workspace will also be used when executing a workflow, specifying the calling workspace, and often the executing workspace as well. This determines the data you are able to load within the workflow as well as where the workflow outputs will be saved.

## Workspace Interaction
When a workflow is executed, up to three workspaces can be involved:

The deploying workspace:

* This workspace is defined in the URL of the workflow call: `/api/catalogue/stac/catalogs/user/catalogs/<workspace>/...`
* This workspace defines the workspace that original defined and deployed the workflow to the Hub. This is the only workspace that can make changes to the workflow, including removing it from the workspace itself
* This workspace can also make changes to the access policy for the workflow, including setting it public or configuring it as a user-service, both allowing other workspaces to access and execute the workflow

The calling workspace:

* This workspace is defined in the workspace-scoped token uses when making requests to the Workflow Runner, look at the scope of your API token which will look something like `workspace:<workspace>`
* This workspace also specifies the data hosted on the Hub that the workflow will be able to access in the STAGEIN, either via HTTPS, S3 or via the mounted Block Store
* This workspace also configures where the workflow outputs will be harvested. It is in the private workspace catalogue that is associated with this workspace that the workflow outputs will be ingested. So outputs will be available in the processing-results sub-catalog within the workspace private catalog, accessed via the Resource Catalogue API: `/api/catalogue/stac/catalogs/user/catalogs/<workspace>/catalogs/processing-results/...`
* This workspace also defines which workspace will be able to monitor the status of the workflow, using the status endpoints, as well as access the logs and workflow outputs as returned by the results endpoint.

The executing workspace:

* This workspace is configured by the Workflow Runner itself, based on the calling workspace and the workflow access policy, and does not need to be provided by the user
* This workspace defines the namespace in which the workflow will actually be executed, specifying the data accessible to the steps of the workflow, via HTTPS, S3 or Block Store, as well as recording resource usage against the workspace to be used for accounting and billing services (future release)
* In most cases, this workspace will be set equal to the calling workspace, as workflows will usually be executed within the same workspace that original called for the execution
* For public workflows, the executing workspace will be equal to the calling workspace, as these workflows are taken from the deploying workspace and executed in the calling workspace, with inputs and workflow steps being allowed access to the calling workspace's private data
* For user-services, the executing workspace will be equal to the deploying workspace, as these workflows are executed within the user-service owner's workspace (which is equal to the deploying workspace, as discussed above). Workflow inputs can be taken from the calling workspace's private data while the executing steps can only access the deploying workspace's private data


!!! note

    These workspaces work together to check workflow access, check the data access for a workflow inputs and execution, as well as recording resource usage for accounting and billing.

!!! tip

    You only need to configure the deploying workspace and calling workspace, the Workflow Runner will automatically determine the executing workspace based on the workflow configuration.