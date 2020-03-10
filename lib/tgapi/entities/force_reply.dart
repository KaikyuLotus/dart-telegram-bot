import 'dart:convert';

import 'reply_markup.dart';

class ForceReply  extends ReplyMarkup {
  bool forceReply = true;
  bool selective = false;

  ForceReply(this.forceReply, {this.selective});

  factory ForceReply.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ForceReply(json['force_reply'], selective: json['selective']);
  }

  Map toJson() {
    var data = {};
    data['force_reply'] = forceReply;
    data['selective'] = selective;
    return data;
  }

  @override
  String toString() {
    return json.encode(this);
  }

}
