import 'package:domain_lists/app/modules/home/model/messages_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllMessages extends StatefulWidget {
  final String id;
  final String type;
  final String hydraMemberId;
  final String accountId;
  final String msgid;
  final From from;
  final List<From>? to;
  final String subject;
  final String intro;
  final bool? seen;
  final bool? isDeleted;
  final bool? hasAttachments;
  final int? size;
  final String? downloadUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const AllMessages({Key? key, 
  required this.id, 
  required this.type, 
  required this.hydraMemberId, 
  required this.accountId, 
  required this.msgid, 
  required this.from, 
  this.to, 
  required this.subject, 
  required this.intro, 
  this.seen, 
  this.isDeleted, 
  this.hasAttachments, 
  this.size, 
  this.downloadUrl, 
  this.createdAt, 
  this.updatedAt}) : super(key: key);
  
  @override
  _AllMessagesWidgetState createState() => _AllMessagesWidgetState();
}

class _AllMessagesWidgetState extends State<AllMessages> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed('/messages', arguments: {
          'message': widget.intro
        });
      },
      child: Container(
        height: 80,
        child: Card(
          elevation: 5,
          child: ListTile(
            title: Text(widget.from.name),
            subtitle: Text(
              widget.from.address
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded)
          ),
        ),
      ),
    );
  }
}