import 'package:domain_lists/app/modules/signin/providers/signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SigninController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final localStorage = GetStorage();
  var isLoading = false.obs;
  var hidePassword = true.obs;
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  passwordHide() {
    hidePassword.value = !hidePassword.value;
    update();
  }

  signIn(String email, String password) async {
    try{
      isLoading.value = true;
      update();
      await SigninProvider().signIn(email, password).then((value){
        if( value != null ){
          localStorage.write('token', value.token);
          print(value.token);
          Get.offAllNamed('/home');
        } else {
          Fluttertoast.showToast(
            msg: "Something is wrong",
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
            fontSize: 14.0,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG,
          );
        }
      });
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
