Supported endpoints
The Workflow Runner offers a number of endpoints via an API to interact with the available workflows, deploying new ones to your workspaces, executing them and monitoring their progress. The easiest way to learn the available functionality is to view the Swagger Documentation for the API, which includes all the available endpoints and allows you to send requests directly from the Swagger UI. Note, you will need to authorize with a workspace-scoped API token via the Authorize switch in the top right.

Available Endpoints
The following endpoints are currently supported by the Workflow Runner API. The first line of each defines the request format and any subsequent lines define the different types of HTTP requests supported and the expected response.

https://eodatahub.org.uk/api/docs/workflow-runner
>>> Get - Workflow Runner Swagger Docs

https://eodatahub.org.uk/api/docs/workflow-runner/ping
>>> Get - Status endpoint to check API availability

https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/processes/<workflowID>
>>> GET - View workflow details for specified workflow

>>> PUT - Update workflow in the workspace

>>> DELETE - Un-deploy workflow from the workspace

https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/processes
>>> GET - View all workflows in given workspace

>>> POST - Deploy new workflow to the workspace

https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/processes/<workflowID>/execution
>>> POST - Execute workflow using provided inputs

https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs/<jobID>
>>> Get - View job status

https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs/<jobID>
>>> Delete - Delete job

https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs/<jobID>/results
>>> Get - View workflow results collection for specified job

https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs
>>> Get - View all jobs in specified workspace

https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs/<jobID>/filename.log
>>> Get - View specified log file for given job
