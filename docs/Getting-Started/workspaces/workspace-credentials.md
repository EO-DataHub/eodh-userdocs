# Workspace Credentials

To connect securely to your EODH workspace from external tools and services—such as APIs, scripts, data processing pipelines, or GIS applications like QGIS—you need to generate appropriate credentials that authenticate your access.

## DataHub API Key

You need to generate an API key scoped to your workspace to securely authenticate with the DataHubs API and related tools, such as the QGIS plugin. This key acts as a unique identifier that verifies your access rights and ensures that only authorized users can interact with the data and services tied to your workspace. By scoping the key specifically to your workspace, you maintain control over what resources can be accessed, and you ensure that the authentication process is both secure and aligned with your organization’s data governance policies. This is especially important when using integrations like the QGIS plugin, which rely on authenticated API access to fetch, visualize, and manage geospatial data directly from your DataHub environment.

To obtain an API token, visit the Workspaces tab. Choose the desired workspace and then select Credentials on the left hand panel. Under DataHub API Key click the Request New Token button. Enter a name and expiry time.

__INSERT IMAGE__

!!! warning
    The maximum duration of an API token is 30 days.

Copy the Token ID and API Key, these will not be available to view later. These API tokens will be used to authenticate your workspace with external and internal services within the platform.

__INSERT IMAGE__

## S3 Token
Your workspace includes an object store. By generating temporary S3 credentials, you are provided with secure, time-limited access to your workspace’s data buckets, enabling you to upload, download, or stream data files directly. This is particularly useful when working with large datasets in external applications or when integrating with cloud-based processing tools.

You can generate temporary tokens to access your workspaces S3 bucket programmatically. Please see Using Your Temporary AWS S3 Credentials for more information.