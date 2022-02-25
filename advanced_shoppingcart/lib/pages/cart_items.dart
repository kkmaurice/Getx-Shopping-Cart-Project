// ignore_for_file: sized_box_for_whitespace

import 'package:advanced_shoppingcart/controllers/cart_controller.dart';
import 'package:advanced_shoppingcart/models/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItems extends StatelessWidget {
  CartItems({Key? key}) : super(key: key);

  final cartCont = Get.find<cartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(onPressed: () => cartCont.clear(),
          icon: const Icon(Icons.remove_shopping_cart,size: 25,color: Colors.red,))
        ],
      ),
      body: Container(
        color: Colors.blue[100],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: cartCont.products.length,
                  itemBuilder: (context, index) => CartProducts(
                        controller: cartCont,
                        product: cartCont.products.keys.toList()[index],
                        index: index,
                        quantity: cartCont.products.values.toList()[index],
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Obx(() => Text('\$${cartCont.totalPrice.toStringAsFixed(3)}',style: const TextStyle(fontSize: 25),))
                ],
              ),
            ),
            const SizedBox(height: 100,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){},
      backgroundColor: Colors.amber
      , 
      icon: const Icon(Icons.shopping_cart,color: 
      Colors.black, size: 25,),
      label: Obx(() => Text('${cartCont.totalProducts}',style: const TextStyle(color: 
      Colors.black,fontSize: 20),))),
    );
  }
}

class CartProducts extends StatelessWidget {
  final cartController controller;
  final Product product;
  final int index;
  final int quantity;

  const CartProducts({
    Key? key,
    required this.controller,
    required this.product,
    required this.index,
    required this.quantity,
  }) : super(key: key);

  //final cartCont = Get.find<cartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(product.imageUrl),
            radius: 40,
          ),
          const SizedBox(width: 8,),
          Expanded(
            child: Text(
              product.name,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: Text(
              '\$${product.price}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          IconButton(onPressed: (){
            controller.removeProduct(product);
          }, 
          icon: const Icon(Icons.remove_circle_rounded),
          ),
          Text('$quantity'),
          IconButton(onPressed: (){
            controller.addProduct(product);
          }, 
          icon: const Icon(Icons.add_circle_rounded),
          ),
        ],
      ),
    );
  }
}
