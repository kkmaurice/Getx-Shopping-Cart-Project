// ignore_for_file: must_call_super

import 'package:advanced_shoppingcart/controllers/firestor_DB.dart';
import 'package:advanced_shoppingcart/models/products.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  final products = <Product>[].obs;
  var searchListQuery = <Product>[].obs;

  @override
  void onInit(){
    products.bindStream(FirestoreDB().getProducts());
    // at the beginning, all users are shown
    searchListQuery.value =products;
    super.onInit();
  }

  // implement search function from cloud firestore
  searchQuery(String search){
    if(search.isEmpty){
      searchListQuery.value = products;
    }else if (search.length > 2){
      List<Product> searchList = products.where((product) => product.name.toLowerCase().contains(search.toLowerCase())).toList();
    searchListQuery.value = searchList;
    }  
  }

}