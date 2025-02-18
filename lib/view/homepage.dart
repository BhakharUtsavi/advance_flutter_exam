import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/itemcontroller.dart';

class HomePage extends StatelessWidget {
  final ItemController controller = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items List'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _showAddItemDialog(context);
            },
            child: Text('Add Item'),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.itemList.length,
                itemBuilder: (context, index) {
                  var item = controller.itemList[index];
                  return ListTile(
                    title: Text(item['name']),
                    subtitle: Text(
                        'Category: ${item['category']} - Price: ${item['price']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Edit Button
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _showEditItemDialog(context, index);
                          },
                        ),
                        // Delete Button
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            controller.deleteItem(index);
                          },
                        ),
                        // Read Button
                        IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            Get.toNamed('/auction', arguments: item);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Item Name'),
              ),
              TextField(
                controller: categoryController,
                decoration: InputDecoration(labelText: 'Category'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String name = nameController.text;
                String category = categoryController.text;
                String price = priceController.text;

                if (name.isNotEmpty &&
                    category.isNotEmpty &&
                    price.isNotEmpty) {
                  controller.addItem(name, category, price);
                  Navigator.of(context).pop();
                } else {
                  Get.snackbar('Error', 'Please fill in all fields');
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditItemDialog(BuildContext context, int index) {
    TextEditingController nameController =
        TextEditingController(text: controller.itemList[index]['name']);
    TextEditingController categoryController =
        TextEditingController(text: controller.itemList[index]['category']);
    TextEditingController priceController =
        TextEditingController(text: controller.itemList[index]['price']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Item Name'),
              ),
              TextField(
                controller: categoryController,
                decoration: InputDecoration(labelText: 'Category'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String name = nameController.text;
                String category = categoryController.text;
                String price = priceController.text;

                if (name.isNotEmpty &&
                    category.isNotEmpty &&
                    price.isNotEmpty) {
                  controller.updateItem(index, name, category, price);
                  Navigator.of(context).pop();
                } else {
                  Get.snackbar('Error', 'Please fill in all fields');
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
