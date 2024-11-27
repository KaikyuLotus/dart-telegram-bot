import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object contains information about a message that is being replied to,
/// which may come from another chat or forum topic.
class ExternalReplyInfo {
  /// Origin of the message replied to by the given message
  MessageOrigin messageOrigin;

  /// Chat the original message belongs to.
  ///
  /// Available only if the chat is a supergroup or a channel.
  Chat? chat;

  /// Unique message identifier inside the original chat.
  ///
  /// Available only if the original chat is a supergroup or a channel.
  int? messageId;

  /// Options used for link preview generation for the original message,
  /// if it is a text message
  LinkPreviewOptions? linkPreviewOptions;

  /// Message is an animation, information about the animation
  Animation? animation;

  /// Message is an audio file, information about the file
  Audio? audio;

  /// Message is a general file, information about the file
  Document? document;

  /// Message contains paid media; information about the paid media
  PaidMediaInfo? paidMedia;

  /// Message is a photo, available sizes of the photo
  List<PhotoSize>? photo;

  /// Message is a sticker, information about the sticker
  Sticker? sticker;

  /// Message is a forwarded story
  Story? story;

  /// Message is a video, information about the video
  Video? video;

  /// Message is a video note, information about the video message
  VideoNote? videoNote;

  /// Message is a voice message, information about the file
  Voice? voice;

  /// True, if the message media is covered by a spoiler animation
  bool? hasMediaSpoiler;

  /// Message is a shared contact, information about the contact
  Contact? contact;

  /// Message is a dice with random value
  Dice? dice;

  /// Message is a game, information about the game.
  Game? game;

  /// Message is a scheduled giveaway, information about the giveaway
  Giveaway? giveaway;

  /// A giveaway with public winners was completed
  GiveawayWinners? giveawayWinners;

  /// Message is an invoice for a payment, information about the invoice.
  Invoice? invoice;

  /// Message is a shared location, information about the location
  Location? location;

  /// Message is a native poll, information about the poll
  Poll? poll;

  /// Message is a venue, information about the venue.
  ///
  /// For backward compatibility, when this field is set, the location field
  /// will also be set
  Venue? venue;

  /// Basic constructor
  ExternalReplyInfo(
    this.messageOrigin, {
    this.chat,
    this.messageId,
    this.linkPreviewOptions,
    this.animation,
    this.audio,
    this.document,
    this.paidMedia,
    this.photo,
    this.sticker,
    this.story,
    this.video,
    this.videoNote,
    this.voice,
    this.hasMediaSpoiler,
    this.contact,
    this.dice,
    this.game,
    this.giveaway,
    this.giveawayWinners,
    this.invoice,
    this.location,
    this.poll,
    this.venue,
  });

  /// Creates a object from a json
  factory ExternalReplyInfo.fromJson(Map<String, dynamic> json) {
    return ExternalReplyInfo(
      MessageOrigin.fromJson(json['origin']),
      chat: callIfNotNull(Chat.fromJson, json['chat']),
      messageId: json['message_id'],
      linkPreviewOptions: callIfNotNull(
        LinkPreviewOptions.fromJson,
        json['link_preview_options'],
      ),
      animation: callIfNotNull(Animation.fromJson, json['animation']),
      audio: callIfNotNull(Audio.fromJson, json['audio']),
      document: callIfNotNull(Document.fromJson, json['document']),
      paidMedia: callIfNotNull(PaidMediaInfo.fromJson, json['paid_media']),
      photo: callIfNotNull(PhotoSize.listFromJsonArray, json['photo']),
      sticker: callIfNotNull(Sticker.fromJson, json['sticker']),
      story: callIfNotNull(Story.fromJson, json['story']),
      video: callIfNotNull(Video.fromJson, json['video']),
      videoNote: callIfNotNull(VideoNote.fromJson, json['video_note']),
      voice: callIfNotNull(Voice.fromJson, json['voice']),
      hasMediaSpoiler: json['has_media_spoiler'],
      contact: callIfNotNull(Contact.fromJson, json['contact']),
      dice: callIfNotNull(Dice.fromJson, json['dice']),
      game: callIfNotNull(Game.fromJson, json['game']),
      giveaway: callIfNotNull(Giveaway.fromJson, json['giveaway']),
      giveawayWinners: callIfNotNull(
        GiveawayWinners.fromJson,
        json['giveaway_winners'],
      ),
      invoice: callIfNotNull(Invoice.fromJson, json['invoice']),
      location: callIfNotNull(Location.fromJson, json['location']),
      poll: callIfNotNull(Poll.fromJson, json['poll']),
      venue: callIfNotNull(Venue.fromJson, json['venue']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'origin': messageOrigin,
      'chat': chat,
      'message_id': messageId,
      'link_preview_options': linkPreviewOptions,
      'animation': animation,
      'audio': audio,
      'document': document,
      'paid_media': paidMedia,
      'photo': photo,
      'sticker': sticker,
      'story': story,
      'video': video,
      'video_note': videoNote,
      'voice': voice,
      'has_media_spoiler': hasMediaSpoiler,
      'contact': contact,
      'dice': dice,
      'game': game,
      'giveaway': giveaway,
      'giveaway_winners': giveawayWinners,
      'invoice': invoice,
      'location': location,
      'poll': poll,
      'venue': venue,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
