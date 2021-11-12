import 'package:domain_lists/app/modules/home/model/messages_model.dart';
import 'package:domain_lists/app/modules/home/providers/messages_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final localStorage = GetStorage();
  var messagesList = <MessagesModel>[].obs;
  var token = ''.obs;
  var isLoading = false.obs;
  
  @override
  void onInit() async {
    super.onInit();
    token.value = localStorage.read('token');
    update();
    await getMessages();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getMessages() async {
    try{
      isLoading.value = true;
      update();
      await MessagesProvider().getMessagesData(token.value).then((value){
        if( value!.hydraMember.isNotEmpty ){
          value.hydraMember.asMap().forEach((key, value) {
            MessagesModel messagesModel = MessagesModel(
              value.id,
              value.type,
              value.hydraMemberId,
              value.accountId,
              value.msgid,
              value.from,
              value.to,
              value.subject,
              value.intro,
              value.seen,
              value.isDeleted,
              value.hasAttachments,
              value.size,
              value.downloadUrl,
              value.createdAt,
              value.updatedAt
            );
            messagesList.add(messagesModel);
            update();
          });
        } else {
          Fluttertoast.showToast(
            msg: "No Messages",
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
            fontSize: 14.0,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG,
          );
        }
      });
    } catch(e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }

  getMessagesAfterRefresh() async {
    try{
      isLoading.value = true;
      messagesList.clear();
      update();
      await MessagesProvider().getMessagesData(token.value).then((value){
        if( value!.hydraMember.isNotEmpty ){
          value.hydraMember.asMap().forEach((key, value) {
            MessagesModel messagesModel = MessagesModel(
              value.id,
              value.type,
              value.hydraMemberId,
              value.accountId,
              value.msgid,
              value.from,
              value.to,
              value.subject,
              value.intro,
              value.seen,
              value.isDeleted,
              value.hasAttachments,
              value.size,
              value.downloadUrl,
              value.createdAt,
              value.updatedAt
            );
            messagesList.add(messagesModel);
            update();
          });
        } else {
          Fluttertoast.showToast(
            msg: "No Messages",
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
            fontSize: 14.0,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG,
          );
        }
      });
    } catch(e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }

  logOut() {
    localStorage.remove('token');
    Get.offAllNamed('signin');
  }
}
