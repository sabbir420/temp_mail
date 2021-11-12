import 'package:domain_lists/app/modules/signup/providers/domain_list_provider.dart';
import 'package:domain_lists/app/modules/signup/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var hidePassword = true.obs;
  var isLoading = false.obs;
  List<String> domainLists = [];
  var dropDownValue = "".obs;
  
  @override
  void onInit() {
    super.onInit();
    getDomainList();
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

  changeValue(String value) {
    dropDownValue.value = value;
    update();
  }

  getDomainList() async {
    List<String> lists = [];
    try{
      isLoading.value = true;
      update();
      await DomainListProvider().getDomains().then((value){
        value!.hydraMember.asMap().forEach((key, value) {
          if( value.isActive == true ){
            lists.add(value.domain);
          }
        });
      });
    } catch(e) {
      print(e);
    } finally {
      isLoading.value = false;
      domainLists = lists;
      dropDownValue.value = domainLists[0];
      update();
    }
  }

  signUp(String email, String password) async {
    try{
      isLoading.value = true;
      update();
      await SignupProvider().signUp(email, password).then((value){
        if( value.context != "/contexts/ConstraintViolationList" ){
          Fluttertoast.showToast(
            msg: "Account has been created successfully.",
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
            fontSize: 14.0,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG,
          );
          Get.offAndToNamed('/signin');
        } else if( value.context == "/contexts/ConstraintViolationList" ){
          Fluttertoast.showToast(
            msg: value.hydraDescription.toString(),
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
            fontSize: 14.0,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG,
          );
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
    } catch (e){
      print(e);
    } finally{
      isLoading.value = false;
      update();
    }
  }
}
