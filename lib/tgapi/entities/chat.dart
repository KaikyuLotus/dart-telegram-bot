class Chat {
  int id;
  String first_name;
  String last_name;
  String username;
  String type;

  Chat({this.first_name, this.id, this.last_name, this.type, this.username});

  factory Chat.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Chat(
      first_name: json['first_name'],
      id: json['id'],
      last_name: json['last_name'],
      type: json['type'],
      username: json['username'],
    );
  }
}
