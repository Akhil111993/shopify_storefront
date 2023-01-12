library shopify_storefront;

import 'base_client.dart';

class ShopifyStoreFront {
  String token;
  String shopifyAppName;
  String shopifyVersion;
  ShopifyStoreFront(this.token, this.shopifyAppName,
      {this.shopifyVersion = '2023-01'});
  Future<String> fetchDataFromShopify(String query) async {
    var responseString = await BaseClient().post(
        'https://$shopifyAppName.myshopify.com/api/$shopifyVersion/graphql.json',
        query, {
      'content-type': 'application/json',
      'X-Shopify-Storefront-Access-Token': token
    });

    if (responseString == null) {
      return '404';
    } else {
      return responseString.toString();
    }
  }
}
