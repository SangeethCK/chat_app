// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_messgae_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
  id: json['id'] as String,
  chatThreadId: (json['chat_thread_id'] as num?)?.toInt(),
  chatMessageTypeId: (json['chat_message_type_id'] as num?)?.toInt(),
  senderId: (json['sender_id'] as num?)?.toInt(),
  receiverId: (json['receiver_id'] as num?)?.toInt(),
  message: json['message'] as String?,
  mediaMeta: json['media_meta'],
  isOneTimeView: json['is_one_time_view'] as bool?,
  isReadReceiptsOn: (json['is_read_receipts_on'] as num?)?.toInt(),
  isOneTimeViewedAt: json['is_one_time_viewed_at'] == null
      ? null
      : DateTime.parse(json['is_one_time_viewed_at'] as String),
  isOnVanishMode: json['is_on_vanish_mode'] as bool?,
  scheduledAt: json['scheduled_at'] == null
      ? null
      : DateTime.parse(json['scheduled_at'] as String),
  sentAt: json['sent_at'] == null
      ? null
      : DateTime.parse(json['sent_at'] as String),
  deliveredAt: json['delivered_at'] == null
      ? null
      : DateTime.parse(json['delivered_at'] as String),
  viewedAt: json['viewed_at'] == null
      ? null
      : DateTime.parse(json['viewed_at'] as String),
  stickerId: (json['sticker_id'] as num?)?.toInt(),
  giftOrderId: (json['gift_order_id'] as num?)?.toInt(),
  senderCoinTransactionId: (json['sender_coin_transaction_id'] as num?)
      ?.toInt(),
  receiverCoinTransactionId: (json['receiver_coin_transaction_id'] as num?)
      ?.toInt(),
  transferCoins: (json['transfer_coins'] as num?)?.toInt(),
  deletedForSenderBy: (json['deleted_for_sender_by'] as num?)?.toInt(),
  deletedForSenderAt: json['deleted_for_sender_at'] == null
      ? null
      : DateTime.parse(json['deleted_for_sender_at'] as String),
  deletedForReceiverBy: (json['deleted_for_receiver_by'] as num?)?.toInt(),
  deletedForReceiverAt: json['deleted_for_receiver_at'] == null
      ? null
      : DateTime.parse(json['deleted_for_receiver_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
  mediaUrl: json['media_url'] as String?,
  sender: json['sender'] == null
      ? null
      : Sender.fromJson(json['sender'] as Map<String, dynamic>),
  sticker: json['sticker'] == null
      ? null
      : Sticker.fromJson(json['sticker'] as Map<String, dynamic>),
  giftOrder: json['gift_order'] == null
      ? null
      : GiftOrder.fromJson(json['gift_order'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChatMessageToJson(
  ChatMessage instance,
) => <String, dynamic>{
  'id': instance.id,
  'chat_thread_id': instance.chatThreadId,
  'chat_message_type_id': instance.chatMessageTypeId,
  'sender_id': instance.senderId,
  'receiver_id': instance.receiverId,
  'message': instance.message,
  'media_meta': instance.mediaMeta,
  'is_one_time_view': instance.isOneTimeView,
  'is_read_receipts_on': instance.isReadReceiptsOn,
  'is_one_time_viewed_at': instance.isOneTimeViewedAt?.toIso8601String(),
  'is_on_vanish_mode': instance.isOnVanishMode,
  'scheduled_at': instance.scheduledAt?.toIso8601String(),
  'sent_at': instance.sentAt?.toIso8601String(),
  'delivered_at': instance.deliveredAt?.toIso8601String(),
  'viewed_at': instance.viewedAt?.toIso8601String(),
  'sticker_id': instance.stickerId,
  'gift_order_id': instance.giftOrderId,
  'sender_coin_transaction_id': instance.senderCoinTransactionId,
  'receiver_coin_transaction_id': instance.receiverCoinTransactionId,
  'transfer_coins': instance.transferCoins,
  'deleted_for_sender_by': instance.deletedForSenderBy,
  'deleted_for_sender_at': instance.deletedForSenderAt?.toIso8601String(),
  'deleted_for_receiver_by': instance.deletedForReceiverBy,
  'deleted_for_receiver_at': instance.deletedForReceiverAt?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'media_url': instance.mediaUrl,
  'sender': instance.sender,
  'sticker': instance.sticker,
  'gift_order': instance.giftOrder,
};

Sender _$SenderFromJson(Map<String, dynamic> json) => Sender(
  id: json['id'] as String,
  name: json['name'] as String?,
  username: json['username'] as String?,
  email: json['email'] as String?,
  profilePhotoUrl: json['profile_photo_url'] as String?,
  square100ProfilePhotoUrl: json['square100_profile_photo_url'] as String?,
  square300ProfilePhotoUrl: json['square300_profile_photo_url'] as String?,
  square500ProfilePhotoUrl: json['square500_profile_photo_url'] as String?,
  age: (json['age'] as num?)?.toInt(),
);

Map<String, dynamic> _$SenderToJson(Sender instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'username': instance.username,
  'email': instance.email,
  'profile_photo_url': instance.profilePhotoUrl,
  'square100_profile_photo_url': instance.square100ProfilePhotoUrl,
  'square300_profile_photo_url': instance.square300ProfilePhotoUrl,
  'square500_profile_photo_url': instance.square500ProfilePhotoUrl,
  'age': instance.age,
};

Sticker _$StickerFromJson(Map<String, dynamic> json) =>
    Sticker(id: json['id'] as String);

Map<String, dynamic> _$StickerToJson(Sticker instance) => <String, dynamic>{
  'id': instance.id,
};

GiftOrder _$GiftOrderFromJson(Map<String, dynamic> json) =>
    GiftOrder(id: json['id'] as String);

Map<String, dynamic> _$GiftOrderToJson(GiftOrder instance) => <String, dynamic>{
  'id': instance.id,
};

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  total: (json['total'] as num?)?.toInt(),
  count: (json['count'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  currentPage: (json['current_page'] as num?)?.toInt(),
  totalPages: (json['total_pages'] as num?)?.toInt(),
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'total': instance.total,
      'count': instance.count,
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
  self: json['self'] as String?,
  first: json['first'] as String?,
  last: json['last'] as String?,
);

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
  'self': instance.self,
  'first': instance.first,
  'last': instance.last,
};

ChatMessagesResponse _$ChatMessagesResponseFromJson(
  Map<String, dynamic> json,
) => ChatMessagesResponse(
  messages: (json['messages'] as List<dynamic>)
      .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: json['pagination'] == null
      ? null
      : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
  links: json['links'] == null
      ? null
      : Links.fromJson(json['links'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChatMessagesResponseToJson(
  ChatMessagesResponse instance,
) => <String, dynamic>{
  'messages': instance.messages,
  'pagination': instance.pagination,
  'links': instance.links,
};
