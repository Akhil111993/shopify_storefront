import 'package:flutter/material.dart';
import 'package:shopify_storefront/shopify_storefront.dart';

String query = "query {shop { name } }";

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  void handleError(error) {
    /*
    String errorMessage = error.message ?? '';
    if (error is BadRequestException) {
      showToast(desc: errorMessage);
    } else if (error is FetchDataException) {
      showErrorDialog(desc: errorMessage);
    } else if (error is ApiNotRespondingException) {
      showErrorDialog(
        desc: 'It takes long to respond',
      );
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          ShopifyStoreFront('xgg85i66544852o7894byy6ii8546p9', 'esefire-wel')
              .fetchDataFromShopify(query, handleError),
      builder: (context, snapshot) => Text(snapshot.data ?? ''),
    );
  }
}
