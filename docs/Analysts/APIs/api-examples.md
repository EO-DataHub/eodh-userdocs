# Example API tutorials

Here are some examples highlighting the possibilities of working with Hub APIs are detailed here. These are designed to aid you in starting to use Hub functionality programmatically. You can explore the full list of the Hub’s APIs using the interactive documentation viewer hosted here.

## Browsing the catalogue

Public and commercial catalogues are collated in the Hub under one STAC catalogue which can be navigated programmatically. Spatiotemporal and keyword searches are supported, allowing you to navigate through our extensive catalogue to find the data that matters to you. Examples using Python's `pystac` module follow.

All examples first require you to initialise a stac client:

```py 
from pystac_client import Client

# Set resource catalogue top-level url
rc_url = f"https://eodatahub.org.uk/api/catalogue/stac"

# Create STAC client
stac_client = Client.open(rc_url)
```

## Keyword search

Where keywords have been set by catalogues harvested into the datahub, keywords can be used to search for both items and the collections containing them.

```py
collection_search = stac_client.collection_search(
    q="climate",
)
print(f"{collection_search.matched()} collections found")
for collection in collection_search.collections():
    print(collection.id)
```

## Temporal search

Collections and items can be filtered by a date range, that may be open ended.

```py 
# Looking into the future
time_to_search = "2026-01-06T00:00:00Z/.."
collection_search = stac_client.collection_search(
    datetime=time_to_search,
)
print(f"{collection_search.matched()} collections found")
for collection in collection_search.collections():
    print(collection.id)
```

## Spatial search

You can perform a search for items that intersect a polygon of interest.

```py
# Geometry for the UK
geom = {
    "type": "Polygon",
    "coordinates": [
        [
            [-4.41191386337143, 50.5437323318846],
            [-2.86223024423239, 50.5522106222613],
            [-2.86502949737798, 49.564676297854],
            [-4.3832372671439, 49.5564878434316],
            [-4.41191386337143, 50.5437323318846]
        ]
    ],
}
search = stac_client.search(
    max_items=10,
    collections=['cmip6'],
    intersects=geom,
)
for item in search.items():
    print(item.id)
```

## Filter search

Complex queries can be built up and stacked with a filter search.

```py
filter = {
        "op": "and",
        "args": [
          {
            "op": "between",
            "args": [
              {
                "property": "properties.datetime"
              },
              "2020-01-12T00:00:00.000Z",
              "2025-02-12T23:59:59.999Z"
            ]
          },
          {
            "op": "and",
            "args": [
              {
                "op": "=",
                "args": [
                  {
                    "property": "collection"
                  },
                  "sentinel2_ard"
                ]
              },
              {
                "op": "<=",
                "args": [
                  {
                    "property": "properties.eo:cloud_cover"
                  },
                  5
                ]
              }
            ]
          }
        ]
      }
    
search = stac_client.search(
    max_items=10,
    filter=filter,
    fields={"include": ["properties.datetime", "properties.eo:cloud_cover"]},
)

for item in search.items():
    print(item.id)
    print(f"Datetime is {item.properties['datetime']}")
    print(f"Cloud cover is {item.properties['eo:cloud_cover']}")
```

### Finding assets

Once an item of interest has been obtained, follow the asset links to download relevant data. These links may be externally hosted by our trusted data providers.

```py
assets = item.get_assets()

for asset in assets:
    print(f"Asset {asset} is available at {assets[asset].href}")
```

### Commercial data

Commercial data from Airbus and Planet can be ordered directly through our APIs. Before following these instructions, please ensure that your Hub account is linked to an Airbus or Planet account as described here.

Firstly, an item of interest from our catalogue should be obtained. For guidance on browsing the commercial catalogue, please see the section above, "Browsing the catalogue".

```py
# Search for airbus data that meets certain criteria
search = stac_client.search(collections=["airbus_pneo_data"], bbox=[10.854492,49.823809,100.762709,60.860699], max_items=10)

# View all the items returned
for item in search.items():
    print(item.id)

# For demonstration purposes, pick one of these items
chosen_item = item

# with the user's chosen item then can extract the link for this item in preparation to order its associated data
item_links = chosen_item.links

for link in item_links:
    if link.rel == "self":
        item_href = link.href
        print(f"Chosen item href: {item_href}")
```

You can obtain a quote for a commercial item via a POST request to /quote at the item's href. This must be done with Hub authorisation as it will use your linked API key. Airbus requires a licence as part of the request. Airbus optical and most Planet items can be clipped with an AOI to limit the area to be purchased

```py
import requests

token = ""  # Your Hub API should be stored and obtained securely

# An example item for demonstration purposes
item_href = "https://eodatahub.org.uk/api/catalogue/stac/catalogs/commercial/catalogs/airbus/collections/airbus_phr_data/items/DS_PHR1A_201203021558128_FR1_PX_W080S03_0221_01728"

url = f"{item_href}/quote"
headers = {
    'accept': 'application/json', 
    'Content-Type': 'application/json', 
    'Authorization': f'Bearer {token}'
}
data =  {
    "licence": "Standard",
    "coordinates": [
        [
            [-79.8,-2.1], 
            [-79.8,-2.2], 
            [-79.95,-2.2], 
            [-79.95,-2.1], 
            [-79.8,-2.1]
        ]
    ]
}

response = requests.post(url, headers=headers, json=data)

print("Status Code", response.status_code)
print("Response ", response.json())
```

Once you are happy with the item and pricing, place an order directly through the API. The response body will contain the STAC item ingested into your workspace catalogue, and there will be a location header to this item that can be used to track the status of your order and view assets when they are delivered.

```py
import requests

item_href = "https://eodatahub.org.uk/api/catalogue/stac/catalogs/commercial/catalogs/airbus/collections/airbus_phr_data/items/DS_PHR1A_201203021558128_FR1_PX_W080S03_0221_01728"
url = f"{item_href}/order"
headers = {
    'accept': 'application/json', 
    'Content-Type': 'application/json', 
    'Authorization': f'Bearer {token}'
}
data =  {
    "licence": "Standard",
    "endUserCountry": "GB",
    "productBundle": "General use", 
    "coordinates": [
        [
            [-79.8,-2.1], 
            [-79.8,-2.2], 
            [-79.95,-2.2], 
            [-79.95,-2.1], 
            [-79.8,-2.1]
        ]
    ]
}

response = requests.post(url, headers=headers, json=data)

print("Status Code", response.status_code)
print("Response ", response.json())
```

## Workflows

Workflows can be uploaded, run, and managed through Hub APIs using your workspace token for authorisation. For details, please see the dedicated Workflow help page.

### Workspace data management
Files stored in your workspace block and object stores can be viewed through authenticated GET requests in a browser or an API call, but they can also be managed through PUT or DELETE requests to the Hub API.

```bash
curl --request PUT --upload-file file.tif -H "Authorization: Bearer <HubAPItoken> https://<workspace>.eodatahub-workspaces.org.uk/files/workspaces-eodhp/file.tif
```

## Data Visualisation

Data can be visualised in the EO DataHub Platform, allowing users to render and explore geospatial datasets (such as satellite imagery or raster data) directly in their browser or GIS software, without needing to download entire files. See the Data Visualisation page for examples and information on the APIs used to accomplish this.