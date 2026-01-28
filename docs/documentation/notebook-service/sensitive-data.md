# Handling sensitive information

A guide to securely managing sensitive data in notebooks.

## Using secrets in notebooks

When writing notebooks you may need to use sensitive data, such as username and passwords or API keys, to authenticate against external services. Storing these secrets directly in a notebook is not recommended, as you may accidentally share this data with others (e.g. by committing to Git).

Instead, it is recommended that you save any sensitive data in .env files, separate from your notebook. These can be read in by your notebook for use in your code.

## Environment files

Environment files (.env file) are are a simple text file used to store sensitive information in a secure and organized way. They are a standard way of separating sensitive data from your notebook code, making it easier to share or version-control your scripts without exposing private information. They generally take the form below.

```bash
USERNAME=myusername
PASSWORD=mypassword
```

.env files contain key, value pairs separated by an equals sign. One key, value pair per line. They generally have the extension ".env", which can be the entire filename or you can create multiple .env files with different name, e.g. test1.env, test2.env.

??? tip "Working on Linux" 
    In Linux, on which the notebook server is based, filenames starting with "." are hidden, so they will not appear in the file browser panel. This may be desired when dealing with environment files containing sensitive data. If you wish to edit a hidden file, you can do so from the terminal by executing `nano .env`, which will use the terminal editor Nano to edit the file.

## Creating an environment file

In the same directory as the notebook you are working in, create a plain text file named .env. You don't need any special tools or scripts, just create a regular file and name it .env.
Make sure you have generated an API key for your workspace. Follow this guide to create one if you haven't already, or copy an existing one. Ensure the key you are using hasn't expired.
Populate the text file with the example code above, replacing myusername with the name of your workspace and mypassword with your actual API key, sourced from the corresponding workspace. These must match for the workspace to authenticate correctly. For example:

```bash
USERNAME="my-eodh-workspace-name"
PASSWORD="XXXXXXXXXXXXXXX"
```

More guidance on how to create an environment file can be found here.

## Reading in environment files
When an environment file is read in, the key, values within are loaded into Python environment variables, which are available through the os.environ package. The Python package Dotenv can be useful to read environment files into environment variables.

## Dotenv (Python package)

The Dotenv Python package is included in the default python notebook image. It allows you to easily read in environment files specified by filename into Python environment variables, which can then be assigned to local variables.

```py
import os
from dotenv import load_dotenv

load_dotenv(".env")

username = os.environ["USERNAME"]
password = os.environ["PASSWORD"]
```

## Sensitive data usage

Once you have separated out the storage of your sensitive data, it is also important not to expose it in your notebooks. Avoid printing or logging sensitive data, as this may be preserved in cell outputs. If you are using Git to version control your notebook, ensure that "*.env" has been added to your .gitignore file so that environment files are never committed.

## Summary

Sensitive data should not be stored directly in notebooks. It should be decoupled from notebook code and stored in separate .env (environment) files.

The Dotenv Python package is provided to facilitate the use of .env files. Sensitive data should be read in from .env files and assigned to local variables in your notebook, for use as required.

!!! danger
    Take care not to expose sensitive data by printing it out in cell outputs, or by committing your .env files to Git.