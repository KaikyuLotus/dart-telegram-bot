import '../../../telegram_entities.dart';

/// This object describes paid media.
///
/// Currently, it can be one of:
/// [PaidMediaPreview],
/// [PaidMediaPhoto],
/// [PaidMediaVideo]
abstract class PaidMedia {
  abstract final String type;

  static PaidMedia fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'preview':
        return PaidMediaPreview.fromJson(json);
      case 'photo':
        return PaidMediaPhoto.fromJson(json);
      case 'video':
        return PaidMediaVideo.fromJson(json);
      default:
        throw Exception('PaidMedia type not recognized');
    }
  }

  /// Creates a list of objects from a json array
  static List<PaidMedia> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => PaidMedia.fromJson(json[i]));
  }
}
