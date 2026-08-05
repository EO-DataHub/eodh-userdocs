# Linking Planet, Airbus and Open Cosmos accounts to the EODH

!!! info
    Users are able to associate their commercial data accounts with their EODH account in the [workspaces](https://eodatahub.org.uk/workspaces) page as long as those providers are supported by the Hub. Airbus, Planet and Open Cosmos are currently supported. The process for each supported data provider, respectively, is outlined below.

## Airbus

To access Airbus content on the EODH, your OneAtlas account must be configured with a contract that will send ordered data to the EODH.

* Request a OneAtlas account via the [website](https://intelligence.airbus.com/) if you are not already a customer. New customers are first onboarded by the Airbus customer service team.
* Contact the Airbus customer service team at [ukintelligence-imagerysupport@airbus.com](mailto:ukintelligence-imagerysupport@airbus.com) stating that you would like access to Airbus Optical, and/or Radar data via the EODH.
* The Airbus team will create new contracts to operate on the EODH.
* Once this is complete, please self-serve an Airbus API Key via the [OneAtlas Developer Portal](https://www.geoapi-airbusds.com/) ‘Get your API Key’.

<img width="941" height="404" alt="api-key-airbus-neutral" src="https://github.com/user-attachments/assets/b0cb75f5-0934-4528-836e-6d6f4a913b0e" />

The Airbus API key then be registered to a workspace in the EODH platform under 'Linked accounts' for a selected workspace on the workspaces page. If you have multiple contracts associated with the key then you must choose which ones to assign to the workspace. By default these will be auto assigned based on the input API key. The linked API key and contracts will then be used for orders placed by members of the workspace, and data will be delivered directly to the workspace. See [Linked accounts](../../Getting-Started/workspaces/linked-accounts.md) for more details.

## Planet

Existing Planet accounts can be accessed via the EODH by using their API key. Your API key can be found on your [Account](https://www.planet.com/account) page under the [My Settings](https://www.planet.com/account/#/user-settings) tab. You may only have one active API key at a time. To create a Planet account, please email the Planet team. Contact [eodatahub@planet.com](mailto:eodatahub@planet.com) for dedicated support with Planet access.

<img width="960" height="347" alt="api-key-planet-neutral" src="https://github.com/user-attachments/assets/fff2ce5e-63fe-4d7c-8eed-408210475996" />

The [Planet API key](https://developers.planet.com/quickstart/apis/#find-your-api-key) can then be registered to a workspace in the EODH platform under ’Linked accounts’ for a selected workspace on the ’Workspaces’ page. The linked API key will then be used for orders placed by members of the workspace, and data will be delivered directly to the workspace. See [Linked accounts](../../Getting-Started/workspaces/linked-accounts.md) for more details.

## Open Cosmos

Existing Open Cosmos accounts can be linked to the EODH using your Open Cosmos Organisation ID, rather than an API key. Log in to the [Open Cosmos app](https://app.open-cosmos.com/), click your initials in the bottom left-hand corner, go to 'Organisations', and click 'Configure' next to the organisation you wish to use. Your Organisation ID is shown on this page as `id:<organisationid>`.

This Organisation ID can then be entered under 'Linked accounts' for a selected workspace on the 'Workspaces' page. Clicking 'Connect Open Cosmos' will take you to the Open Cosmos site to confirm that you want to link your account to the Hub. Once linked, orders placed by members of the workspace will use this connection, and data will be delivered directly to the workspace. See [Linked accounts](../../Getting-Started/workspaces/linked-accounts.md) for more details.
