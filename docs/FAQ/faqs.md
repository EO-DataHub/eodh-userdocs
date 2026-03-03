---
hide:
  - toc
---
# Frequently Asked Questions

Find answers to the most commonly asked questions about the EO DataHub. If you have a question that has not been listed, or need further support, please contact us directly at [enquiries@eodatahub.org.uk](mailto: enquiries@eodatahub.org.uk), or raise a discussion topic in our [community forum](https://github.com/EO-DataHub/eodh-training/discussions).



<div class="grid cards" markdown>

-   :octicons-question-16: __Where can I raise an issue?__

    ---

    Direct your queries to [enquiries@eodatahub.org.uk](mailto: enquiries@eodatahub.org.uk). If reporting a bug use the subject '_Reported bug_', and include a clear description outlining steps taken that lead to the error being flagged or issue occurring, including screenshots.


-   :octicons-question-16: __How can I login to my workspace?__

    ---

    Instructions on how to set up an account with the EODH and request a user workspace can be found here. An individual workspace can be accessed through a range of access points.



-   :octicons-question-16:{ .lg .middle } __?__

    ---




-   :material-scale-balance:{ .lg .middle } __Open Source, MIT__

    ---

    Material for MkDocs is licensed under MIT and available on [GitHub]

    [:octicons-arrow-right-24: License](#)

</div>




# Troubleshooting API key issues

!!! bug
    
    If you continue to experience issues, then please contact us at [enquiries@eodatahub.org.uk](mailto: enquiries@eodatahub.org.uk).


## Check you are using the correct key

Please make sure that the Token ID and API Key have been entered in the correct places.

When you generate an API key from your Hub workspace, you will be given a Token ID and API key, as shown below. The API key should be used when connecting to your Hub workspace via the QGIS Plugin or Jupyter Notebooks. Always check you have copied across the correct character string when asked for your API key.

![](../../assets/ep_ts_api1.png)


## Receiving 403 Status Code: Access Denied

If you experience a 403 error when trying to order data through the notebook, please get a new Hub workspace API token and replace the old one you were previously using. This is a known reoccurring bug with API keys. The best workaround for this error is to get a new API key.

This can be done by going to __Workspaces > Credentials > Request New Token__

![](../../assets/ep_ts_api2.png)

## Check the expiry date on your currently active API key

You can find this by visiting the workspaces tab and selecting credentials from the left-hand bar. Check the expiry date on the key. This can be viewed in your workspace within the Credentials tab, under Active Tokens. If it has expired, please create a new key.

![](../../assets/ep_ts_api3.png)



# Troubleshooting Notebook issues

!!! bug
    If you continue to experience issues, then please contact us at [enquiries@eodatahub.org.uk](mailto: enquiries@eodatahub.org.uk).

## File load/save error for <file>

This is a known bug and is being actively worked on. When attempting to open or save a file the error is shown. The user resolution is to refresh the browser page. For a file load error there is no risk to the user, the file should load successfully after refresh. For file save, there is a risk to lose recent data. This is mitigated by the autosave feature (enabled by default) but when refreshing the page any unsaved content will be lost, so save often until this bug has been resolved.

![](../../assets/ep_ts_nb1.png)

## Problems authenticating the connection to your workspace

If you are struggling to connect to your workspace within the Jupyter notebooks environment, this could be related to the API key you are using to connect with, which you have likely stored within an environment file. Follow this guidance to troubleshoot issues related to API keys.




# Troubleshooting workflows

!!! bug
    If you continue to experience issues, then please contact us at [enquiries@eodatahub.org.uk](mailto: enquiries@eodatahub.org.uk).

## :octicons-question-16: Why is my workflow failing immediately?

This is often seen where the workflow deployment was successful but the required executables were not generated correctly. A common error response is that the Workflow Runner gives a "ModuleNotFound" error. In the first instance please try deleting and redeploying the workflow using the DELETE `/processes/workflow-id` endpoint and then redeploy. If this still doesn't work, please try deploying the workflow from a local file, rather than from a URL.

Another common occurrence is the wrong inputs being provided. You can see warnings for missing inputs by checking either of the status or results endpoints for your job once it has started running. You can also check the required inputs by using the `/processes/<process-id>` endpoint for the process you wish to interrogate.

## :octicons-question-16: Why are my outputs not being handled by the STAGEOUT step?
Often we have seen the case where the STAC type is defined as "catalog" but it needs to be "Catalog" to be fully conformant and to work with the STAGEOUT step. Also check your STAC output is fully compliant with the standards in the stac-spec.

## :octicons-question-16: Why can't I access my logs?
If you are receiving log links from the execute status endpoint but then get a 404 error when attempting to visit the page, please ensure your workflow ID meets the following requirements:

* Has no more than 26 characters
* Does not contain any underscores

## :octicons-question-16: Why is my workflow failing with few log details?

Another common occurrence is to forget to specify the resources your workflow requires to run. If you miss this in your CWL specification, the workflow steps will run with the default setting which is 1 CPU and 1Gb of RAM. This may not be enough for the processing requested by your workflow and so you may need to specify increased limits. You can specify these limits in your CWL at either the Workflow or Command Line Tool level using the ResourceRequirements requirements object. This tells the Workflow Runner what resources to allocate to the pods running your workflow processes.

For example, to specify a step needs 2 CPUs and 4Gb (3096 Mb) or RAM you can include the following in your requirements section:

```yaml
requirements:
- class: ResourceRequirement
  coresMin: 2
  ramMin: 4096
```




## 

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