import 'package:domain_lists/app/modules/home/widgets/all_messages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              controller.getMessagesAfterRefresh();
            },
            icon: Icon(Icons.refresh, color: Colors.blue,),
          ),
          IconButton(
            onPressed: (){
              controller.logOut();
            },
            icon: Icon(Icons.logout, color: Colors.red,),
          ),
        ],
      ),
      body: Obx(() => controller.isLoading.value == true 
        ? Center(
          child: CircularProgressIndicator(),
        )
        : controller.messagesList.length == 0
        ? Center(
          child: Text(
            "No Messages",
            style: TextStyle(
              fontSize: 22
            ),
          ),
        )
        : Container(
          padding: EdgeInsets.all(16),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 10.0);
            },
            itemCount: controller.messagesList.length,
            itemBuilder: (context, index) {
              return AllMessages(
                id: controller.messagesList[index].id,
                type: controller.messagesList[index].type,
                hydraMemberId: controller.messagesList[index].hydraMemberId,
                accountId: controller.messagesList[index].accountId,
                msgid: controller.messagesList[index].msgid,
                from: controller.messagesList[index].from,
                to: controller.messagesList[index].to,
                subject: controller.messagesList[index].subject,
                intro: controller.messagesList[index].intro,
              );
            }
          ),
        )
      )
    );
  }
}
