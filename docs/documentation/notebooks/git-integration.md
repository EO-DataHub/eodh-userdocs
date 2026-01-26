# Version control and notebooks

The Git extension for Jupyter Lab allows users to perform Git actions using the notebook web UI. This allows a user to clone example Notebooks or workflows directly into their notebook instance so that they can run such code inside their own workspace.

Git integration also allows users to develop code and push changes directly from the notebook environment, enabling version control and allowing code to be shared with other developers.

The extension is available through the left sidebar.

__INSERT IMAGE__

!!! note
    Make sure you are in the desired file system directory before switching to the Git extension panel.


## Initialisation

Before using the Git extension, you must tell Git who you are. Execute the following commands in the notebook terminal. To open the notebook terminal, follow this guide.

```bash
git config --global user.name "My Name"
git config --global user.email "myemail@example.com"
```

You can set this up with any name and email address you choose. These details will appear if you update any GitHub repositories. You may choose to use the same name and email address as is associated with your GitHub account, but this is not required.

## Authorisation

The Git extension can handle the authorisation for http(s) repositories by requesting your username and password, when required. Any entered credentials will be cached for one hour.

If, instead, you wish to authenticate against the remote repository using SSH (Secure Shell), you will need to configure your SSH credentials within the notebook environment. To do this, first generate an SSH key pair, for example using ssh-keygen, and then add the public key to your Git provider account. This then allows you to clone a Git repository using the SSH link, rather than http(s).

!!! tip
    `ssh-keygen` will guide you through creating local SSH credentials, which you can then add to your remote Git provider.

## Cloning a repository

To clone your GitHub repository, select Clone a Repository in the left panel and paste your repository's URL into the pop up box. Once successfully cloned you should receive the confirmation as below.

__INSERT IMAGE__

!!! note
    For SSH authentication, you can instead use the terminal and SSH link provided by your Git provider.

    ```bash
        git clone git@github.com:<owner>/<repository-name>.git
    ```

For public repositories, no authentication is required when cloning them into your notebook. However, for private repositories, you will be prompted at this point to provide access credentials, including your username and personal access token.

You can create a personal access key via GitHub following this documentation. Your username should reflect the username associated with your GitHub account. This does not need to be the same account associated with your DataHub account, even if you used GitHub authentication when creating your DataHub account.

!!! warning
    If the repository fails to clone, your credentials may be incorrect, ensure that your access token has the correct permissions to access the selected repository.

The repository should appear as a named folder in the left-hand pane.

You can now make the desired edits to your file or code in the editor. These changes will log in the Changed tab under the name of the edited file.

__INSERT IMAGE__

## Committing changes to your repository
The new changes can be staged by clicking the + icon. The edits should move to the Staged tab from the Changed tab.

You will then be prompted to add a commit summary and description (optional). Once all the required fields are populated, the commit button will enable, by turning blue.

__INSERT IMAGE__

You can now click the Commit button to commit these changes to the branch. You should receive the following success message.

__INSERT IMAGE__

## Pushing committed changes to GitHub

Click the icon in the top-left banner, indicated by an orange dot, to push the changes to your GitHub repository.

__INSERT IMAGE__

Once clicked, you will be asked for the following information to connect to that repository.

__INSERT IMAGE__

The instructions to generate a personal access token can be found above, ensure your token has read/write access to your selected repository.

Click Ok to push the committed changes. You should receive notification that the push was successful as below. Visit your GitHub repository to confirm the pushed changes are reflected.

__INSERT IMAGE__

If, instead, you see a warning saying the push failed, as below, please check your username is correct and that your personal access token has the correct permissions to make changes to your chosen repository.

__INSERT IMAGE__