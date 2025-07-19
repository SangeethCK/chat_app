import 'package:json_annotation/json_annotation.dart';

part 'verify_response.g.dart';

@JsonSerializable(explicitToJson: true)
class VerifyResponse {
  @JsonKey(name: "data")
  final UserData? data;

  @JsonKey(name: "included")
  final List<IncludedResource>? included;
  VerifyResponse({this.data, this.included});
  factory VerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserData {
  @JsonKey(name: "type")
  final String? type;

  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "username")
  final String username;

  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "phone")
  final String phone;

  @JsonKey(name: "gender")
  final String gender;

  @JsonKey(name: "age")
  final int age;

  @JsonKey(name: "profile_photo_url")
  final String? profilePhotoUrl;

  @JsonKey(name: "square100_profile_photo_url")
  final String? square100ProfilePhotoUrl;

  @JsonKey(name: "square300_profile_photo_url")
  final String? square300ProfilePhotoUrl;

  @JsonKey(name: "square500_profile_photo_url")
  final String? square500ProfilePhotoUrl;

  @JsonKey(name: "is_active")
  final bool isActive;

  @JsonKey(name: "customer_code")
  final String customerCode;

  @JsonKey(name: "is_premium_customer")
  final bool isPremiumCustomer;

  @JsonKey(name: "coin_balance")
  final int coinBalance;

  @JsonKey(name: "profile_completion_percentage")
  final int profileCompletionPercentage;

  @JsonKey(name: "auth_status")
  final AuthStatus? authStatus;

  @JsonKey(name: "current_location")
  final String? currentLocation;

  @JsonKey(name: "current_latitude")
  final String? currentLatitude;

  @JsonKey(name: "current_longitude")
  final String? currentLongitude;

  @JsonKey(name: "bio_intro_text")
  final String? bioIntroText;

  @JsonKey(name: "height_in_cm")
  final int? heightInCm;

  @JsonKey(name: "relationship_status_name")
  final String? relationshipStatusName;

  @JsonKey(name: "current_subscription_plan_id")
  final int? currentSubscriptionPlanId;

  @JsonKey(name: "is_profile_boost_active")
  final int? isProfileBoostActive;

  @JsonKey(name: "has_unlimited_user_swipe")
  final int? hasUnlimitedUserSwipe;

  @JsonKey(name: "remaining_super_like_limit")
  final int? remainingSuperLikeLimit;

  @JsonKey(name: "remaining_flash_message_limit")
  final int? remainingFlashMessageLimit;

  @JsonKey(name: "remaining_boost_limit")
  final int? remainingBoostLimit;

  @JsonKey(name: "is_online")
  final bool? isOnline;

  @JsonKey(name: "is_ghost_mode_enabled")
  final bool? isGhostModeEnabled;

  @JsonKey(name: "is_receiving_push_notifications")
  final bool? isReceivingPushNotifications;

  @JsonKey(name: "is_last_seen_enabled")
  final bool? isLastSeenEnabled;

  @JsonKey(name: "is_online_status_enabled")
  final bool? isOnlineStatusEnabled;

  @JsonKey(name: "is_read_receipts_enabled")
  final bool? isReadReceiptsEnabled;

  @JsonKey(name: "created_at")
  final DateTime? createdAt;

  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @JsonKey(name: "last_active_at")
  final DateTime? lastActiveAt;

  // @JsonKey(name: "partnerExpectations")
  // final List<String>? partnerExpectationIds;

  // @JsonKey(name: "avatars")
  // final List<String>? avatarIds;

  // @JsonKey(name: "personalityTraits")
  // final List<String>? personalityTraitIds;

  // @JsonKey(name: "lifeStyleActivities")
  // final List<String>? lifeStyleActivityIds;

  UserData({
    this.type,
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.gender,
    required this.age,
    this.profilePhotoUrl,
    this.square100ProfilePhotoUrl,
    this.square300ProfilePhotoUrl,
    this.square500ProfilePhotoUrl,
    required this.isActive,
    required this.customerCode,
    required this.isPremiumCustomer,
    required this.coinBalance,
    required this.profileCompletionPercentage,
    this.authStatus,
    this.currentLocation,
    this.currentLatitude,
    this.currentLongitude,
    this.bioIntroText,
    this.heightInCm,
    this.relationshipStatusName,
    this.currentSubscriptionPlanId,
    this.isProfileBoostActive,
    this.hasUnlimitedUserSwipe,
    this.remainingSuperLikeLimit,
    this.remainingFlashMessageLimit,
    this.remainingBoostLimit,
    this.isOnline,
    this.isGhostModeEnabled,
    this.isReceivingPushNotifications,
    this.isLastSeenEnabled,
    this.isOnlineStatusEnabled,
    this.isReadReceiptsEnabled,
    this.createdAt,
    this.updatedAt,
    this.lastActiveAt,
    // this.partnerExpectationIds,
    // this.avatarIds,
    // this.personalityTraitIds,
    // this.lifeStyleActivityIds,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class AuthStatus {
  @JsonKey(name: "access_token")
  final String? accessToken;

  @JsonKey(name: "token_type")
  final String? tokenType;

  @JsonKey(name: "is_2fa_configured_by_user")
  final bool? is2FaConfiguredByUser;

  @JsonKey(name: "is_2fa_verified_by_user")
  final bool? is2FaVerifiedByUser;

  @JsonKey(name: "is_email_verification_required")
  final bool? isEmailVerificationRequired;

  @JsonKey(name: "device_meta")
  final DeviceMeta? deviceMeta;

  AuthStatus({
    this.accessToken,
    this.tokenType,
    this.is2FaConfiguredByUser,
    this.is2FaVerifiedByUser,
    this.isEmailVerificationRequired,
    this.deviceMeta,
  });

  factory AuthStatus.fromJson(Map<String, dynamic> json) =>
      _$AuthStatusFromJson(json);

  Map<String, dynamic> toJson() => _$AuthStatusToJson(this);
}

@JsonSerializable()
class DeviceMeta {
  @JsonKey(name: "type")
  final String? type;

  @JsonKey(name: "device-name")
  final String? deviceName;

  @JsonKey(name: "device-os-version")
  final String? deviceOsVersion;

  @JsonKey(name: "browser")
  final String? browser;

  @JsonKey(name: "browser_version")
  final String? browserVersion;

  @JsonKey(name: "user-agent")
  final String? userAgent;

  @JsonKey(name: "screen_resolution")
  final String? screenResolution;

  @JsonKey(name: "language")
  final String? language;

  DeviceMeta({
    this.type,
    this.deviceName,
    this.deviceOsVersion,
    this.browser,
    this.browserVersion,
    this.userAgent,
    this.screenResolution,
    this.language,
  });

  factory DeviceMeta.fromJson(Map<String, dynamic> json) =>
      _$DeviceMetaFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceMetaToJson(this);
}

@JsonSerializable()
class IncludedResource {
  @JsonKey(name: "type")
  final String type;

  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "name")
  final String? name;

  @JsonKey(name: "icon")
  final String? icon;

  @JsonKey(name: "icon_url")
  final String? iconUrl;

  @JsonKey(name: "trait_type_id")
  final int? traitTypeId;

  @JsonKey(name: "user_id")
  final int? userId;

  @JsonKey(name: "is_active")
  final bool? isActive;

  @JsonKey(name: "image_url")
  final String? imageUrl;

  @JsonKey(name: "square100_image_url")
  final String? square100ImageUrl;

  @JsonKey(name: "square300_image_url")
  final String? square300ImageUrl;

  @JsonKey(name: "square500_image_url")
  final String? square500ImageUrl;

  @JsonKey(name: "approved_at")
  final DateTime? approvedAt;

  @JsonKey(name: "approved_by")
  final int? approvedBy;

  @JsonKey(name: "created_at")
  final DateTime? createdAt;

  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  IncludedResource({
    required this.type,
    required this.id,
    this.name,
    this.icon,
    this.iconUrl,
    this.traitTypeId,
    this.userId,
    this.isActive,
    this.imageUrl,
    this.square100ImageUrl,
    this.square300ImageUrl,
    this.square500ImageUrl,
    this.approvedAt,
    this.approvedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory IncludedResource.fromJson(Map<String, dynamic> json) =>
      _$IncludedResourceFromJson(json);

  Map<String, dynamic> toJson() => _$IncludedResourceToJson(this);
}
