import '../../../telegram_entities.dart';

/// This object describes the paid media to be sent.
///
/// Currently, it can be one of
/// [InputPaidMediaPhoto],
/// [InputPaidMediaVideo]
abstract class InputPaidMedia {
  abstract final String type;
  abstract final String media;

  static InputPaidMedia fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'photo':
        return InputPaidMediaPhoto.fromJson(json);
      case 'video':
        return InputPaidMediaVideo.fromJson(json);
      default:
        throw Exception('InputPaidMedia type not recognized');
    }
  }
}
