import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  final String id;
  @JsonKey(name: 'message_received_from_partner_at')
  final DateTime? messageReceivedFromPartnerAt;
  @JsonKey(name: 'auth_user_id')
  final int? authUserId;
  final String? name;
  final String? username;
  final String? email;
  @JsonKey(name: 'profile_photo_path')
  final String? profilePhotoPath;
  @JsonKey(name: 'profile_photo_id')
  final int? profilePhotoId;
  final String? phone;
  final String? gender;
  @JsonKey(name: 'country_id')
  final int? countryId;
  @JsonKey(name: 'country_name')
  final String? countryName;
  @JsonKey(name: 'state_id')
  final int? stateId;
  @JsonKey(name: 'state_name')
  final String? stateName;
  @JsonKey(name: 'city_id')
  final int? cityId;
  @JsonKey(name: 'city_name')
  final String? cityName;
  @JsonKey(name: 'custom_city_name')
  final String? customCityName;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'customer_code')
  final String? customerCode;
  @JsonKey(name: 'is_premium_customer')
  final bool? isPremiumCustomer;
  @JsonKey(name: 'is_online')
  final bool? isOnline;
  @JsonKey(name: 'bio_intro_text')
  final String? bioIntroText;
  @JsonKey(name: 'last_active_at')
  final DateTime? lastActiveAt;
  final String? address;
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @JsonKey(name: 'native_language_id')
  final int? nativeLanguageId;
  @JsonKey(name: 'native_language_name')
  final String? nativeLanguageName;
  @JsonKey(name: 'referral_code')
  final String? referralCode;
  @JsonKey(name: 'referred_by')
  final String? referredBy;
  @JsonKey(name: 'referred_id')
  final int? referredId;
  @JsonKey(name: 'is_vanish_mode_enabled')
  final bool? isVanishModeEnabled;
  @JsonKey(name: 'is_chat_initiated')
  final bool? isChatInitiated;
  @JsonKey(name: 'likeback_created_at')
  final DateTime? likebackCreatedAt;
  @JsonKey(name: 'profile_photo_url')
  final String? profilePhotoUrl;
  @JsonKey(name: 'square100_profile_photo_url')
  final String? square100ProfilePhotoUrl;
  @JsonKey(name: 'square300_profile_photo_url')
  final String? square300ProfilePhotoUrl;
  @JsonKey(name: 'square500_profile_photo_url')
  final String? square500ProfilePhotoUrl;
  final int? age;
  @JsonKey(name: 'user_settings')
  final UserSettings? userSettings;

  Customer({
    required this.id,
    this.messageReceivedFromPartnerAt,
    this.authUserId,
    this.name,
    this.username,
    this.email,
    this.profilePhotoPath,
    this.profilePhotoId,
    this.phone,
    this.gender,
    this.countryId,
    this.countryName,
    this.stateId,
    this.stateName,
    this.cityId,
    this.cityName,
    this.customCityName,
    this.isActive,
    this.customerCode,
    this.isPremiumCustomer,
    this.isOnline,
    this.bioIntroText,
    this.lastActiveAt,
    this.address,
    this.dateOfBirth,
    this.nativeLanguageId,
    this.nativeLanguageName,
    this.referralCode,
    this.referredBy,
    this.referredId,
    this.isVanishModeEnabled,
    this.isChatInitiated,
    this.likebackCreatedAt,
    this.profilePhotoUrl,
    this.square100ProfilePhotoUrl,
    this.square300ProfilePhotoUrl,
    this.square500ProfilePhotoUrl,
    this.age,
    this.userSettings,
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable()
class UserSettings {
  final String id;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'is_real_gifts_accepted')
  final bool? isRealGiftsAccepted;
  @JsonKey(name: 'is_gender_revealed')
  final bool? isGenderRevealed;
  @JsonKey(name: 'is_height_revealed')
  final bool? isHeightRevealed;
  @JsonKey(name: 'is_religion_revealed')
  final bool? isReligionRevealed;
  @JsonKey(name: 'is_drinking_habit_revealed')
  final bool? isDrinkingHabitRevealed;
  @JsonKey(name: 'is_smoking_habit_revealed')
  final bool? isSmokingHabitRevealed;
  @JsonKey(name: 'is_sexual_orientation_revealed')
  final bool? isSexualOrientationRevealed;
  @JsonKey(name: 'is_educational_qualification_revealed')
  final bool? isEducationalQualificationRevealed;
  @JsonKey(name: 'is_personality_traits_revealed')
  final bool? isPersonalityTraitsRevealed;
  @JsonKey(name: 'is_lifestyle_activities_revealed')
  final bool? isLifestyleActivitiesRevealed;
  @JsonKey(name: 'is_contact_discovery_enabled')
  final bool? isContactDiscoveryEnabled;
  @JsonKey(name: 'is_ghost_mode_enabled')
  final bool? isGhostModeEnabled;
  @JsonKey(name: 'is_dark_mode_enabled')
  final bool? isDarkModeEnabled;
  @JsonKey(name: 'is_receiving_push_notifications')
  final bool? isReceivingPushNotifications;
  @JsonKey(name: 'is_receiving_flash_messages')
  final bool? isReceivingFlashMessages;
  @JsonKey(name: 'is_last_seen_enabled')
  final bool? isLastSeenEnabled;
  @JsonKey(name: 'is_online_status_enabled')
  final bool? isOnlineStatusEnabled;
  @JsonKey(name: 'is_read_receipts_enabled')
  final bool? isReadReceiptsEnabled;

  UserSettings({
    required this.id,
    this.userId,
    this.isRealGiftsAccepted,
    this.isGenderRevealed,
    this.isHeightRevealed,
    this.isReligionRevealed,
    this.isDrinkingHabitRevealed,
    this.isSmokingHabitRevealed,
    this.isSexualOrientationRevealed,
    this.isEducationalQualificationRevealed,
    this.isPersonalityTraitsRevealed,
    this.isLifestyleActivitiesRevealed,
    this.isContactDiscoveryEnabled,
    this.isGhostModeEnabled,
    this.isDarkModeEnabled,
    this.isReceivingPushNotifications,
    this.isReceivingFlashMessages,
    this.isLastSeenEnabled,
    this.isOnlineStatusEnabled,
    this.isReadReceiptsEnabled,
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);
}

@JsonSerializable()
class CustomersResponse {
  final List<Customer> customers;
  final Pagination? pagination;
  CustomersResponse({required this.customers, this.pagination});
  factory CustomersResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CustomersResponseToJson(this);
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
