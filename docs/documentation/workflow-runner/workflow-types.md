# Workflow types

While most workflows will be deployed and executed within the same workspace, the Hub also offers functionality to publish workflows for other users to view and execute, with their own inputs. There are two main ways to publish workflows, one being to make them public and the other is to mark them as user-services.

## Workflow Access Policies

The Workflow Runner supports public workflows and user-services, allowing other workspaces to find and execute these workflows. This is configured by the deploying workspace when a user defines an access policy configuration file for that workflow, specifying the following:

* A workflow is public - available to all Hub users, executed within the calling workspace, with access only to the calling workspace.
* A workflow is a User-service - available to all Hub users but only executable within the owning workspace, not the calling workspace, with some additional access to the user-service owner's workspace.

### Public Workflows
The Workflow Runner supports public workflows, allowing all workspaces to find and execute this workflow. When a workflow is set as public, it will be available to all Hub users and executed within the calling workspace.

These workflows are available by searching for any workflows under the workspace that owns the workflow. For example, workspace X wishes to make use of a workflow defined by workspace Y. This workflow will be available at `api/catalogue/stac/catalogs/user/catalogs/Y/processes`, the Workflow Runner then checks the access policy for the workflow and if the workflow if public, workspace X can view and execute the workflow. The workflow will be executed entirely within workspace X, with inputs also coming from workspace X, if required.

This workflow will be executed entirely within the calling workspace, meaning access is restricted in all steps to data within this workspace, irrespective of the deploying workspace.

### User-Services

When a workflow is set as a User-service it is available to all Hub users but only executable within the owning workspace, not the calling workspace. This means the resource usage is attributed to the owning workspace, allowing developers to deploy their workflows as public services which they can then bill users for (future functionality).

These workflows will appear to all users who attempt to find them under the owning workspace, but they will be executed in the deploying workspace. Inputs can still be provided from the calling workspace, and outputs will be delivered to the calling workspace as well.

If workspace X wishes to use a user-services deployed by workspace Y, the workflow will be available at `api/catalogue/stac/catalogs/user/catalogs/Y/processes` and when executed it will be run within workspace Y, allowing initial inputs, if required, to be loaded form workspace X.

The workflow steps in a user-service execution will have some additional access to the user-service owner's workspace, meaning reading file from HTTPS, S3 or the Block Store will work just the same, whether the workflow is called by the deploying workspace, or some other workspace.

User-Service owners will also be able to view the status, results and logs from these workflows, even if they were not the original calling workspace, this should help with debugging where required. 

!!! info
    If no workflow configuration is provided, or it is invalid, the workflow defaults to private and can only be run by the someone with a workspace-scoped token scoped to the deploying workspace. 