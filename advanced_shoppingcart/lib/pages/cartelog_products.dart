// ignore_for_file: sized_box_for_whitespace

import 'package:advanced_shoppingcart/controllers/authController.dart';
import 'package:advanced_shoppingcart/controllers/cart_controller.dart';
import 'package:advanced_shoppingcart/controllers/product_controller.dart';
import 'package:advanced_shoppingcart/pages/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cartelog extends StatelessWidget {
  Cartelog({Key? key}) : super(key: key);

  // text editing controller
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cartCont = Get.put(cartController());
    final controller = Get.put(AuthController());
    final productController = Get.put(ProductController());
    //final productsList = cartCont.searchList;

    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.cyan[300],
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cartalogue',
                    style: TextStyle(fontSize: 27),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.signOut();
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            )),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _textController.clear(),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      _textController.text.toLowerCase();
                      productController.searchQuery(value);
                    },
                  ),
                ),
                Obx(
                  () => productController.searchListQuery.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                          itemCount: productController.searchListQuery.length,
                          itemBuilder: (context, index) => ProductCard(
                            index: index,
                          ),
                        ))
                      : Center(
                          child: Text(
                            'No products found for search word ${_textController.text}',
                          ),
                        ),
                ),
                ElevatedButton(
                  child: const Text('Go to cart'),
                  onPressed: () {
                    Get.to(() => CartItems());
                  },
                ),
                const SizedBox(height: 90),
              ],
            ),
          ),
        ));
  }
}

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  //final Product prd;

  final cartCont = Get.put(cartController());
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 15),
      child: Card(
        elevation: 10,
        color: Colors.blue[50],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                        productController.searchListQuery[index].imageUrl,
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                      onPressed: () {
                        cartCont.addProduct(
                            productController.searchListQuery[index]);
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        size: 35,
                      )),
                ),
                Positioned(
                    bottom: 10,
                    right: 10,
                    left: 10,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            productController.searchListQuery[index].name,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          Text(
                            '\$${productController.searchListQuery[index].price.toString()}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ]))
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Text(productController.searchListQuery[index].description,
                  style: const TextStyle(fontSize: 18)),
            )
          ],
        ),
      ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     CircleAvatar(
      //       backgroundImage: NetworkImage(productController.products[index].imageUrl),
      //       radius: 40,
      //     ),
      //     const SizedBox(width: 12),
      //     Expanded(
      //         child: Text(
      //       productController.products[index].name,
      //       style: const TextStyle(fontWeight: FontWeight.bold),
      //     )),
      //     Expanded(
      //         child: Text(
      //       productController.products[index].price.toString(),
      //       style: const TextStyle(fontWeight: FontWeight.bold),
      //     )),
      //     IconButton(
      //         onPressed: () {
      //           cartCont.addProduct(productController.products[index]);
      //         },
      //         icon: const Icon(Icons.add_circle))
      //   ],
      // ),
    );
  }
}
