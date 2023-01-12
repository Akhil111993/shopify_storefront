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