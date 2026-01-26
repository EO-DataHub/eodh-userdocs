Authentication
The Workflow Runner uses workspace-scoped API Tokens to authorize access to workflows and processing. This means any requests are made for a specific workspace, determining access to workflows as well as specifying which workspace a workflow will be executed in.

In order to make use of the Workflow Runner API, you will need to make authorized requests using a workspace-scoped API Token. These can be generated from the Workspaces UI. Make sure you first login to the Hub and then select the workspace you wish to use from the list on the left of the page. You can be a member of multiple workspaces, so this may be a substantial list. Always ensure you have selected the correct workspace which you want to use to access the Workflow Runner, as this will determine which workflows you have access to as well as who will be charged for your processing usage. You can confirm the workspace in the `scope` of the token once you have requested a new token.

To use this token in your API requests you should send it in the Authorization header of your requests, as a Bearer token, for example when sending a request with CURL

curl https://staging.eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/processes/<workflow-id> -H 'Authorization: Bearer <api-token>'
Or with the Python requests library

import requests

response = requests.get( 
  "https://staging.eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/processes/<workflow-id>", 
  headers={
    "Authorization": "Bearer <api-token>"
  }
)
All workflows are registered to a specific workspace in which they were deployed. Therefore, to access workflows, you will need to specify the workspace you are trying to access within the URL, as follows: https://staging.eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/processes

By default you will have access to any workflows defined in your workspace, so provided your workspace-scoped token aligns with that in the URL, you can access and make changes to the workflows within that workspace. Any workflows you deploy will be set as private meaning only those who can access the workspace that defined them, and therefore can take out workspace-scoped tokens for that workspace, can access them. However, you can also publish workflows for other users to access and execute. To do this you will need to update the access policy for your workspace to set the workflow either as public or as a user-service, meaning other users can access and execute the workflow from their own workspaces.

Further guidance on updating access policies can be found here in the Hub documentation.