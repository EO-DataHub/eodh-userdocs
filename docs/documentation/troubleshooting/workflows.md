# Troubleshooting workflows

!!! bug
   If you continue to experience issues, then please contact us at [enquiries@eodatahub.org.uk](mailto: enquiries@eodatahub.org.uk).

## Why is my workflow failing immediately?

This is often seen where the workflow deployment was successful but the required executables were not generated correctly. A common error response is that the Workflow Runner gives a "ModuleNotFound" error. In the first instance please try deleting and redeploying the workflow using the DELETE `/processes/workflow-id` endpoint and then redeploy. If this still doesn't work, please try deploying the workflow from a local file, rather than from a URL.

Another common occurrence is the wrong inputs being provided. You can see warnings for missing inputs by checking either of the status or results endpoints for your job once it has started running. You can also check the required inputs by using the `/processes/<process-id>` endpoint for the process you wish to interrogate.

## Why are my outputs not being handled by the STAGEOUT step?
Often we have seen the case where the STAC type is defined as "catalog" but it needs to be "Catalog" to be fully conformant and to work with the STAGEOUT step. Also check your STAC output is fully compliant with the standards in the stac-spec.

## Why can't I access my logs?
If you are receiving log links from the execute status endpoint but then get a 404 error when attempting to visit the page, please ensure your workflow ID meets the following requirements:

* Has no more than 26 characters
* Does not contain any underscores

## Why is my workflow failing with few log details?

Another common occurrence is to forget to specify the resources your workflow requires to run. If you miss this in your CWL specification, the workflow steps will run with the default setting which is 1 CPU and 1Gb of RAM. This may not be enough for the processing requested by your workflow and so you may need to specify increased limits. You can specify these limits in your CWL at either the Workflow or Command Line Tool level using the ResourceRequirements requirements object. This tells the Workflow Runner what resources to allocate to the pods running your workflow processes.

For example, to specify a step needs 2 CPUs and 4Gb (3096 Mb) or RAM you can include the following in your requirements section:

```yaml
requirements:
- class: ResourceRequirement
  coresMin: 2
  ramMin: 4096
```