# Troubleshooting Notebook issues

!!! bug
   If you continue to experience issues, then please contact us at [enquiries@eodatahub.org.uk](mailto: enquiries@eodatahub.org.uk).

## File load/save error for <file>

This is a known bug and is being actively worked on. When attempting to open or save a file the error is shown. The user resolution is to refresh the browser page. For a file load error there is no risk to the user, the file should load successfully after refresh. For file save, there is a risk to lose recent data. This is mitigated by the autosave feature (enabled by default) but when refreshing the page any unsaved content will be lost, so save often until this bug has been resolved.

![](../../assets/ep_ts_nb1.png)

## Problems authenticating the connection to your workspace

If you are struggling to connect to your workspace within the Jupyter notebooks environment, this could be related to the API key you are using to connect with, which you have likely stored within an environment file. Follow this guidance to troubleshoot issues related to API keys.