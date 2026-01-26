# Creating an App

To provide bespoke functionality to end users app developers can integrate their apps with the UK EO DataHub. This allows for user single sign-on between your app and the DataHub, allowing you to call the Hub APIs on behalf of the user. You can access the resource catalogue, user workspaces, your app workspaces and execute workflows to process the data.

## Integration With the Hub Authentication

To integrate your app with the EO DataHub you must request an OIDC client be created for you in the Hub. For now, this is a manual request using our Help Scout beacon (bottom left).

You can request either a Public or Confidential client. A public client is used for a front end application, whereas a confidential client is used for a backend app. One of the differences is that a frontend client will only require a client ID to authenticate, whereas a backend client requires both a client ID and client secret.

The EO DataHub uses Keycloak as its OIDC Identity Provider. Keycloak clients exist for most major programming languages and will assist in your integration, although you are also free to write your own and implement the required OIDC flows.

Once your OIDC client has been created, you will be provided with a client ID (and secret, if a confidential app), and you are ready for integration.

## OIDC Flows

Your Hub client supports the following OIDC flows:

* Standard Flow - the default. This allows the user to authenticate with the Hub using a 3rd party Identity Provider. Currently GitHub and Google are both supported.
* Direct Access Grant - This allows the user to directly authenticate with a username and password. This is discouraged for the user, but may be necessary for some use cases, such as automated integration tests.
* Service Account Roles - This allows your app to authenticate as a machine user. Although not a common use case for EO DataHub apps, it is available as an option.

!!! note
    Generally, Standard Flow will suffice.