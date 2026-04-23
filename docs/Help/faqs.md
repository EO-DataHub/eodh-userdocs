---
hide:
  - toc
---
# Frequently Asked Questions

Find answers to the most commonly asked questions about the EO DataHub. 

!!! info
    
    If you continue to experience issues, then please contact us directly at [enquiries@eodatahub.org.uk](mailto: enquiries@eodatahub.org.uk).

## General queries

<div class="grid cards" markdown>

-   :fontawesome-solid-headset: __Where can I find help?__

    ---

    Training materials and documentation are on this site. 
    
    Ask for help from the the user community on our [discussion forum](https://github.com/EO-DataHub/eodh-training/discussions), or contact the helpdesk at [enquiries@eodatahub.org.uk](mailto: enquiries@eodatahub.org.uk) for support around access and account issues.

-   :material-information: __Where can I raise an issue?__

    ---

    Direct your queries to [enquiries@eodatahub.org.uk](mailto: enquiries@eodatahub.org.uk). If reporting a bug use the subject '_Reported bug_', and include a clear description outlining steps taken that lead to the error being flagged or issue occurring, including screenshots.

-   :octicons-question-16: __Who is the DataHub suitable for?__

    ---
    
    The EO DataHub was built to support a range of Earth Observation professionals, including GIS users, Web Developers, Dev-Ops, Researchers and Data Scientists, by integrating with widely-adopted standardised tools and APIs. 

-   :simple-databricks: __What data is offered?__

    ---
    
    The resource catalogue contains both open access and commercial Earth Observation datasets includning optical and RADAR satellite data, as well as observed and modelled climate products.

-   :fontawesome-solid-user-group: __How can I work with my team?__

    ---
    
    Group workspaces can be created for an organisation, and members of the workspace can access the workflows and results stored in it. This allows sharing and collaboration across the organisation. To request a group workspace, [contact support](mailto: enquiries@eodatahub.org.uk). 
    
    Users can create workspaces using the Workspace UI and then grant access to other EODH users by adding members to the workspace.

-   :material-security: __Why can't I authenticate from my Notebook?__

    ---
    
    Struggling to connect to a workspace within the Jupyter notebooks environment, could be related to the API key you are using. [Check your environment file](../Analysts/notebook-service/practical-tips.md). 

-   :fontawesome-solid-key: __How can I login to my workspace?__

    ---
    
    See these FAQs for instructions on how to set up an account with the EODH or check out information on [individual accounts](../Getting-Started/user-accounts.md) and [workspaces](../Getting-Started/workspaces/create-workspace.md). An individual workspace can be accessed through a range of access points.

    * Hub platform - The [primary point of workspace access](https://test.eodatahub.org.uk/workspaces/). You must be signed into the Hub platform as an EODH user using one of the recognised identity providers e.g. a GitHub account.​

    * Single Sign-On - The EODH platform is integrated with GitHub and additional identity providers (e.g. Google or Microsoft).​

    * GIS Plugin - A user can login to their workspace through the QGIS or ArcGIS __ADD LINKS__ plugin interface, by carrying over an API key, generated in their online account and using their Hub username.

    * Applications - Create and see existing workflows in your workspace through the UI of custom-built applications powered by the EODH.


-   :octicons-graph-16: __How can I access my results?__

    ---
    
    When you execute a workflow, the outputs will automatically populate your workspace AWS S3 Storage and personal Resource Catalogue. A user will be able to search for their workflow results using the workspace user interface. The job results can be accessed using the following endpoint format, given your __workspace__ and __job-id__ produced as part of the outputs:

    ``` bash
    staging.eodatahub.org.uk/ades/<workspace>/ogc-api/jobs/<job-id>/results
    ```

    This will return the generated collection for the results. Then use the links in that dataset to access the data directly from S3. Your results will also be available in your resource catalogue:

    ```bash
    https://staging.eodatahub.org.uk/api/catalogue/stac/catalogs/user-datasets/<workspace>/processing-results
    ```


-   :material-cog: __Can I access data from my infrastructure? How?__

    ---
    
    Yes, you will be able to upload your own data to your personal AWS S3 storage as long as you have an active Hub Platform account and a workspace.

-   :fontawesome-solid-location-dot: __How can I access data from my workspace?__

    ---
    
    Your data will be saved in your personal Resource Catalogue as well as the AWS S3 storage associated with your workspace. You can search your data using the workspace user interface. The Hub Platform will convert all data in your workspace into STAC records so that it can be publicly published if you want.

-   :fontawesome-solid-satellite: __What data is offered?__

    ---
    
    The Resource Catalogue contains open access and commercial Earth Observation datasets: optical imagery, Synthetic Aperture RADAR (SAR), and observed / modelled climate products are available. LiDAR is not currently available.

    * Open access data - this includes Sentinel 1 and Sentinel 2 Analysis-Ready Data, and Earth Observation Climate Information Service (EOCIS), ESA Climate Change Initiative (CCI), and HadUK-Grid collectively climate observation-derived data products. UK Climate Projections (UKCP), the Co-Ordinated Regional Downscaling Experiment (CORDEX) and CMIP6 climate data are also available.

    * Commercial data - You can purchase PlanetScope and SkySat imagery from Planet and Pléiades, Pléiades Neo, SPOT and TerraSAR-X imagery from Airbus. [Find out more](../Analysts/commercial/what-is-available.md).

-   :octicons-lock-16: __Can I trust this platform?__

    ---
    
    User authentication and authorisation are securely provisioned using third party Identity Providers (IdPs). User access to workspaces is controlled by group membership. Users cannot access workspaces for which they are not an owner or a member. User workspace data is protected by platform level authentication and authorisation policies.     The EODH Quality Assurance (QA) service gives users confidence in the quality of the data they’re accessing, as an integral part of the Hub offering.
    
    Ongoing sustainable funding for EODH is dependent on successful onboarding of users and the provision of applicable case studies from those users.

-   :fontawesome-solid-vector-polygon: __What's the minimum area for a commercial data order?__

    ---
    
    Airbus, Optical PPO contracts have a minimum archive order size of 25km2. Radar PPO contracts have a minimum order size of one full scene (they cannot be clipped to an AOI). Contact [andrew.tewkesbury@airbus.com](mailto:andrew.tewkesbury@airbus.com) to discuss.
    Please contact Planet directly with your  specific needs. 

-   :fontawesome-solid-pound-sign: __Can I accidentally purchase an image?__

    ---
    
    Yes, but it's highly unlikely. Before a purchase is made the user click checkboxes to state that they understand the licensing agreement. The cost of the imagery selection is clearly displayed on the checkout page in green. 
    
    !!! warning
    
        Note that an order cannot be changed after delivery. The user has responsibility to ensure thorough checks are carried out before purchasing. 

-   :eye: __Where can I find my imagery once purchased?__

    ---
    
    Navigate to your personal workspace commercial-data catalogue where any purchased imagery will appear. Assets may take a while to appear after purchasing.


-  :fontawesome-solid-globe-africa: __Do the commercial datasets have global coverage, or UK only?__

    ---
    
    Commercial data spatial coverage is global.

-   :octicons-cpu-24: __How do I specify workflow runner resources?__

    ---

    Don't forget to specify the resources your workflow requires. If you miss this in your CWL specification, the workflow steps will run with the default setting which is 1 CPU and 1Gb of RAM. This may not be enough. You can specify these limits in your CWL at the Workflow level using the ResourceRequirements object e.g.  
    
    ```yaml
        requirements:
        - class: ResourceRequirement
            coresMin: 2
            ramMin: 4096
    ```

-   :octicons-log-16: __Why can't I access my CWL logs?__

    ---
    
    If you get a 404 error when accessing your logs, ensure your workflow ID has fewer than 26 characters and does not contain underscores.

-   :octicons-stop-16: __Why is my CWL workflow failing?__

    ---

    There could be lots of reasons, but first check your CWL code. If the workflow deploys but exits with "ModuleNotFound" try deleting and redeploying the workflow using the DELETE `/processes/workflow-id` endpoint. Alternatively, try deploying the workflow from a local file, rather than from a URL. Check for missing inputs by using the `/processes/<process-id>` endpoint. If the STAC output type is defined as "catalog" STAGEOUT will fail: it needs to be "Catalog" to be fully conformant.


-   :material-api: __What are the common API key issues?__

    ---
    
    1. Check you are using the correct Token ID and API Key in the correct places. The API key should be used when connecting to your Hub workspace 
    2. If you experience a 403 error when trying to order data through the notebook, please get a new Hub workspace API token and replace the old one you were previously using. This can be done by going to _Workspaces > Credentials > Request New Token_
    3. Check the expiry date on your currently active API key by visiting the workspaces tab and selecting credentials from the left-hand bar. 


</div>
