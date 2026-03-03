# Starting a notebook

This guide will introduce the UK EO DataHub notebooks and provide a walk-through for getting started.

## Navigating to the notebooks
From the UK EO DataHub homepage, select notebooks from the navigation bar.

![](../../assets/doc_ns_int1.jpg)

You will be requested to sign in, if you are not already.

## Jupyter Hub

You will arrive at the Jupyter Hub. The Jupyter Hub allows management of notebook servers. From here, you can start, stop and create new notebooks.

![](../../assets/doc_ns_int2.jpg)

Your default server is controlled using the button(s) in the top center. Let's start the default server by clicking "Start My Server".

![](../../assets/doc_ns_int3.jpg)

Here you are presented with your options for your default server instance. These options are available each time you start any server.

First you must select your workspace. The UK EO DataHub provides tenanted workspaces to keep data segregated. The notebook workspace selection controls what workspace stores will be mounted into your notebook. You need to have a workspace setup before you can start a notebook server. See here to create a workspace.

Next, you must select a profile. The profile controls the image used to run the notebook server. The EO DataHub default image is recommended for most use cases, but vanilla Python and R images have also been provided. The EO DataHub image comes with some additional Linux and Python packages to help integrate with the EO DataHub, including pyeodh Python package, which includes a client for calling the EO DataHub APIs.

Once you have selected your workspace and profile, click "Start".

![](../../assets/doc_ns_int4.jpg)

You should see a loading screen as above. If any errors are reported, please contact a site administrator.

![](../../assets/doc_ns_int5.jpg)

If notebook creation is successful, you should be forwarded to the browser interface for your notebook.

## Creating a notebook

To create a new notebook, you can either select the Python 3 (ipykernel) tile from the Launcher window or right click the file browser and click New Notebook.

![](../../assets/doc_ns_int6.jpg)

Once you have a notebook open, the first thing to do is usually name the file. Right click on the untitled file in the file browser and rename as appropriate.

![](../../assets/doc_ns_int7.jpg)

You can write your code in the cells and execute using the play button at the top to execute the highlighted cell (or press shift+enter when cursor is in target cell). The output will appear below the cell.

To create a new cell, use the context menus that appear over cells when hovering. You can also create cells before the highlighted cell, or delete the highlighted cell.

## Terminal access

For more general access to the notebook server, you may utilise the Terminal. You can open a terminal instance from the notebook launcher.

![](../../assets/doc_ns_int8.jpg)

From the terminal you can interact with the server OS as you would with Linux, for instance creating or moving files, or editing them with Nano editor.

## Data persistence
When a notebook is started for a workspace, the workspace block (file) store and object (s3) stores are automatically mounted to the server for convenient access to your workspace stores.

The block store is mounted to the root of your user's system access ("/"). The object store is mounted to "/s3" directory as a POSIX file system where you can interact with the object store as you would a regular Linux file system.

By default, auto-save for open files is turned on in the Hub. You can disable this in Settings > Autosave Documents.

## Data upload / download

You can use the notebook file browser to upload to or download from the notebook server, and therefore your workspace stores.

![](../../assets/doc_ns_int10.jpg)

!!! tip
    
    Download a file by right clicking it and selecting download.
    
    Upload a file by clicking the upload icon in the file browser.

## Named servers

By default, JupyterHub only allows users to run one notebook server at a time. The UK EO DataHub allows additional notebooks to be run simultaneously, if required.

To create a named server, enter a name for the new server (this must be done first, or your default server will be assumed) and click "Add New Server".

![](../../assets/doc_ns_int11.jpg)

You will be requested to select your workspace and profile again, however please note that these can be set on each start of default or named servers.

A new (named) server instance will be created, which can be used independently of other server instances. However, please note that multiple notebook servers cannot be created for the same workspace for the same user. If you start a new notebook server for a workspace that you already have a notebook server running for, the previous server will be shutdown and restarted for the new server.

![](../../assets/doc_ns_int12.jpg)

## Shutting servers down

Once you are done with your server, please shut it down. You can do so from the Jupyter Hub. If you are in a notebook, you can navigate to the Hub by following File > Hub Control Panel.

![](../../assets/doc_ns_int13.jpg)

From the Hub, ensure that you stop any running servers, default or named, when you are done with them.

!!! note
    Logging out will not automatically shut down your notebook server. However, your notebook server will be culled after one hour of inactivity, if left unattended.

