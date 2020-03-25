class User {
  int id;
  bool isBot;
  String firstName;
  String lastName;
  String username;
  String languageCode;

  bool canJoinGroups;
  bool canReadAllGroupMessages;
  bool supportsInlineQueries;

  User(
      {this.canJoinGroups,
      this.canReadAllGroupMessages,
      this.firstName,
      this.lastName,
      this.id,
      this.isBot,
      this.supportsInlineQueries,
      this.username,
      this.languageCode});

  factory User.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return User(
        canJoinGroups: json['can_join_groups'],
        canReadAllGroupMessages: json['can_read_all_group_messages'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        id: json['id'],
        isBot: json['is_bot'],
        supportsInlineQueries: json['supports_inline_queries'],
        username: json['username'],
        languageCode: json['language_code']);
  }

  static List<User> listFromJsonArray(List<dynamic> json) {
    if (json == null) return null;
    return List.generate(json.length, (i) => User.fromJson(json[i]));
  }
}
