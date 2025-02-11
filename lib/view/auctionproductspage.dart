import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/itemcontroller.dart';

class AuctionProductsPage extends StatelessWidget {
  const AuctionProductsPage({super.key});

  void removeFromAuction(BuildContext context, int index) {
    final itemController = Get.find<ItemController>();
    itemController.removeFromAuction(index);
  }

  @override
  Widget build(BuildContext context) {
    final itemController = Get.find<ItemController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Auction Products'),
      ),
      body: GetBuilder<ItemController>(
        builder: (_) {
          return ListView.builder(
            itemCount: itemController.auctionList.length,
            itemBuilder: (context, index) {
              final item = itemController.auctionList[index];
              return ListTile(
                title: Text('Name: ${item['name']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Category: ${item['category']}'),
                    Text(
                        'Price: \$${item['price']}'),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    removeFromAuction(context, index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
