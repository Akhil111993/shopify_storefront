library shopify_storefront;

import 'base_client.dart';

class ShopifyStoreFront {
  String token;
  String shopifyAppName;
  String shopifyVersion;

  ///token = your shopify access token
  ///shopify app name = shopify store name. In xyz.myshopify.com, xyz is the app name
  ///By default, shopify version is 2023-01
  ShopifyStoreFront(this.token, this.shopifyAppName,
      {this.shopifyVersion = '2023-01'});

  ///query = "query {shop { name } }"
  Future<String> fetchDataFromShopify(String query, Function onError) async {
    String queryStr = '{"query": "$query"}';
    var responseString = await BaseClient().post(
        'https://$shopifyAppName.myshopify.com/api/$shopifyVersion/graphql.json',
        queryStr, {
      'content-type': 'application/json',
      'X-Shopify-Storefront-Access-Token': token
    }).catchError(onError);

    if (responseString == null) {
      return '404';
    } else {
      return responseString.toString();
    }
  }
}
