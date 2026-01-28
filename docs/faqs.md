# Frequently Asked Questions

Find answers to the most commonly asked questions about the EO DataHub. If you have a question that has not been listed, or need further support, please contact us directly at [enquiries@eodatahub.org.uk](mailto: enquiries@eodatahub.org.uk), or raise a discussion topic in our [community forum](https://github.com/EO-DataHub/eodh-training/discussions).

## :octicons-question-16: Where can I raise an issue?

To get support with access or account issues and share general feedback, please direct your query to [enquiries@eodatahub.org.uk](mailto: enquiries@eodatahub.org.uk) in the first instance. 

To report a bug, please contact [enquiries@eodatahub.org.uk](mailto: enquiries@eodatahub.org.uk) with the subject '_Reported bug_', and the team will open a new ticket in the GitHub issue tracker under the relevant repository. Please include a clear description outlining steps taken that lead to the error being flagged or issue occurring, including screenshots where possible. This will make it as easy as possible for the team to replicate and troubleshoot the issue.

## :octicons-question-16: What can I do with the platform?

The Hub Platform and ecosystem of tools and interfaces supports a wide range of use cases, outlined below:

* Scalable EO and Climate data processing. 
    * Generate environmental analyses for monitoring systems by actioning workflows with scalable compute infrastructure in real time
* Share new analysis. 
    * Carry out novel research, derive insights, and publish outputs, assisted by the capabilities and datasets provided by the Hub, through developing EO workflows
* Analysis Ready Data pipelines with Quality Assurance. 
    * Collaborate on pipelines and algorithms to generate novel ARD products to be hosted on the Hub
* Enabling commercial applications. 
    * Utilise the provision of satellite imagery and modelled EO data products to power custom web applications to serve end-user needs, from climate risk alerts to site monitoring
* Pay per use commercial data. 
    * Get centralised access to a supply of commercial satellite datasets which are hosted on the Hub
* Enhance organisational reporting. 
    * Produce map visualisations in light-touch user interfaces or external GIS software to showcase geospatial insights for project reports
* Migrate operational workflows. 
    * Connect operational workflows hosted in compatible platforms to your Hub workspace, to automate processing of dataflows directly from the Resource Catalogue
* Notebooks for education. 
    * Create educational resources for EO analysis and applications, powered by the Hub API, by writing or exploiting community-developed notebooks

## :octicons-question-16: Where can I find help?

All training materials for the DataHub are consolidated in these documentation pages.

To start a discussion with the user community, contribute to our [community forum](https://github.com/EO-DataHub/eodh-training/discussions).

Users can contact the helpdesk at [enquiries@eodatahub.org.uk](mailto: enquiries@eodatahub.org.uk) for support with individual access and account issues, or custom queries.

## :octicons-question-16: How can I work in my team?

Group workspaces can be created on behalf of an organisation, where all the members of a workspace can access the workflows and results stored in this location. This allows for sharing and collaboration across teams. To request a group workspace, follow the guidance provided here.

Users can create workspaces using the Workspace UI and then grant access to other EODH users by adding members to the workspace.

![Image title](assets/faq_GroupWorkspaces.original.png){ width="300" }
/// caption
Add new workspace
///

## :octicons-question-16: How can I login to my workspace?

Instructions on how to set up an account with the EODH and request a user workspace can be found here. An individual workspace can be accessed through a range of access points.

### Hub platform

The primary point of access for a Hub workspace is through the Hub platform. To access your workspace through this entry point, you must be signed into the Hub platform as an EODH user. At present, you need to first create an account on GitHub. GitHub is an identity provider which the EODH Platform is integrated with. Once you have a GitHub account, you can use the credentials to sign in to the EODH Platform.​

### Single Sign-On

The EODH Platform is integrated with GitHub and additional identity providers (Google or Microsoft).​

### QGIS Plugin

A user can login to their workspace through the QGIS Plugin interface, by carrying over an API key, generated here, and utilising their Hub login username (matching their GitHub username).

### Applications

A user will be able to create and see existing workflows in their workspace through the UI of custom-built applications powered by the EODH.

## :octicons-question-16: How can I access my results?

When you execute a workflow, the outputs will automatically be populated into your workspace AWS S3 Storage and personal Resource Catalogue. A user will be able to search for their workflow results using the workspace user interface.

The job results can be access via the ADES, using the following endpoint format, given your __workspace__ and __job-id__ which produced the outputs:

``` bash
staging.eodatahub.org.uk/ades/<workspace>/ogc-api/jobs/<job-id>/results
```

This will return the generated collection for the results, you can then use the links contained within this dataset to access the data directly from S3, where it is hosted. Your results will also be available in your resource catalogue catalog:

```bash
https://staging.eodatahub.org.uk/api/catalogue/stac/catalogs/user-datasets/<workspace>/processing-results
```

You can search for the job-id that produced the resulting data.

## :octicons-question-16: Who is the DataHub suitable for?

Through its various access points, the EO DataHub was built to support a range of Earth Observation professionals, including GIS users, Web Developers, Dev-Ops, Researchers and Data Scientists, by integrating with widely-adopted standardised tools and APIs.

## :octicons-question-16: What data is offered?

The resource catalogue contains both open access and commercial Earth Observation datasets. Optical imagery (including Sentinels), Synthetic Aperture RADAR (SAR), observed and modelled climate products, are available. No LiDAR datasets are currently available in the resource catalogue.

### Open access data

The catalogue of open access imagery includes publicly available Sentinel 1 and Sentinel 2 Analysis-Ready Data, provisioned by the CEDA Data Archive catalogue. The Earth Observation Climate Information Service (EOCIS), ESA Climate Change Initiative (CCI), and HadUK-Grid collectively provide the climate observation-derived data products available on the Hub. UK Climate Projections (UKCP), The Co-Ordinated Regional Downscaling Experiment (CORDEX), and CMIP6 supply modelled climate variable products to the Resource Catalogue, detailed specifications both of which can be found here.

### Commercial data
The Hub platform facilitates purchasing of commercial imagery from Airbus and Planet, on the condition that users hold an existing user account with these providers. PlanetScope and SkySat imagery can be purchased from Planet. Pléiades, Pléiades Neo, SPOT and TerraSAR-X imagery can be purchased from Airbus. More information on these data specifications, as well as guidance on purchasing and licensing restrictions, can be found here.

## :octicons-question-16: Can I access data from my infrastructure? How?

Yes, you will be able to upload your own data to your personal AWS S3 storage as long as you have an active Hub Platform account and a workspace.

## :octicons-question-16: How can I access data from my workspace?

Your data will be saved in your personal Resource Catalogue as well as the AWS S3 storage associated with your workspace. You will be able to search your data using the workspace user interface. The Hub Platform will attempt to convert all data in your workspace into STAC records so that it can be publicly published if a user wishes to do so.

## :octicons-question-16: Can I trust this platform?

### Security

The EODH platform implements the OIDC spec to manage user authentication and authorisation securely. Users log into the platform using third party Identity Providers (IdPs). This brings the benefit of using 3rd party IdPs’ production hardened authentication mechanisms, such as GitHubs MFA functionality, as well as their secure storage of user credentials. Currently only GitHub IdP is integrated with the platform, but other integrations are planned.

User access to workspaces is controlled by group membership. Users cannot access workspaces for which they are not an owner or a member, and workspace group membership is controlled by workspace owners through the platform web UI.

User workspace data is protected by tested platform level authentication and authorisation policies. Where the data store is backed by an AWS resource, such as S3 or EFS, then they are also protected by scoped AWS IAM policies tied to a user’s platform web identity.

### Sustainability

The project is currently in a Pathfinder phase (2023-2025) that brings new thinking and experimental developments, resulting in practical services for a variety of users in a short period of time. By the end of the pathfinder phase (March 2025), it is expected that there will be a community of researchers, industry and government users working together to provide and interact with EO data in new and innovative ways.

Funding for the Earth Observation DataHub project has not currently been extended beyond the Pathfinder phase, ending on 31st March 2025, with applications for extension of project funding ongoing.

### Quality Assurance

The EODH Quality Assurance (QA) Service aims to give users confidence in the quality of the data they’re accessing, as an integral part of the Hub offering.

QA checks consist of both a review of the processes by which data products are created, and quantitative validation. The aim is to ensure that data are fit for purpose and performing at the level they claim.

The QA results are stored as annotations in the product catalogue. When searching for data, the QA annotations can be used in the query parameters so you can find data that fits your needs. Detailed QA information is available on a specific page for a given collection – outlining the results for documentation reviews, when checks were last run and whether they passed.

In the EODH Pathfinder, these checks have been carried out for various satellite data collections from the initial optical missions available on the Hub (Sentinel-2, Planet SuperDove, and Airbus Pléiades).

## :octicons-question-16: What's the minimum area for a commercial data order?

### Airbus

For Airbus, Optical PPO contracts have a minimum archive order size of 25km2. Radar PPO contracts have a minimum order size of one full scene, meaning Radar imagery orders cannot be clipped to an AOI. There are options available for very granual data access - please contact andrew.tewkesbury@airbus.com to discuss.

### Planet

For Planet, we would recommend people with specific needs contact Planet directly. Planet do have a minimum order size, but that could for example refer to a data distributed over a long period. And for that case only SkySat would work.