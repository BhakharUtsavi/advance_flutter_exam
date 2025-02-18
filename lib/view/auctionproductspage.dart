import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/itemcontroller.dart';

class AuctionProductsPage extends StatelessWidget {
  const AuctionProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> item = Get.arguments;
    final ItemController controller = Get.find<ItemController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Auction Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              controller.deleteItemFromAuction(item);
              Get.back();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Item Name: ${item['name']}'),
            Text('Category: ${item['category']}'),
            Text('Price: \$${item['price']}'),
          ],
        ),
      ),
    );
  }
}
