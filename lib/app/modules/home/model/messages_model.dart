import 'package:domain_lists/app/modules/home/model/messages_list_model.dart';

class MessagesModel {
  final String id;
  final String type;
  final String hydraMemberId;
  final String accountId;
  final String msgid;
  final From from;
  final List<From> to;
  final String subject;
  final String intro;
  final bool seen;
  final bool isDeleted;
  final bool hasAttachments;
  final int size;
  final String downloadUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  MessagesModel(this.id, 
  this.type, 
  this.hydraMemberId, 
  this.accountId, 
  this.msgid, 
  this.from, 
  this.to, 
  this.subject, 
  this.intro, 
  this.seen, 
  this.isDeleted, 
  this.hasAttachments, 
  this.size, 
  this.downloadUrl, 
  this.createdAt, 
  this.updatedAt);
}