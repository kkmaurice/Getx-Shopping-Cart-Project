// ignore_for_file: camel_case_types, prefer_final_fields

import 'package:advanced_shoppingcart/models/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cartController extends GetxController{
  // Add a dictionary to store the products
  var _products = {}.obs;
  var searchList = {}.obs;


  // getter for the products
  get products => _products;
  

  //add products
  void addProduct(Product product){
    if(_products.containsKey(product)){
      _products[product]++;
  }else{
    _products[product] = 1;
  }
  Get.snackbar('Added to cart', '${product.name} added to cart',
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    duration: const Duration(seconds: 2),
    margin: const EdgeInsets.all(10),
    
    );
}

  //remove products
  void removeProduct(Product product){
    if(_products.containsKey(product)){
      _products[product]--;
      if(_products[product] == 0){
        _products.remove(product);
      }
    }
  }

  //get products
  // List<Product> get products{
  //   return _products.keys.toList();
  // }

  //get total number of products
  double get totalProducts{
    return _products.values.fold(0, (sum, value) => sum + value);
  }
  // int get totalProducts => _products.length;

  //get total price
  double get totalPrice{
    return _products.keys.toList().fold(0, (sum, product) => sum + product.price * _products[product]);
  }

  //clear cart
  void clear(){
    _products.clear();
  }


// search products
  searchQuery(String search){
   List searchList = _products.keys.where((product) => product.name.toLowerCase().contains(search.toLowerCase())).toList();
   return searchList;
  }


}