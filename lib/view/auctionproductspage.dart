import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ItemController>(
          builder: (_) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: itemController.auctionList.length,
              itemBuilder: (context, index) {
                final item = itemController.auctionList[index];
                return Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: ${item['name']}',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Category: ${item['category']}',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Price: \$${item['price']}',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            removeFromAuction(context, index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
                //   ListTile(
                //   title: Text('Name: ${item['name']}'),
                //   subtitle: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //           'Category: ${item['category']}'),
                //       Text(
                //           'Price: \$${item['price']}'),
                //     ],
                //   ),
                //   trailing: IconButton(
                //     icon: Icon(Icons.delete),
                //     onPressed: () {
                //       removeFromAuction(context, index);
                //     },
                //   ),
                // );
              },
            );
          },
        ),
      ),
    );
  }
}
