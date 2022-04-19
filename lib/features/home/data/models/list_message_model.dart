import 'message_model.dart';

class ListMessageModel {
  List<MessageModel>? listMessageModel;
  ListMessageModel({this.listMessageModel});

  ListMessageModel.fromJson(dynamic json) {
    listMessageModel = [];
    json.forEach((value) {
      listMessageModel!.add(MessageModel.fromJSON(value));
    });
  }
}
