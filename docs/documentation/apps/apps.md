# What is an App?

An app, in the context of the UK EO DataHub, is a 3rd party application that can access the Hub APIs and utilise them to provide bespoke functionality to the end user. This can involve querying STAC data from the resource catalogue and processing the data with custom workflows to output bespoke data products. If the app has a frontend, this data can also be displayed in useful ways to the user.

## When should I create an App?

You should create an app if you require any of the following:

* You have a data processing workflow you wish to expose to end users, either for them to run on public data, on their own data (in the EO DataHub) or from your own data (also in the EO DataHub).
* You wish to combine datasets available from the EO DataHub into bespoke data products and make them available to end users through your app.
* You have custom views in a web app you can present EO DataHub data to end users.

## Types of Apps
Apps can be:

* Client-side web apps
* Server-side web apps
* Desktop app
* Mobile app

As long as you can integrate with the Hub OIDC and retrieve an OIDC token on behalf of the end user then your app can utilise the Hub APIs on behalf of an end user.