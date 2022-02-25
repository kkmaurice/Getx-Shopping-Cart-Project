import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  factory Product.fromJson(DocumentSnapshot doc) {
    return Product(
      name: doc['name'],
      price: doc['price'],
      imageUrl: doc['imageUrl'],
      description: doc['description'],
    );
  }
  

  // static  List<Product> products = [
  //   Product(
  //     name: 'Apple',
  //     price: 2.99,
  //     imageUrl: 'https://media.istockphoto.com/photos/red-apple-with-leaf-isolated-on-white-background-picture-id185262648?b=1&k=20&m=185262648&s=170667a&w=0&h=2ouM2rkF5oBplBmZdqs3hSOdBzA4mcGNCoF2P0KUMTM=',
  //   ),
  //   Product(
  //     name: 'Pear',
  //     price: 1.99,
  //     imageUrl: 'https://media.istockphoto.com/photos/pears-isolated-one-and-a-half-green-pear-fruit-with-leaf-on-white-picture-id1299073137?b=1&k=20&m=1299073137&s=170667a&w=0&h=-1I_nAU2lCOo5hszaF2l2M-x3cFUo7RA3fRxDljVQ-4=',
  //   ),
  //   Product(
  //     name: 'Orange',
  //     price: 1.99,
  //     imageUrl: 'https://media.istockphoto.com/photos/whole-cross-section-and-quarter-of-fresh-organic-navel-orange-with-picture-id1227301369?b=1&k=20&m=1227301369&s=170667a&w=0&h=7WdK1RQTLuCn5tuNe25Z999THYzj8yijmk0MaRE-SD0='
  //   ),
  //   Product(
  //     name: 'Pinnapple',
  //     price: 1.99,
  //     imageUrl: 'https://media.istockphoto.com/photos/pineapple-wallpaper-picture-id172388455?b=1&k=20&m=172388455&s=170667a&w=0&h=exawhvyFLbKx1GJCT_pDkdiyHnF5JSZajeqpJhyTzpc='
  //   ),
  //   Product(
  //     name: 'Mango',
  //     price: 1.99,
  //     imageUrl: 'https://media.istockphoto.com/photos/mangoes-composition-picture-id463651383?b=1&k=20&m=463651383&s=170667a&w=0&h=9l0Hkrp_7E8cT4EOjg3aU7RBjFv6MKct1zsOvuoeCaU='
  //   ),
  //   Product(
  //     name: 'Pinach',
  //     price: 1.99,
  //     imageUrl: 'https://media.istockphoto.com/photos/homemade-frozen-pina-colada-cocktail-picture-id682435376?b=1&k=20&m=682435376&s=170667a&w=0&h=tkIKkBaCnHatfnVHRzk0W1QeJCN73DVWTb6iDKGjGw0='
  //   ),Product(
  //     name: 'Grapes',
  //     price: 1.99,
  //     imageUrl: 'https://media.istockphoto.com/photos/bunch-of-different-types-of-fresh-grapes-picture-id183217648?b=1&k=20&m=183217648&s=170667a&w=0&h=iH6EvmYtXENAq8FJ60c-Qu5m_bSGIkd0-_mYICnp6q8='
  //   ),Product(
  //     name: 'Vine',
  //     price: 1.99,
  //     imageUrl: 'https://media.istockphoto.com/photos/red-grapes-in-the-vineyard-picture-id1035264688?b=1&k=20&m=1035264688&s=170667a&w=0&h=dT9nlchplcX67y6GsJjDAwgzWzi78KdISF9FDod2k4M='
  //   )
  // ];
}
