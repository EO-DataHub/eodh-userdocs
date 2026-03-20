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
    
    Your data will be saved in your personal Resource Catalogue as well as the AWS S3 storage associated with your workspace. You will be able to search your data using the workspace user interface. The Hub Platform will attempt to convert all data in your workspace into STAC records so that it can be publicly published if a user wishes to do so.

-   :fontawesome-solid-satellite: __What data is offered?__

    ---
    
    The resource catalogue contains both open access and commercial Earth Observation datasets: optical imagery, Synthetic Aperture RADAR (SAR), and observed / modelled climate products are available. LiDAR is not currently available.

    * Open access data - Open access imagery includes publicly available Sentinel 1 and Sentinel 2 Analysis-Ready Data, provisioned by the CEDA Data Archive catalogue. The Earth Observation Climate Information Service (EOCIS), ESA Climate Change Initiative (CCI), and HadUK-Grid collectively provide the climate observation-derived data products available on the Hub. UK Climate Projections (UKCP), the Co-Ordinated Regional Downscaling Experiment (CORDEX) and CMIP6 supply modelled climate variable products into the Resource Catalogue.

    * Commercial data - You can purchase commercial imagery from Airbus and Planet through the Hub, on the condition that users hold an existing user account with these data providers. PlanetScope and SkySat imagery can be purchased from Planet. Pléiades, Pléiades Neo, SPOT and TerraSAR-X imagery can be purchased from Airbus. [Find out more](../Analysts/commercial/what-is-available.md).

-   :octicons-lock-16: __Can I trust this platform?__

    ---
    
    The EODH platform implements the OIDC spec to manage user authentication and authorisation securely. Users log into the platform using third party Identity Providers (IdPs). This brings the benefit of using 3rd party IdPs’ production hardened authentication mechanisms, such as GitHubs MFA functionality, as well as their secure storage of user credentials. User access to workspaces is controlled by group membership. Users cannot access workspaces for which they are not an owner or a member, and workspace group membership is controlled by workspace owners through the platform web UI. User workspace data is protected by tested platform level authentication and authorisation policies. Where the data store is backed by an AWS resource, such as S3 or EFS, then they are also protected by scoped AWS IAM policies tied to a user’s platform web identity.

    It is expected that there will be a community of researchers, industry and government users working together to provide and interact with EO data in new and innovative ways. Sustainable funding for the Earth Observation DataHub project is dependent on successful onboarding of users and applicable case studies.

    The EODH Quality Assurance (QA) Service gives users confidence in the quality of the data they’re accessing, as an integral part of the Hub offering. QA checks consist of both a review of the processes by which data products are created, and quantitative validation. The aim is to ensure that data are fit for purpose and performing at the level they claim. The QA results are stored as annotations in the product catalogue. When searching for data, the QA annotations can be used in the query parameters so you can find data that fits your needs. Detailed QA information is available on a specific page for a given collection.


</div>
