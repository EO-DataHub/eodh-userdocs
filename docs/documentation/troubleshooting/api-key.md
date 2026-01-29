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