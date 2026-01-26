Introduction
What is the Workflow Runner and How Can I Use It?
The Workflow Runner (WR) component of the DataHub allows users and applications to execute workflows using the processing available on the Hub. This allows for complex computation to be carried out on datasets remotely, with the outputs available to the users and applications via the Resource Catalogue (RC) and Workspace Object Storage (S3) upon completion.


Interaction with the WR is handled via an API, with endpoints provided to deploy, update, delete and execute workflows as well as for monitoring the execution of a job once started. Logs are also available upon workflow completion. Swagger API documentation is available for the WR API here. This page can be used to be view the provided endpoints, including any expected inputs, as well as send requests to the API, should you wish to try using the WR. Note, to send requests you will need a Hub account and workspace set up, documentation is available here to get you started.

The main process when using the workflow runner is as follows:

User generates access credentials
User deploys their workflow to a workspace via the WR API
User executes their workflow providing any inputs as required by the workflow specification
User monitors their workflow execution
Upon workflow completion, user can view workflow outputs in their workspace - either in the Resource Catalogue or S3 object store
Advanced Functionality
Users are also able to define access policies for their workflows. This allows for two additional workflow types to be defined by workflow developers.

Public Workflows
Public workflows are processes which other users can access and execute in their own workspace, independent of the owning workspace. The new user can provide their own inputs and will then be able to view the outputs in their own workspace stores. Workflows are private by default but can be configured to be public in a workspace access policy file.

User-Services
A user-service is a workflow that is available publicly to other workspaces, but will only be executed within the owning workspace. This allows workflow developers to publish their workflows for other Hub users, providing a service to these users. This ensures that any processing usage is recorded against the user-service owner, rather than the calling users. It also means the workflow can access data that is private to the user-service owning workspace, that the calling user would otherwise not have access to.

Configuring Workflows
By default, all workflows are private to users in the workspace that deployed the workflow. If you wish to configure one of your workflows to be public or a user-service, this can be achieved by uploading your own access-policy file via the Hub Data-Loader, in the workspaces page. For any other help on this, please contact a Hub administrator.