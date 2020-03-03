import 'message.dart';

class Update {
  Message message;
  Message editedMessage;
  int update_id;

  Update({this.message, this.editedMessage, this.update_id});

  factory Update.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Update(
      message: Message.fromJson(json['message']),
      editedMessage: Message.fromJson(json['edited_message']),
      update_id: json['update_id'],
    );
  }

  factory Update.fromJsonList(Map<String, dynamic> json) {
    if (json == null) return null;
    var updates = <Update>{};
    updates.add(Update(
      message: Message.fromJson(json['message']),
      update_id: json['update_id'],
    ));
    return null;
  }
}
