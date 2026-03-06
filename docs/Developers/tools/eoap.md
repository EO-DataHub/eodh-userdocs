# eoap-gen

## What are Earth Observation Application Packages?
EOAPs are self contained amalgamations of tools and code that allow an algorithm, or set of algorithms, to be shared between and run on different data processing platforms. The core concepts behind this are that: * Algorithms and processing methods are not tied to a specific platform * The underlying infrastructure is not important as long as a suitable workflow runner exists on that infrastructure * The workflows preferentially create data services

The EOAP is the complete unit of code that is submitted to the workflow runner and comprises: 

* A CWL workflow file, itself made up of a descriptive component and a series of command line tools 
* A Dockerfile or Docker image 
* An optional application file that is usually required for any but the most simple workflows

A functioning and stable EOAP is challenging to create even for experienced developers and generally the creation of EOAPs is limited to specialist users with some knowledge of dev-ops or with higher programming skills.

## How do I create a workflow?
The guidance around EOAPs is that handcrafting a package is possible but not recommended. These workflows can become very complex very quickly and it is recommended that some form of tooling is used to automate or semi-automate the generation of an EOAP. As part of the Pathfinder phase of the project, the EODH (via a 3rd party contractor, Oxidian) has created eoap-gen to help specialist technicians to create service workflows.

## What is `eoap-gen`?

`eoap-gen` is a Python-based tool to help dev-ops specialists or specialist technicians to create compliant Earth Observation Application Packages (EOAPs) that will run on the EODH. It is a CLI tool for generating Earth Observation Application Packages, including CWL workflows and Dockerfiles, from user supplied Python scripts. The tool is intended to support specialist users to create custom workflows within their workspace that can be used within the wider suite of EODH interfaces to generate outputs. The Hub only supports workflows supplied in compliant Common Workflow Language (CWL) format, in an attempt to align with the move towards a standardised approach to Earth Observation analytics scripting across the sector. More information on “Why CWL?” can be found here.

* Prerequisites: Python, CWL
* Entrypoint: [https://github.com/EO-DataHub/eoap-gen](https://github.com/EO-DataHub/eoap-gen)

## Requirements

`eoap-gen` is “a CLI tool for generating Earth Observation Application Packages including CWL workflows and Dockerfiles from user supplied python scripts”.

There are three main requirements that are needed for the tool to create a working EOAP. These are: 

* Python scripts. These must use argparse or click and the parameters will be mapped to the CWL CommandLineTool inputs 
* A pip requirements file for each script being wrapped into the EOAP 
* A compliant `eoap-gen` configuration file

## Running the tool

A full [tutorial is provided with the repository](https://github.com/EO-DataHub/eoap-gen/blob/main/ades_guide.md). Here, we will outline the main steps required in using the `eoap-gen` tool.

The first thing a user is required to do is understand the workflow that they want to wrap. At it’s most simple the steps of a workflow are threefold: 

* find your input data
* process your input data, and
* create a STAC output of the processed data.

For the `eoap-gen` tool these steps will always be required and when using the workflow runner (WR) (aka ADES) on the EODH the output will always need to be a directory output containing a STAC catalog. When using the EODH it is recommended that the Python API client `pyeodh` is used to access the API endpoints on the Hub.

The following directory structure is recommended when using the `eoap-gen` tool:

``` text
.github
└── workflows
    └── build.yml
get_urls
├── get_urls.py
└── get_urls_reqs.txt
make_stac
├── make_stac.py
└── make_stac_reqs.txt
config.yml
```
### Configuration

Despite simplifying the process, it is still complex to create these packages. A configuration file is needed and this is then used to create the EOAP. More information about this can be found in the repositry for the tool, but the example of a configuration file for a single step workflow (below) demonstrates the need to understand the full data procesisng chain.

``` yaml
id: resize-collection
doc: Resize collection cogs
label: Resize collection cogs
inputs:
  - id: catalog
    label: catalog
    doc: full catalog path
    type: string
    default: supported-datasets/ceda-stac-fastapi
  - id: collection
    label: collection id
    doc: collection id
    type: string
    default: sentinel2_ard
outputs:
  - id: stac_output
    type: Directory
    source: step3/stac_catalog
steps:
  - id: get_urls
    script: playground/get_urls.py
    requirements: playground/get_urls_reqs.txt
    inputs:
      - id: catalog
        source: resize-collection/catalog
      - id: collection
        source: resize-collection/collection
    outputs:
      - id: urls
        type: string[]
        outputBinding:
          loadContents: true
          glob: urls.txt
          outputEval: $(self[0].contents.split('\n'))
      - id: ids
        type: string[]
        outputBinding:
          loadContents: true
          glob: ids.txt
          outputEval: $(self[0].contents.split('\n'))
```

### Execution

Once the required files are in place the user needs to execute the `eoap-gen` tool. The specific command will change with the file names, but the following code snippet shows the form it would take

``` bash
eoap-gen generate \
  --config=eoap-gen-config.yml \
  --output=eoap-gen-out \
  --docker-url-base=ghcr.io/user/repo \
  --docker-tag=main
```

## Related tools

Other useful tools that you may want to try include:

### cwltool

The [cwltool](https://cwltool.readthedocs.io/en/latest/index.html) is “the reference implementation of the Common Workflow Language open standards. It is intended to be feature complete and provide comprehensive validation of CWL files as well as provide other tools related to working with CWL”. It is a commandline tool designed to run locally and is an excellent piece of software to help check that CWL is compliant. It is designed for use on Linux and will also run on a Mac or Windows (through WSL - windows Subsystem for Linux). It can implement Docker, Podman, Singularity and others for the containerisatoion of commandline components.

### scriptcwl

[scriptcwl](https://github.com/NLeSC/scriptcwl) is a Python package for creating CWL workflows and the latest [documentation](https://scriptcwl.readthedocs.io/en/latest/) gives an indepth explanation of its use. Be aware that this tool has not been developed on or updated for many years.

### cwl-utils

Still actively developed, [cwl-utils](https://github.com/common-workflow-language/cwl-utils) provides Python utilities and autogenerated classes for loading and parsing CWL documents. Although not specific to EOAPs this set of tools may be helpful when developing your workflows. [Documentation](https://cwl-utils.readthedocs.io/en/latest/#) is relatively sparse.

## Links

The following bullet points direct the reader to a set of further reading around EOAPs and the standards they relate to.

* EO Application Package example: [Waterbodies](https://github.com/Terradue/ogc-eo-application-package-hands-on/tree/master/water-bodies)
* OGC best practices: [EO Application packages](https://docs.ogc.org/bp/20-089r1.html#toc18)
* CWL for EO tutorials: [Adding conditions](https://cwl-for-eo.github.io/guide/how-to/cwl-how-to/08-conditional-workflows/conditional-workflows/)
* [Terradue training](https://github.com/Terradue/ogc-eo-application-package-hands-on) (watch out for some typographic errors in the scripts)