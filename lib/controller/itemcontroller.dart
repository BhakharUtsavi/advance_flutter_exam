import 'package:get/get.dart';

class ItemController extends GetxController {
  var itemList = <Map<String, String>>[].obs;
  var auctionList = <Map<String, String>>[].obs;

  void addItem(String name, String category, String price) {
    itemList.add({
      'name': name,
      'category': category,
      'price': price,
    });
    update();
  }

  void updateItem(int index, String name, String category, String price) {
    itemList[index] = {
      'name': name,
      'category': category,
      'price': price,
    };
    update();
  }

  void deleteItem(int index) {
    itemList.removeAt(index);
    update();
  }

  void markForAuction(int index) {
    auctionList.add(itemList[index]);
    update();
  }

  void removeFromAuction(int index) {
    auctionList.removeAt(index);
    update();
  }
}
