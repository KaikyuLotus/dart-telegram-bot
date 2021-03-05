class User {
  int id;
  bool isBot;
  String firstName;
  String? lastName;
  String? username;
  String? languageCode;
  bool? canJoinGroups;
  bool? canReadAllGroupMessages;
  bool? supportsInlineQueries;

  User({
    this.canJoinGroups,
    this.canReadAllGroupMessages,
    required this.firstName,
    this.lastName,
    required this.id,
    required this.isBot,
    this.supportsInlineQueries,
    this.username,
    this.languageCode,
  });

  static User fromJson(Map<String, dynamic> json) {
    return User(
      canJoinGroups: json['can_join_groups'],
      canReadAllGroupMessages: json['can_read_all_group_messages'],
      firstName: json['first_name']!,
      lastName: json['last_name'],
      id: json['id']!,
      isBot: json['is_bot']!,
      supportsInlineQueries: json['supports_inline_queries'],
      username: json['username'],
      languageCode: json['language_code'],
    );
  }

  static List<User> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => User.fromJson(json[i]));
  }
}
