# Integrations

## pyeodh

‘pyeodh’ is a lightweight Python client for easy access to EODH APIs. It is a Python-based tool tailored to facilitate communication with the specific API endpoints exposed by the EODH platform. Using ‘pyeodh’, developers and scientists can programmatically access the API’s features—such as sending requests, retrieving data, or executing commands—without needing to handle the underlying details such as crafting HTTP requests or managing authentication manually. By abstracting these complexities, ‘pyeodh’ makes it easier to integrate the API into Python applications, enabling developers to focus on building features rather than managing low-level networking tasks.

* Prerequisites: Python
* Entrypoint: [https://pyeodh.readthedocs.io/en/latest/index.html](https://pyeodh.readthedocs.io/en/latest/index.html)
* Documentation: [https://eo-datahub.github.io/eodh-training/api-client/1_ClientIntro.html](https://eo-datahub.github.io/eodh-training/api-client/1_ClientIntro.html)

## QGIS plugin

The QGIS plugin automates the connection to a user’s workspace on the Hub, allowing a user to access pre-developed EO Application Packages (EOAPs) for processing data. Once a required EOAP has been found, the user can parameterise and execute the workflow. Upon completion the GIS user can then interact with the returned data assets and can view the processing logs, within their QGIS project environment.

* Prerequisites: CWL workflows in a workspace
* Entrypoint: [https://github.com/EO-DataHub/eodh-qgis](https://github.com/EO-DataHub/eodh-qgis)
* Documentation: [https://eo-datahub.github.io/eodh-training/plugin/1_introduction.html](https://eo-datahub.github.io/eodh-training/plugin/1_introduction.html)

![](../../assets/ep_int_qgis.png)


## Jupyter Hub

The AppHub is a JupyterHub instance made available to users to ensure simple access to information held within the Resource Catalogue. It also allows the creation of scientific analytical workflows and associated data processing. Once logged in to the AppHub a user is able to upload notebooks and data, or create new notebooks, from where they can interact with other EODH components using tools such as pyeodh.

* Prerequisites: Python, Jupyter Notebooks
* Entrypoint: [https://prod.eodatahub-workspaces.org.uk/notebooks/hub/home](https://prod.eodatahub-workspaces.org.uk/notebooks/hub/home) and pyeodh
* Documentation: [https://eo-datahub.github.io/eodh-training/platform/2_Components.html](https://eo-datahub.github.io/eodh-training/platform/2_Components.html)

![](../../assets/ep_int_jupyter.png)


## eoap-gen

eoap-gen is a Python-based tool to help dev-ops specialists or specialist technicians to create compliant Earth Observation Application Packages (EOAPs) that will run on the EODH. It is a CLI tool for generating Earth Observation Application Packages, including CWL workflows and Dockerfiles, from user supplied Python scripts. The tool is intended to support specialist users to create custom workflows within their workspace that can be used within the wider suite of EODH interfaces to generate outputs. The Hub only supports workflows supplied in compliant Common Workflow Language (CWL) format, in an attempt to align with the move towards a standardised approach to Earth Observation analytics scripting across the sector. More information on “Why CWL?” can be found here.

* Prerequisites: Python, CWL
* Entrypoint: [https://github.com/EO-DataHub/eoap-gen](https://github.com/EO-DataHub/eoap-gen)
* Documentation: [https://eo-datahub.github.io/eodh-training/workflows/1_Workflows.html](https://eo-datahub.github.io/eodh-training/workflows/1_Workflows.html)