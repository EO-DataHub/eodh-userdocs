Local testing
Before deploying a workflow to the DataHub Workflow Runner you can test your CWL script locally using packages such as cwltool. This allows you to run the workflow locally on your computer, without waiting for Hub scheduling and log handling. You can provide the inputs you wish to use on the Hub, but we suggest you use a smaller dataset for initial testing to avoid long run times. This can help with early bug discovery and fixing. You should also ensure the output results match the required STAC format and that all results are generated in the correct directory. If you want to closely mimic the Hub invocation you can define a .json file with your inputs as below.

{
  "inputs": {
      "fn": "resize",
      "url": "https://raw.githubusercontent.com/EO-DataHub/test-workflow-store/main/EO-Data-Hub-logo_colour_425px.png",
      "size": "50%"
  }
}
Then pass these inputs into your workflow when executing it on the command line.

cwltool <workflow-filename>.cwl#<workflow-id> inputs.json
You must remember to specify the name of a step in your workflow, or otherwise set it to the id of the top-level workflow. For example in this workflow, the top-level workflow has the id “convert-url” as this is specified in the workflow class.

$graph:
  # Workflow entrypoint
  - class: Workflow
    id: convert-url
    label: convert url app
    doc: Convert URL