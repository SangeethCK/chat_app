import 'package:json_annotation/json_annotation.dart';

part 'chat_messgae_response.g.dart';

@JsonSerializable()
class ChatMessage {
  final String id;
  @JsonKey(name: 'chat_thread_id')
  final int? chatThreadId;
  @JsonKey(name: 'chat_message_type_id')
  final int? chatMessageTypeId;
  @JsonKey(name: 'sender_id')
  final int? senderId;
  @JsonKey(name: 'receiver_id')
  final int? receiverId;
  final String? message;
  @JsonKey(name: 'media_meta')
  final dynamic mediaMeta;
  @JsonKey(name: 'is_one_time_view')
  final bool? isOneTimeView;
  @JsonKey(name: 'is_read_receipts_on')
  final int? isReadReceiptsOn;
  @JsonKey(name: 'is_one_time_viewed_at')
  final DateTime? isOneTimeViewedAt;
  @JsonKey(name: 'is_on_vanish_mode')
  final bool? isOnVanishMode;
  @JsonKey(name: 'scheduled_at')
  final DateTime? scheduledAt;
  @JsonKey(name: 'sent_at')
  final DateTime? sentAt;
  @JsonKey(name: 'delivered_at')
  final DateTime? deliveredAt;
  @JsonKey(name: 'viewed_at')
  final DateTime? viewedAt;
  @JsonKey(name: 'sticker_id')
  final int? stickerId;
  @JsonKey(name: 'gift_order_id')
  final int? giftOrderId;
  @JsonKey(name: 'sender_coin_transaction_id')
  final int? senderCoinTransactionId;
  @JsonKey(name: 'receiver_coin_transaction_id')
  final int? receiverCoinTransactionId;
  @JsonKey(name: 'transfer_coins')
  final int? transferCoins;
  @JsonKey(name: 'deleted_for_sender_by')
  final int? deletedForSenderBy;
  @JsonKey(name: 'deleted_for_sender_at')
  final DateTime? deletedForSenderAt;
  @JsonKey(name: 'deleted_for_receiver_by')
  final int? deletedForReceiverBy;
  @JsonKey(name: 'deleted_for_receiver_at')
  final DateTime? deletedForReceiverAt;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;
  @JsonKey(name: 'media_url')
  final String? mediaUrl;
  final Sender? sender;
  final Sticker? sticker;
  @JsonKey(name: 'gift_order')
  final GiftOrder? giftOrder;

  ChatMessage({
    required this.id,
    this.chatThreadId,
    this.chatMessageTypeId,
    this.senderId,
    this.receiverId,
    this.message,
    this.mediaMeta,
    this.isOneTimeView,
    this.isReadReceiptsOn,
    this.isOneTimeViewedAt,
    this.isOnVanishMode,
    this.scheduledAt,
    this.sentAt,
    this.deliveredAt,
    this.viewedAt,
    this.stickerId,
    this.giftOrderId,
    this.senderCoinTransactionId,
    this.receiverCoinTransactionId,
    this.transferCoins,
    this.deletedForSenderBy,
    this.deletedForSenderAt,
    this.deletedForReceiverBy,
    this.deletedForReceiverAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.mediaUrl,
    this.sender,
    this.sticker,
    this.giftOrder,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}

@JsonSerializable()
class Sender {
  final String id;
  final String? name;
  final String? username;
  final String? email;

  @JsonKey(name: 'profile_photo_url')
  final String? profilePhotoUrl;
  @JsonKey(name: 'square100_profile_photo_url')
  final String? square100ProfilePhotoUrl;
  @JsonKey(name: 'square300_profile_photo_url')
  final String? square300ProfilePhotoUrl;
  @JsonKey(name: 'square500_profile_photo_url')
  final String? square500ProfilePhotoUrl;

  final int? age;

  Sender({
    required this.id,
    this.name,
    this.username,
    this.email,
    this.profilePhotoUrl,
    this.square100ProfilePhotoUrl,
    this.square300ProfilePhotoUrl,
    this.square500ProfilePhotoUrl,
    this.age,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => _$SenderFromJson(json);
  Map<String, dynamic> toJson() => _$SenderToJson(this);
}

@JsonSerializable()
class Sticker {
  final String id;

  Sticker({required this.id});

  factory Sticker.fromJson(Map<String, dynamic> json) =>
      _$StickerFromJson(json);
  Map<String, dynamic> toJson() => _$StickerToJson(this);
}

@JsonSerializable()
class GiftOrder {
  final String id;
  GiftOrder({required this.id});
  factory GiftOrder.fromJson(Map<String, dynamic> json) =>
      _$GiftOrderFromJson(json);
  Map<String, dynamic> toJson() => _$GiftOrderToJson(this);
}

@JsonSerializable()
class Pagination {
  final int? total;
  final int? count;
  @JsonKey(name: 'per_page')
  final int? perPage;
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class Links {
  final String? self;
  final String? first;
  final String? last;

  Links({this.self, this.first, this.last});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class ChatMessagesResponse {
  final List<ChatMessage> messages;
  final Pagination? pagination;
  final Links? links;

  ChatMessagesResponse({required this.messages, this.pagination, this.links});

  factory ChatMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMessagesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessagesResponseToJson(this);
}
