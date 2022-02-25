import 'package:advanced_shoppingcart/pages/cartelog_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/authController.dart';

class CartalogueScreen extends StatelessWidget {
   CartalogueScreen({ Key? key }) : super(key: key);

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan[300],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Cartalogue',style: TextStyle(fontSize: 27),),
              IconButton(onPressed: (){controller.signOut();}, icon: const Icon(Icons.logout,color: Colors.red,),),
            ],
          ),
        )
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(Cartelog());
          },
          child: const Text('Go to cart'),
        ),
      ),
    );
  }
} 