import 'package:advanced_shoppingcart/pages/cartelog_products.dart';
import 'package:advanced_shoppingcart/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
   Rx<User?>? _firebaseUser;

  //String? get user => _user?.value?.email;

  @override
  void onReady(){
    super.onReady();
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser?.bindStream(_auth.userChanges());
    ever(_firebaseUser!, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      //user is logged in
      Get.offAll(() => Cartelog());
    } else {
      Get.offAll(() => Login());
    }
  }

  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('error creating user', e.toString());
    }
  }
  void login(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);

    }catch (e){
      Get.snackbar('Error signing in', e.toString(),
      snackPosition: SnackPosition.BOTTOM,
      );

    }
  }
  void signOut() async{
    await _auth.signOut();
}
}