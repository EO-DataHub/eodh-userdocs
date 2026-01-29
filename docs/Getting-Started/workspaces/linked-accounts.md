# Linked Accounts

!!! note
    Linked accounts allow you to store your provider API key in the Hub allowing you to order commercial data within the context of a specific workspace. The platform currently supports two commercial data providers for this, namely Airbus and Planet.

## Connect up to your commercial data provider
Navigate to the workspaces tab and click on Linked Accounts as shown below.

![](../../assets/gs_ws_la1.png)

## Link your Airbus account

Required for accessing Airbus data on the Hub. Request a OneAtlas account via the website. Configure your OneAtlas account to send data to the EODH by following these instructions. The API should be entered as a one-time input in Workspaces > Linked accounts as seen below.

![](../../assets/gs_ws_la2.png)

After clicking 'Validate API key', you should be presented with your contract ID options for PNEO and Legacy orders, and an indication if your account is set up for Radar orders. Select appropriate contracts if required, and then link your account.

![](../../assets/gs_ws_la3.png)

Contact ukintelligence-imagerysupport@airbus.com for dedicated support with Airbus access. If you are not presented with contracts, please ensure you have followed these steps to set up your Airbus account before contacting support.

## Link your Planet account

Required for accessing Planet data on the Hub. Create a Planet account, if you don't currently have one, by emailing the Planet team. Connect to the EODH using your API key, which can be found here. Input the API key under Workspaces > Linked accounts and click Link Account, as shown below. This is a one-time input.

![](../../assets/gs_ws_la4.png)

Once you have input a valid API key and validated it, you can then proceed to link it to your workspace.

![](../../assets/gs_ws_la5.png)

Contact eodatahub@planet.com for dedicated support with Planet access.

## Ready to order
Once you have connected your account with the relevant data provider to your workspace, you will now be able to order data via the EODH from that provider, either within the Resource Catalogue, or from a notebook in JupyterHub.

[Order commercial data :fontawesome-solid-paper-plane:](https://eodatahub.org.uk/data/commercial/ordering-commercial-data/){.mk-button}