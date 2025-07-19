// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResponse _$VerifyResponseFromJson(Map<String, dynamic> json) =>
    VerifyResponse(
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      included: (json['included'] as List<dynamic>?)
          ?.map((e) => IncludedResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VerifyResponseToJson(VerifyResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'included': instance.included?.map((e) => e.toJson()).toList(),
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  type: json['type'] as String?,
  id: json['id'] as String,
  name: json['name'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  gender: json['gender'] as String,
  age: (json['age'] as num).toInt(),
  profilePhotoUrl: json['profile_photo_url'] as String?,
  square100ProfilePhotoUrl: json['square100_profile_photo_url'] as String?,
  square300ProfilePhotoUrl: json['square300_profile_photo_url'] as String?,
  square500ProfilePhotoUrl: json['square500_profile_photo_url'] as String?,
  isActive: json['is_active'] as bool,
  customerCode: json['customer_code'] as String,
  isPremiumCustomer: json['is_premium_customer'] as bool,
  coinBalance: (json['coin_balance'] as num).toInt(),
  profileCompletionPercentage: (json['profile_completion_percentage'] as num)
      .toInt(),
  authStatus: json['auth_status'] == null
      ? null
      : AuthStatus.fromJson(json['auth_status'] as Map<String, dynamic>),
  currentLocation: json['current_location'] as String?,
  currentLatitude: json['current_latitude'] as String?,
  currentLongitude: json['current_longitude'] as String?,
  bioIntroText: json['bio_intro_text'] as String?,
  heightInCm: (json['height_in_cm'] as num?)?.toInt(),
  relationshipStatusName: json['relationship_status_name'] as String?,
  currentSubscriptionPlanId: (json['current_subscription_plan_id'] as num?)
      ?.toInt(),
  isProfileBoostActive: (json['is_profile_boost_active'] as num?)?.toInt(),
  hasUnlimitedUserSwipe: (json['has_unlimited_user_swipe'] as num?)?.toInt(),
  remainingSuperLikeLimit: (json['remaining_super_like_limit'] as num?)
      ?.toInt(),
  remainingFlashMessageLimit: (json['remaining_flash_message_limit'] as num?)
      ?.toInt(),
  remainingBoostLimit: (json['remaining_boost_limit'] as num?)?.toInt(),
  isOnline: json['is_online'] as bool?,
  isGhostModeEnabled: json['is_ghost_mode_enabled'] as bool?,
  isReceivingPushNotifications:
      json['is_receiving_push_notifications'] as bool?,
  isLastSeenEnabled: json['is_last_seen_enabled'] as bool?,
  isOnlineStatusEnabled: json['is_online_status_enabled'] as bool?,
  isReadReceiptsEnabled: json['is_read_receipts_enabled'] as bool?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  lastActiveAt: json['last_active_at'] == null
      ? null
      : DateTime.parse(json['last_active_at'] as String),
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'name': instance.name,
  'username': instance.username,
  'email': instance.email,
  'phone': instance.phone,
  'gender': instance.gender,
  'age': instance.age,
  'profile_photo_url': instance.profilePhotoUrl,
  'square100_profile_photo_url': instance.square100ProfilePhotoUrl,
  'square300_profile_photo_url': instance.square300ProfilePhotoUrl,
  'square500_profile_photo_url': instance.square500ProfilePhotoUrl,
  'is_active': instance.isActive,
  'customer_code': instance.customerCode,
  'is_premium_customer': instance.isPremiumCustomer,
  'coin_balance': instance.coinBalance,
  'profile_completion_percentage': instance.profileCompletionPercentage,
  'auth_status': instance.authStatus?.toJson(),
  'current_location': instance.currentLocation,
  'current_latitude': instance.currentLatitude,
  'current_longitude': instance.currentLongitude,
  'bio_intro_text': instance.bioIntroText,
  'height_in_cm': instance.heightInCm,
  'relationship_status_name': instance.relationshipStatusName,
  'current_subscription_plan_id': instance.currentSubscriptionPlanId,
  'is_profile_boost_active': instance.isProfileBoostActive,
  'has_unlimited_user_swipe': instance.hasUnlimitedUserSwipe,
  'remaining_super_like_limit': instance.remainingSuperLikeLimit,
  'remaining_flash_message_limit': instance.remainingFlashMessageLimit,
  'remaining_boost_limit': instance.remainingBoostLimit,
  'is_online': instance.isOnline,
  'is_ghost_mode_enabled': instance.isGhostModeEnabled,
  'is_receiving_push_notifications': instance.isReceivingPushNotifications,
  'is_last_seen_enabled': instance.isLastSeenEnabled,
  'is_online_status_enabled': instance.isOnlineStatusEnabled,
  'is_read_receipts_enabled': instance.isReadReceiptsEnabled,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'last_active_at': instance.lastActiveAt?.toIso8601String(),
};

AuthStatus _$AuthStatusFromJson(Map<String, dynamic> json) => AuthStatus(
  accessToken: json['access_token'] as String?,
  tokenType: json['token_type'] as String?,
  is2FaConfiguredByUser: json['is_2fa_configured_by_user'] as bool?,
  is2FaVerifiedByUser: json['is_2fa_verified_by_user'] as bool?,
  isEmailVerificationRequired: json['is_email_verification_required'] as bool?,
  deviceMeta: json['device_meta'] == null
      ? null
      : DeviceMeta.fromJson(json['device_meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthStatusToJson(AuthStatus instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'is_2fa_configured_by_user': instance.is2FaConfiguredByUser,
      'is_2fa_verified_by_user': instance.is2FaVerifiedByUser,
      'is_email_verification_required': instance.isEmailVerificationRequired,
      'device_meta': instance.deviceMeta,
    };

DeviceMeta _$DeviceMetaFromJson(Map<String, dynamic> json) => DeviceMeta(
  type: json['type'] as String?,
  deviceName: json['device-name'] as String?,
  deviceOsVersion: json['device-os-version'] as String?,
  browser: json['browser'] as String?,
  browserVersion: json['browser_version'] as String?,
  userAgent: json['user-agent'] as String?,
  screenResolution: json['screen_resolution'] as String?,
  language: json['language'] as String?,
);

Map<String, dynamic> _$DeviceMetaToJson(DeviceMeta instance) =>
    <String, dynamic>{
      'type': instance.type,
      'device-name': instance.deviceName,
      'device-os-version': instance.deviceOsVersion,
      'browser': instance.browser,
      'browser_version': instance.browserVersion,
      'user-agent': instance.userAgent,
      'screen_resolution': instance.screenResolution,
      'language': instance.language,
    };

IncludedResource _$IncludedResourceFromJson(Map<String, dynamic> json) =>
    IncludedResource(
      type: json['type'] as String,
      id: json['id'] as String,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      iconUrl: json['icon_url'] as String?,
      traitTypeId: (json['trait_type_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
      imageUrl: json['image_url'] as String?,
      square100ImageUrl: json['square100_image_url'] as String?,
      square300ImageUrl: json['square300_image_url'] as String?,
      square500ImageUrl: json['square500_image_url'] as String?,
      approvedAt: json['approved_at'] == null
          ? null
          : DateTime.parse(json['approved_at'] as String),
      approvedBy: (json['approved_by'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$IncludedResourceToJson(IncludedResource instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'icon_url': instance.iconUrl,
      'trait_type_id': instance.traitTypeId,
      'user_id': instance.userId,
      'is_active': instance.isActive,
      'image_url': instance.imageUrl,
      'square100_image_url': instance.square100ImageUrl,
      'square300_image_url': instance.square300ImageUrl,
      'square500_image_url': instance.square500ImageUrl,
      'approved_at': instance.approvedAt?.toIso8601String(),
      'approved_by': instance.approvedBy,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
