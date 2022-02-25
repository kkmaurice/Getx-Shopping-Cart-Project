  import 'package:advanced_shoppingcart/models/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDB {
  
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('products');

  Stream<List<Product>> getProducts(){
    return _ref.snapshots().map((snapshot) => snapshot.docs.map((doc) => Product.fromJson(doc)).toList());
  }
}