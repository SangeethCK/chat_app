// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
  id: json['id'] as String,
  messageReceivedFromPartnerAt: json['message_received_from_partner_at'] == null
      ? null
      : DateTime.parse(json['message_received_from_partner_at'] as String),
  authUserId: (json['auth_user_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  username: json['username'] as String?,
  email: json['email'] as String?,
  profilePhotoPath: json['profile_photo_path'] as String?,
  profilePhotoId: (json['profile_photo_id'] as num?)?.toInt(),
  phone: json['phone'] as String?,
  gender: json['gender'] as String?,
  countryId: (json['country_id'] as num?)?.toInt(),
  countryName: json['country_name'] as String?,
  stateId: (json['state_id'] as num?)?.toInt(),
  stateName: json['state_name'] as String?,
  cityId: (json['city_id'] as num?)?.toInt(),
  cityName: json['city_name'] as String?,
  customCityName: json['custom_city_name'] as String?,
  isActive: json['is_active'] as bool?,
  customerCode: json['customer_code'] as String?,
  isPremiumCustomer: json['is_premium_customer'] as bool?,
  isOnline: json['is_online'] as bool?,
  bioIntroText: json['bio_intro_text'] as String?,
  lastActiveAt: json['last_active_at'] == null
      ? null
      : DateTime.parse(json['last_active_at'] as String),
  address: json['address'] as String?,
  dateOfBirth: json['date_of_birth'] as String?,
  nativeLanguageId: (json['native_language_id'] as num?)?.toInt(),
  nativeLanguageName: json['native_language_name'] as String?,
  referralCode: json['referral_code'] as String?,
  referredBy: json['referred_by'] as String?,
  referredId: (json['referred_id'] as num?)?.toInt(),
  isVanishModeEnabled: json['is_vanish_mode_enabled'] as bool?,
  isChatInitiated: json['is_chat_initiated'] as bool?,
  likebackCreatedAt: json['likeback_created_at'] == null
      ? null
      : DateTime.parse(json['likeback_created_at'] as String),
  profilePhotoUrl: json['profile_photo_url'] as String?,
  square100ProfilePhotoUrl: json['square100_profile_photo_url'] as String?,
  square300ProfilePhotoUrl: json['square300_profile_photo_url'] as String?,
  square500ProfilePhotoUrl: json['square500_profile_photo_url'] as String?,
  age: (json['age'] as num?)?.toInt(),
  userSettings: json['user_settings'] == null
      ? null
      : UserSettings.fromJson(json['user_settings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
  'id': instance.id,
  'message_received_from_partner_at': instance.messageReceivedFromPartnerAt
      ?.toIso8601String(),
  'auth_user_id': instance.authUserId,
  'name': instance.name,
  'username': instance.username,
  'email': instance.email,
  'profile_photo_path': instance.profilePhotoPath,
  'profile_photo_id': instance.profilePhotoId,
  'phone': instance.phone,
  'gender': instance.gender,
  'country_id': instance.countryId,
  'country_name': instance.countryName,
  'state_id': instance.stateId,
  'state_name': instance.stateName,
  'city_id': instance.cityId,
  'city_name': instance.cityName,
  'custom_city_name': instance.customCityName,
  'is_active': instance.isActive,
  'customer_code': instance.customerCode,
  'is_premium_customer': instance.isPremiumCustomer,
  'is_online': instance.isOnline,
  'bio_intro_text': instance.bioIntroText,
  'last_active_at': instance.lastActiveAt?.toIso8601String(),
  'address': instance.address,
  'date_of_birth': instance.dateOfBirth,
  'native_language_id': instance.nativeLanguageId,
  'native_language_name': instance.nativeLanguageName,
  'referral_code': instance.referralCode,
  'referred_by': instance.referredBy,
  'referred_id': instance.referredId,
  'is_vanish_mode_enabled': instance.isVanishModeEnabled,
  'is_chat_initiated': instance.isChatInitiated,
  'likeback_created_at': instance.likebackCreatedAt?.toIso8601String(),
  'profile_photo_url': instance.profilePhotoUrl,
  'square100_profile_photo_url': instance.square100ProfilePhotoUrl,
  'square300_profile_photo_url': instance.square300ProfilePhotoUrl,
  'square500_profile_photo_url': instance.square500ProfilePhotoUrl,
  'age': instance.age,
  'user_settings': instance.userSettings,
};

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) => UserSettings(
  id: json['id'] as String,
  userId: (json['user_id'] as num?)?.toInt(),
  isRealGiftsAccepted: json['is_real_gifts_accepted'] as bool?,
  isGenderRevealed: json['is_gender_revealed'] as bool?,
  isHeightRevealed: json['is_height_revealed'] as bool?,
  isReligionRevealed: json['is_religion_revealed'] as bool?,
  isDrinkingHabitRevealed: json['is_drinking_habit_revealed'] as bool?,
  isSmokingHabitRevealed: json['is_smoking_habit_revealed'] as bool?,
  isSexualOrientationRevealed: json['is_sexual_orientation_revealed'] as bool?,
  isEducationalQualificationRevealed:
      json['is_educational_qualification_revealed'] as bool?,
  isPersonalityTraitsRevealed: json['is_personality_traits_revealed'] as bool?,
  isLifestyleActivitiesRevealed:
      json['is_lifestyle_activities_revealed'] as bool?,
  isContactDiscoveryEnabled: json['is_contact_discovery_enabled'] as bool?,
  isGhostModeEnabled: json['is_ghost_mode_enabled'] as bool?,
  isDarkModeEnabled: json['is_dark_mode_enabled'] as bool?,
  isReceivingPushNotifications:
      json['is_receiving_push_notifications'] as bool?,
  isReceivingFlashMessages: json['is_receiving_flash_messages'] as bool?,
  isLastSeenEnabled: json['is_last_seen_enabled'] as bool?,
  isOnlineStatusEnabled: json['is_online_status_enabled'] as bool?,
  isReadReceiptsEnabled: json['is_read_receipts_enabled'] as bool?,
);

Map<String, dynamic> _$UserSettingsToJson(
  UserSettings instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'is_real_gifts_accepted': instance.isRealGiftsAccepted,
  'is_gender_revealed': instance.isGenderRevealed,
  'is_height_revealed': instance.isHeightRevealed,
  'is_religion_revealed': instance.isReligionRevealed,
  'is_drinking_habit_revealed': instance.isDrinkingHabitRevealed,
  'is_smoking_habit_revealed': instance.isSmokingHabitRevealed,
  'is_sexual_orientation_revealed': instance.isSexualOrientationRevealed,
  'is_educational_qualification_revealed':
      instance.isEducationalQualificationRevealed,
  'is_personality_traits_revealed': instance.isPersonalityTraitsRevealed,
  'is_lifestyle_activities_revealed': instance.isLifestyleActivitiesRevealed,
  'is_contact_discovery_enabled': instance.isContactDiscoveryEnabled,
  'is_ghost_mode_enabled': instance.isGhostModeEnabled,
  'is_dark_mode_enabled': instance.isDarkModeEnabled,
  'is_receiving_push_notifications': instance.isReceivingPushNotifications,
  'is_receiving_flash_messages': instance.isReceivingFlashMessages,
  'is_last_seen_enabled': instance.isLastSeenEnabled,
  'is_online_status_enabled': instance.isOnlineStatusEnabled,
  'is_read_receipts_enabled': instance.isReadReceiptsEnabled,
};

CustomersResponse _$CustomersResponseFromJson(Map<String, dynamic> json) =>
    CustomersResponse(
      customers: (json['customers'] as List<dynamic>)
          .map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomersResponseToJson(CustomersResponse instance) =>
    <String, dynamic>{
      'customers': instance.customers,
      'pagination': instance.pagination,
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
