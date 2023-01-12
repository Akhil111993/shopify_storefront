A package for Shopify Storefront GraphQL queries. 

## Features

Simply make Shopify GraphQL queries in just 2 lines of code. The list of queries you can make is available at https://shopify.dev/custom-storefronts/tools/graphiql-storefront-api. This Package is only tested for Storefront APIs. Make a Flutter app from Shopify website as simple as that.
Exception handling is already included. 


## Getting started

You have to have a Shopify website to start using this package. This package is used only when you need a Flutter app based on your Shopify website. This package is only tested with storefront api which is used to get product details, customer details etc. A full list of available items can be seen in the link below
https://shopify.dev/custom-storefronts/tools/graphiql-storefront-api
The latest version of the Storefront api can also be noted from the above link. The default version we are using is 2023-01. You can change it from the code. You have to create a custom app from the shopify dashboard to get access token.  

## Usage

Just add the access token, app name and query in that one line of code

```dart
String query = "query {shop { name } }";
...
...
return FutureBuilder(
      future: ShopifyStoreFront(
              'xgg85i66544852o7894byy6ii8546p9', 'esefire-wel')
          .fetchDataFromShopify(query),
      builder: (context, snapshot) => Text(snapshot.data ?? ''),
    );

```

## Additional information

All contributions are encouraged. 

