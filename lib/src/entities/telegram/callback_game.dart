/// A placeholder, currently holds no information.
///
/// Use [BotFather](https://t.me/botfather) to set up your game.
class CallbackGame {
  /// Basic constructor
  CallbackGame();

  /// Creates an object from a json
  factory CallbackGame.fromJson(Map<String, dynamic> _) {
    return CallbackGame();
  }

  /// Creates a json from the object
  Map toJson() {
    return {};
  }
}
