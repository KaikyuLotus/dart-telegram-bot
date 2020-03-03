class User {
  int id;
  bool isBot;
  String firstName;
  String lastName;
  String username;
  String languageCode;

  bool can_join_groups;
  bool can_read_all_group_messages;
  bool supports_inline_queries;

  User(
      {this.can_join_groups,
      this.can_read_all_group_messages,
      this.firstName,
      this.lastName,
      this.id,
      this.isBot,
      this.supports_inline_queries,
      this.username,
      this.languageCode});

  factory User.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return User(
        can_join_groups: json['can_join_groups'],
        can_read_all_group_messages: json['can_read_all_group_messages'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        id: json['id'],
        isBot: json['is_bot'],
        supports_inline_queries: json['supports_inline_queries'],
        username: json['username'],
        languageCode: json['language_code']);
  }

  static List<User> listFromJsonArray(List<dynamic> json) {
    if (json == null) return null;
    return List.generate(json.length, (i) => User.fromJson(json[i]));
  }
}
