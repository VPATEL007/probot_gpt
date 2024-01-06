
import 'dart:developer';

import '../../config.dart';

class MyAccountController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  String? name,userName,firebaseUser,number;

  @override
  void onReady() {
    numberController.text = appCtrl.storage.read("number") ?? "";
    number = numberController.text;
    emailController.text = appCtrl.storage.read("userName") ;
    userName = emailController.text;
    firstNameController.text = appCtrl.storage.read("name") ??"";
    name = firstNameController.text;

   // firebaseUser = appCtrl.storage.read("firebaseUser");
log("number: ${numberController.text}");
    update();
    // TODO: implement onReady
    super.onReady();
  }
}