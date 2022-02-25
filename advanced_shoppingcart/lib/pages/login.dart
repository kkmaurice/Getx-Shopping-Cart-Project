// ignore_for_file: prefer_const_constructors


import 'package:advanced_shoppingcart/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {


 Login({ Key? key }) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login',style: TextStyle(fontSize: 30),),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CircleAvatar(
                    radius: 110,
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1643610493325-89876f661588?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDExfGFldTZyTC1qNmV3fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 2),
                  child: Text('WELCOME TO MAURICE\'S STORE',style: TextStyle(fontSize: 30,color: Colors.green ),),
                ),
               TextField(
              controller: _emailController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'email',
              ),
            ),
            SizedBox(height: 20),
             TextField(
              autofocus: true,
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'password',
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                controller.login(_emailController.text.trim(), _passwordController.text.trim());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green,
                ),
                width: double.infinity,
                height: 60,
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 25),))
              ),
            ),
            
            SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                controller.createUser(_emailController.text.trim(), _passwordController.text.trim());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green,
                ),
                width: double.infinity,
                height: 60,
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Create Account',style: TextStyle(color: Colors.white,fontSize: 25),))
              ),
            ),
            
             ],
            ),
          )
        ),
      ),
    );
  }
}