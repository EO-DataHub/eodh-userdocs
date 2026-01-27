# Workflow Logs

Once your workflow execution has completed, either successfully or with a failure, you will be able to view logs detailing the execution process. Links to logs are provided in response to the job status request mentioned in the Getting Started guide and can be viewed in the browser. Note, it can sometimes take up to 30 seconds for the logs to be generated and returned by this endpoint, so please send the request again if the links are initially missing.

The below gives an example response to the status endpoint, which contains links to the logs generated for this workflow execution. This include a log for the built-in STAGEOUT step, titled `Tool log node_stage_out.log`, as well as the workflow step itself, here titled `Tool log test-step.log`.

```json
{
  "id": "c7bdbb50-1477-11f0-922f-c217930f6509",
  "jobID": "c7bdbb50-1477-11f0-922f-c217930f6509",
  "type": "process",
  "processID": "workflow-test",
  "created": "2025-04-08T12:48:33.675Z",
  "started": "2025-04-08T12:48:33.675Z",
  "finished": "2025-04-08T12:49:31.731Z",
  "updated": "2025-04-08T12:49:31.509Z",
  "status": "successful",
  "message": "ZOO-Kernel successfully run your service!",
  "links": [
    {
      "title": "Status location",
      "rel": "monitor",
      "type": "application/json",
      "href": "https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs/c7bdbb50-1477-11f0-922f-c217930f6509"
    },
    {
      "title": "Result location",
      "rel": "http://www.opengis.net/def/rel/ogc/1.0/results",
      "type": "application/json",
      "href": "https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs/c7bdbb50-1477-11f0-922f-c217930f6509/results"
    },
    {
      "href": "https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs/c7bdbb50-1477-11f0-922f-c217930f6509/test-step.log",
      "title": "Tool log test-step.log",
      "rel": "related",
      "type": "text/plain"
    },
    {
      "href": "https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs/c7bdbb50-1477-11f0-922f-c217930f6509/node_stage_out.log",
      "title": "Tool log node_stage_out.log",
      "rel": "related",
      "type": "text/plain"
    }
  ]
}
```

A number of log files are produced when a workflow finished executing, these include:

* node_stage_in.log – logs from the __STAGEIN__ step of the workflow, these can be useful if your inputs to the workflow are incorrect or not accessible to the Workflow Runner
* node_stage_out.log – logs from the __STAGEOUT__ step of the workflow, these are useful when your workflow failed to generate the expected STAC files or they were generated incorrectly
* <step>.log files – these are generated for each step in your CWL workflow and contain the stdout from the step execution code, helping you to determine errors within the steps of your workflow. It is suggested you try running your workflow locally before deploying to the Hub to avoid workflow errors as much as possible.

## Logging Authorisation

Logs require authentication and authorisation to view and only the workspace which initially requested the workflow execution, known as the calling workspace as described here, can view the associated status and logs.

## Logging Details

In some cases, you will also see logging details included in the "message" key of the status response, although the separate logs will include more details about the workflow execution.

If you receive any logging responses that are not clear to you, please don't hesitate to copy the response and share it with a Hub administrator for further assistance.

!!! note
    Log handling is still under development, and more are available to Hub admins, so if you require additional log details please reach out to one of the Hub administrators providing the deploying workspace, workflowID and jobID for your executed workflow and they may be able to provide more information.