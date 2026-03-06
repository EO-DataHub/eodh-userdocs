# Code integrations

## :simple-jupyter: Jupyter Hub

The AppHub is a JupyterHub instance made available to users to ensure simple access to information held within the Resource Catalogue. It also allows the creation of scientific analytical workflows and associated data processing. Once logged in to the AppHub a user is able to upload notebooks and data, or create new notebooks, from where they can interact with other EODH components using tools such as pyeodh.

* Prerequisites: Python, Jupyter Notebooks
* Entrypoint: [https://prod.eodatahub-workspaces.org.uk/notebooks/hub/home](https://prod.eodatahub-workspaces.org.uk/notebooks/hub/home) and pyeodh
* Documentation: [https://eo-datahub.github.io/eodh-training/platform/2_Components.html](https://eo-datahub.github.io/eodh-training/platform/2_Components.html)


## :material-language-python: pyeodh

‘pyeodh’ is a lightweight Python client for easy access to EODH APIs. It is a Python-based tool tailored to facilitate communication with the specific API endpoints exposed by the EODH platform. Using ‘pyeodh’, developers and scientists can programmatically access the API’s features—such as sending requests, retrieving data, or executing commands—without needing to handle the underlying details such as crafting HTTP requests or managing authentication manually. By abstracting these complexities, ‘pyeodh’ makes it easier to integrate the API into Python applications, enabling developers to focus on building features rather than managing low-level networking tasks.

* Prerequisites: Python
* Entrypoint: [https://pyeodh.readthedocs.io/en/latest/index.html](https://pyeodh.readthedocs.io/en/latest/index.html)
* Documentation: [https://eo-datahub.github.io/eodh-training/api-client/1_ClientIntro.html](https://eo-datahub.github.io/eodh-training/api-client/1_ClientIntro.html)
