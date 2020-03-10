import 'location.dart';
import 'user.dart';

class InlineQuery {
  String id;
  User from;
  Location location;
  String query;
  String offset;

  InlineQuery(this.id, this.from, this.query, this.offset, {this.location});

  factory InlineQuery.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return InlineQuery(
      json['id'],
      User.fromJson(json['from']),
      json['query'],
      json['offset'],
      location: Location.fromJson(json['location']),
    );
  }
}
