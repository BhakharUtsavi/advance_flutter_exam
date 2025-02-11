import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/itemcontroller.dart';
import 'auctionproductspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ItemController itemController = Get.put(ItemController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  int? editingIndex;

  void showCustomDialog(BuildContext context, {int? index}) {
    if (index != null) {
      final item = itemController.itemList[index];
      nameController.text = item['name']!;
      categoryController.text = item['category']!;
      priceController.text = item['price']!;
    } else {
      nameController.clear();
      categoryController.clear();
      priceController.clear();
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(index == null ? 'Add New Item' : 'Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Enter Name'),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: categoryController,
                decoration: InputDecoration(labelText: 'Enter Category'),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Enter Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (index == null) {
                  itemController.addItem(
                    nameController.text,
                    categoryController.text,
                    priceController.text,
                  );
                } else {
                  itemController.updateItem(
                    index,
                    nameController.text,
                    categoryController.text,
                    priceController.text,
                  );
                }

                nameController.clear();
                categoryController.clear();
                priceController.clear();

                Navigator.of(context).pop();
              },
              child: Text(index == null ? 'Add' : 'Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void deleteItem(int index) {
    itemController.deleteItem(index);
  }

  void markForAuction(int index) {
    itemController.markForAuction(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.gavel),
            onPressed: () {
              Get.to(AuctionProductsPage());
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCustomDialog(context);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<ItemController>(
        builder: (_) {
          return ListView.builder(
            itemCount: itemController.itemList.length,
            itemBuilder: (context, index) {
              final item = itemController.itemList[index];
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
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        showCustomDialog(context, index: index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteItem(index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.bookmark_add),
                      onPressed: () {
                        markForAuction(index);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
