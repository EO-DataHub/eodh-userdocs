# APIs: Getting started

## Hub APIs
A suite of user-facing APIs make up the core of the Hub’s architecture. You can use these APIs to perform Hub actions programmatically. This includes:

* Browsing and downloading items from our catalogue
* Visualising data using TiTiler
* Uploading and running workflows in our architecture
* Purchasing commercial data

These APIs are documented in a machine-readable definition language called OpenAPI (formerly Swagger), which allows developers to understand how the APIs work and generate client code and tests automatically.

You can explore the Hub’s APIs using the interactive documentation viewer we host here, or if you prefer you can just download the raw OpenApi documentation here. This documentation currently covers the Resource Catalogue, TiTiler and Workflow Runner, but is expected to cover APIs for the whole Hub in future.

## Connecting

Connect to your EODH workspace from external interfaces via API tokens
To obtain an API token, visit the Workspaces tab. Choose the desired workspace and then select Credentials on the left hand panel. Under DataHub API Key click the Request New Token button. Enter a name and expiry time.

!!! warning
    The maximum duration of an API token is 30 days.

__INSERT IMAGE__

Copy the Token ID and API Key, these will not be available to view later.

__INSERT IMAGE__

These credentials will be required when performing operations that require authorisation to your workspace.

## Explore the public catalogue

Our APIs can be used without authentication to perform actions such as browsing our publicly available data, an example of which is shown below. This uses pystac to perform a basic search for collections with data over the UK.

More detailed examples for browsing our catalogue can be found here.

```py
from pystac_client import Client

# Set resource catalogue top-level url
rc_url = f"https://eodatahub.org.uk/api/catalogue/stac"

# Create STAC client
stac_client = Client.open(rc_url)

# Do some collection searching using bbox
uk_bbox = [10.854492,49.823809,100.762709,60.860699]
collection_search = stac_client.collection_search(
    bbox=uk_bbox,
)
print(f"{collection_search.matched()} collections found")
for collection in collection_search.collections():
    print(collection.id)
```

## Explore your private catalogue

Sections of the catalogue are private to your workspace and cannot be accessed without proper authorisation to the workspace. Authorisation for accessing this data is performed by using your API token obtained through the Hub UI as a Bearer token. An example of this is shown below.

Authorisation such as this is required for actions such as accessing private workspace data, running workflows, and purchasing commercial data.

```py 
from pystac_client import Client

# Set resource catalogue top-level url
rc_url = f"https://{platform_domain}/api/catalogue/stac/catalogs/user"

# Create STAC client with authentication
token = ""  # API token should be stored and accessed securely
stac_client = Client.open(rc_url, headers={"Authorization": f"Bearer {token}"})

# See that all the available children in this catalogue includes your workspace catalogue
children = stac_client.get_children()
for child in children:
    print(child.id)
```