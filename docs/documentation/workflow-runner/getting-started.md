# Getting started with Workflows

To get started with the Workflow Runner (WR) a number of example EODH workflows and a Jupyter Notebook that will guide you through deploying and executing them are provided [in this repository](https://github.com/EO-DataHub/example-workflows). The examples take you through deploying, viewing and executing workflows using Python in a Jupyter Notebook. You can deploy workflows from URLs pointing to CWL scripts as well as from local files, passed in as the data parameter of the HTTP request.

## Setting Up Your Account

Before you start using the WR you will need to create a Hub account and then set up an account and workspace under manage account. You account will need to be approved by a Hub Administrator, and can take a few hours to be created but if your workspace is still not available after a number of hours, please contact the Hub Admin team.

## Some Basic Requests

Once you have a workflow you wish to run on the Hub, you will need to send a number of HTTP requests to first deploy your workflow and then execute it with your inputs. These steps will use the convert-url workflow defined here, so download this file and save it locally under the file name `convert-url-app.cwl`. This is a Common Workflow Language definition for our workflow which uses a Docker image created from this repo. This workflow accepts an image as an input and resizes it by a given percentage scale factor.

We will build up an HTTP file that looks something like this file, to allow you to repeat these steps in future and deploy and execute other workflows. While you are able to send these HTTP requests using CURL or Postman, it is recommended you use an HTTP client in your IDE to allow you to send these requests directly from your code. The following examples will assume you have the HTTP client installed in your IDE, but you can of course rewrite the requests to work with any extensions you wish, as they are standard HTTP requests.

### Set environment variables to be used in requests

Create an HTTP file called `workflow-runner.http` and copy the following code into it.

```bash
@api_token = <your-token>

@scheme = https
@hubDomain = eodatahub.org.uk
@api = api/catalogue/stac/catalogs/user/catalogs
@workspace = <workspace-name>

@executeStatus = {{executeProcess.response.headers.Location}}
```

The variables defined here, preceded by `@`, are usable in subsequent requests by encasing them in double curly braces, e.g. `{{<variable>}}`, so that they are correctly replaced when the request is run.

Now extract an API Token from the [Workspaces UI](https://staging.eodatahub.org.uk/workspaces/) by selecting Credentials from the left menu. Select `Request New Token` and copy the generated API Key into your HTTP file. You can also set the workspace to be your workspace name.

The bottom line sets up some variables that will be set by some of the responses to our requests, making it easier to send some later requests, rather than having to copy links from the responses, so leave these as they are for now.

## Set up your first requests

Next we can start writing some basic requests which will help set up the Hub to execute our workflow.

Copy the below into your HTTP file to set up a request that will list the available processes you have in your workspace. It is important that you include `###` after each request to properly separate them and ensure they compile with the extension.

```bash
###
# @name listProcesses
GET {{scheme}}://{{hubDomain}}/{{api}}/{{workspace}}/processes HTTP/1.1
Authorization: Bearer {{api_token}}
Accept: application/json
###
```

This request sends a GET request to get the list of available processes in the selected workspace. We also define a number of headers on the lines below the request, e.g. the Authorization header containing your API Token and the Accept header specifying the Content Type we expect to receive in response.

By default, this will return a workflow called `echo` that shows the sort of details you will get in a response to this request. You must send your API Token in this request as the workflows in your workspace will be private, meaning only you are able to view, execute and make changes to them.

The next request will allow us to view some more details about this workflow, so copy this into your file and try running it.

```bash
###
# @name getProcess
GET {{scheme}}://{{hubDomain}}/{{api}}/{{workspace}}/processes/echo HTTP/1.1
Authorization: Bearer {{api_token}}
Accept: application/json
###
```

You will get a JSON response providing some more details about the workflow, including the ID, description and any inputs and outputs. This is only an example workflow so it isn't very useful for us now, but we can use this request to get details about any other workflows we have access to, so feel free to try sending this again exchanging the `echo` workflow ID for any other ID you wish to view.

## Deploying a Workflow

Now we are ready to try deploying our `convert-url` workflow to the Hub Workflow Runner in preparation for doing some executing on the Platform. The following request will deploy your workflow from a local file, so make sure you have your `convert-url-app.cwl` file in the same directory as your `workflow-runner-http` file. Copy the following block into your file.

```bash
###
# @name deployProcessFile
POST {{scheme}}://{{hubDomain}}/{{api}}/{{workspace}}/processes HTTP/1.1
Authorization: Bearer {{api_token}}
Accept: application/json
Content-Type: application/cwl+yaml

< convert-url-app.cwl
###
```

This request will take the local CWL file and deploy the script to the Workflow Runner, ready for future execution. This should result in a `204` response meaning the workflow was correctly deployed and is ready for execution. You can check the workflow is now available by using the request from above to view more details about the workflow.

```bash
###
# @name getProcess
GET {{scheme}}://{{hubDomain}}/{{api}}/{{workspace}}/processes/convert-url HTTP/1.1
Authorization: Bearer {{api_token}}
Accept: application/json
###
```

## Executing a Workflow

Now that we have confirmed the workflow was successfully deployed it is ready for us to execute on the Hub. To do this we need to provide some inputs as defined in the CWL script. The `convert-url` workflow expects three inputs:

* fn: The function to compute on the inputs
* url: The URL to the image we wish to process
* size: The scale factor, as a percentage, to rescale the image by

Here, we will compute the `resize` function on the image located here and rescale it by 50%, constructing the following request.

```bash
###
# @name executeProcess
POST {{scheme}}://{{hubDomain}}/{{api}}/{{workspace}}/processes/convert-url/execution HTTP/1.1
Authorization: Bearer {{api_token}}
Accept: application/json
Content-Type: application/json
Prefer: respond-async

{
  "inputs": {
      "fn": "resize",
      "url":  "https://raw.githubusercontent.com/EO-DataHub/eodhp-ades-demonstration/refs/heads/main/DataHub-Logo.PNG",
      "size": "50%"
  }
}
###
```

You will get a `201` response from the API stating that the job has been created which means your workflow is now executing. The JSON response will also include the jobID for this execution, which we can use to view more details about the Job while it is progressing, so make sure you keep this for the following requests. You should also note that the location of the status endpoint is included in the `Location` header of the response, for example https://staging.eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace-name>/jobs/<jobID>.

The line at the top of our HTTP file extracts this header automatically into the executeStatus variable: {{executeProcess.response.headers.Location}}, more on this in the next section.

## Monitoring Workflow Progress

After executing a workflow you can monitor its status using the Location header returned from the previous request which we now have saved into the `executeStatus` variable, as follows.

```bash
###
# @name getExecuteStatus
GET {{executeStatus}} HTTP/1.1
Authorization: Bearer {{api_token}}
Accept: application/json
###
```

This request uses the variable we defined above, but we can also construct this URL manually using the jobID we recorded above.

```bash
###
# @name jobStatus
GET {{scheme}}://{{hubDomain}}/{{api}}/{{workspace}}/jobs/<jobID> HTTP/1.1
Authorization: Bearer {{api_token}}
Accept: application/json
###
```

This request returns JSON defining some details about the workflow execution. This includes the current status, such as `running` or `successful`, and a message giving additional details, such as `execution submitted`, `delivering outputs, logs and usage report` or `ZOO-Kernel successfully run your service!`

Upon workflow completion this endpoint will also return logs generated during workflow execution. These will be populated under the `links` field. Look for those with a title beginning with `Tool log ...`. You can open these links in a browser to view the full log files generated by your workflow.

Next, we can view the workflow outputs by calling the results endpoint provided by the API.

```bash
###
# @name jobResults
GET {{scheme}}://{{hubDomain}}/{{api}}/{{workspace}}/jobs/<jobID>/results HTTP/1.1
Authorization: Bearer {{api_token}}
Accept: application/json
###
```

You'll notice this endpoint is simply the status endpoint from before but with the `/results` prefix appended to the end.

This request returns a STAC Collection containing the STAC Items generated by your workflow. These items are listed under the `links` in the Collection, with each link pointing to the location in the S3 Object Store. Look for the item link and open one of these `href` in your browser to view the raw STAC item generated by the workflow. The images generated by your workflow can be found in the assets of these items. For our example workflow, look for the PNG file asset in the STAC Item, which will contain the `.png` suffix in the filename. You can download and open this file and see that it is indeed the rescaled image from our inputs.

## Additional Endpoints

The Workflow Runner also includes some other useful endpoints which we will briefly discuss here. But please feel free to try them out should you wish to advance your understanding.

### Listing Jobs

You are able to list all the jobs that have been executed in your workspace using the following request

```bash
###
# @name getJobs
GET {{scheme}}://{{hubDomain}}/{{api}}/{{workspace}}/jobs HTTP/1.1
Authorization: Bearer {{api_token}}
Accept: application/json
###
``` 

### Deleting Jobs
You can also delete a job while it is running, should it be taking longer than expected, for example.

```bash
###
# @name deleteJob
GET {{scheme}}://{{hubDomain}}/{{api}}/{{workspace}}/jobs/<jobID> HTTP/1.1
Authorization: Bearer {{api_token}}
Accept: application/json
###
```

### Updating a Workflow

You can also update a previously deployed workflow, should you wish to change the version or some other details in the CWL definition. Make sure the workflow ID in your request URL matches that defined in the CWL script.
```bash
###
# @name updateProcessFile
PUT {{scheme}}://{{hubDomain}}/{{api}}/{{workspace}}/processes/convert-url HTTP/1.1
Authorization: Bearer {{api_token}}
Accept: application/json
Content-Type: application/cwl+yaml

< convert-url-app.cwl
###
```

### Deploying via URL

You can also deploy and update workflows by passing the URL to your workflow, rather than first downloading it and then sending it as data in the request. To do this you need the URL to the raw CWL file located at a public address.

```bash
###
# @name deployProcessURL
POST {{scheme}}://{{hubDomain}}/{{api}}/{{workspace}}/processes HTTP/1.1
Authorization: Bearer {{api_token}}
Accept: application/json
Content-Type: application/json

{
  "executionUnit": {
    "href": "https://raw.githubusercontent.com/EO-DataHub/ades-workflow-examples/refs/heads/main/working-url/convert-url-app.cwl",
    "type": "application/cwl"
  }
}
```

### Deleting a Workflow

Finally, you can remove workflows from your workspace, should you no longer want it to be available to you.

```bash
###
# @name deleteProcess
DELETE {{scheme}}://{{hubDomain}}/{{api}}/{{workspace}}/processes/convert-url HTTP/1.1
Authorization: Bearer {{api_token}}
Accept: application/json
###
```

## More Examples

The following repositories are also available to demonstrate WR functionality:

* [ades-workflow-examples](https://github.com/EO-DataHub/ades-workflow-examples/tree/main) – a set of workflows that demonstrate both successful executions as well as a range of failure modes to present the logs that will be available in each case. This repository also incudes shell scripts and Dockerfiles demonstrating how the workflows were created.
* [eodhp-ades-workspace-access](https://github.com/EO-DataHub/eodhp-ades-workspace-access) – a set of workflows that demonstrate workspace data access within workflows. One shows that workspace S3 data can be accessed within a workflow, and the other demonstrates GDAL functionality within a workflow step.
* [Integration with pyeodh](https://github.com/EO-DataHub/eodhp-guide/blob/main/examples/uc9-data-discovery-and-analysis/data-discovery.ipynb) – you are also able to deploy and execute workflows using the pyeodh client. This Jupyter Notebook includes some example functions to demonstrate this functionality.

The examples in these repositories can be used as a template to start writing your own CWL and workflow scripts and the code will also get you familiar with the endpoints provided by the WR and the sort of results you might expect.