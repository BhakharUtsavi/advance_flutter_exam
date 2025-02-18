import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemController extends GetxController {
  var itemList = <Map<String, dynamic>>[].obs;
  var auctionList = <Map<String, dynamic>>[].obs;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void deleteItemFromAuction(Map<String, dynamic> item) {
    itemList.remove(item);
  }

  void addItem(String name, String category, String price) {
    itemList.add({
      'name': name,
      'category': category,
      'price': price,
    });
  }

  void updateItem(int index, String name, String category, String price) {
    itemList[index] = {
      'name': name,
      'category': category,
      'price': price,
    };
  }

  @override
  void onInit() {
    fetchItems();
    super.onInit();
  }

  void fetchItems() async {
    var snapshot = await _db.collection('items').get();
    itemList.value = snapshot.docs
        .map((doc) => {
              'id': doc.id,
              'name': doc['name'],
              'category': doc['category'],
              'price': doc['price'],
            })
        .toList();
  }

  void deleteItem(int index) async {
    String id = itemList[index]['id']!;
    await _db.collection('items').doc(id).delete();
    itemList.removeAt(index);
  }

  void markForAuction(int index) {
    auctionList.add(itemList[index]);
  }

  void removeFromAuction(int index) {
    auctionList.removeAt(index);
  }
}
