/// A placeholder, currently holds no information.
/// Use BotFather to set up your game.
class CallbackGame {
  /// Basic constructor
  CallbackGame();

  /// Creates a object from a json
  static CallbackGame fromJson(Map<String, dynamic> json) {
    return CallbackGame();
  }

  /// Creates a json from the object
  Map toJson() {
    return {};
  }
}
