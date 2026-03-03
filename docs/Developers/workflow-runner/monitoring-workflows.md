# Monitoring workflows

Once you have executed a workflow, there are a few endpoints provided in the API that allow you to monitor the progress of the execution, as well as view outputs and resulting log files, to see additional details about the workflow execution.

## Endpoints for Job Monitoring

Once you have executed your workflow, using the `/execution` endpoint, you will see a “jobID” key in the JSON HTTP response, as shown below. This provides the UUID for the job that is running your workflow. You can then use this jobID to view details about the status of your workflow execution, as well as view the resulting collection upon completion.

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
  "status": "running",
  "message": "ZOO-Kernel accepted to run your service!",
  "links": [
    {
      "title": "Status location",
      "rel": "monitor",
      "type": "application/json",
      "href": "https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs/c7bdbb50-1477-11f0-922f-c217930f6509"
    }
  ]
}
```

In this response, you can see the `Status location` link which provides a URL at which you can view the status of your job, following the below format.

```bash
# View job status
/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs/<jobID>
```

Using this status endpoint, once your workflow execution has completed, you will be able to find some additional links.

```json
[
    {
      "title": "Result location",
      "rel": "http://www.opengis.net/def/rel/ogc/1.0/results",
      "type": "application/json",
      "href": "https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs/c7bdbb50-1477-11f0-922f-c217930f6509/results"
    },
    {
      "href": "https://eodatahub.org.uk/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs/c7bdbb50-1477-11f0-922f-c217930f6509/workflow-step.log",
      "title": "Tool log workflow-step.log",
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
```

These links will point you to URLs enabling you to view the output results and any log files, the first of which is the output results endpoint.

```bash
# View output results
/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs/<job_id>/results
```

The jobID will also be used to view logs when they are available via HTTPS, should you wish to see more details about you workflow execution. The log links are returned from the execute status endpoint above, but follow this format:

```bash
# View job log file
/api/catalogue/stac/catalogs/user/catalogs/<workspace>/jobs/<job_id>/<filename>.log
```