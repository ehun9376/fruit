import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fruit/uti/string_to_enum.dart';
import 'package:uuid/uuid.dart';

enum LoginStatus { unknown, anonymous, loggedIn, loggedOut }

enum SubscriptionStatus { unknown, active, cancelled, refunded, expired }

class AppUser {
  String? uid;
  String? email;
  String? displayName;
  String? photoUrl;
  DateTime? createDate;
  DateTime? updateDate;
  String? id;
  String? loginStatus;
  String? authSource;
  String? phoneNumber;
  String? description;
  bool? isEmailShared;
  bool? isPhoneShared;
  bool? isDescriptionShared;
  bool? canReceiveNotifications;
  String? idToken;
  String? refreshToken;
  List<ProviderData>? providerData = [];

  UserSubscription? currentSubscription;

  AppUser({
    this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
    this.createDate,
    this.updateDate,
    this.id,
    this.loginStatus,
    this.authSource,
    this.phoneNumber,
    this.description,
    this.isEmailShared = false,
    this.isPhoneShared = false,
    this.isDescriptionShared = false,
    this.canReceiveNotifications = false,
    this.idToken,
    this.refreshToken,
    this.providerData,
    this.currentSubscription,
  }) {
    providerData ??= [];
    uid ??= const Uuid().v4();
    id ??= const Uuid().v4();

    debugPrint(currentSubscription.toString());
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    List<ProviderData> providerData = [];
    if (json['providerData'] != null) {
      for (var providerJson in json['providerData']) {
        providerData.add(ProviderData.fromJson(providerJson));
      }
    }

    return AppUser(
      uid: json['uid'],
      email: json['email'],
      displayName: json['displayName'],
      photoUrl: json['photoUrl'],
      createDate: DateTime.parse(json['createDate'] ?? ""),
      updateDate: DateTime.parse(json['updateDate'] ?? ""),
      id: json['id'],
      loginStatus: json['loginStatus'],
      authSource: json['authSource'],
      phoneNumber: json['phoneNumber'],
      description: json['description'],
      isEmailShared: json['isEmailShared'],
      isPhoneShared: json['isPhoneShared'],
      isDescriptionShared: json['isDescriptionShared'],
      canReceiveNotifications: json['canReceiveNotifications'],
      idToken: json['idToken'],
      refreshToken: json['refreshToken'],
      providerData: providerData,
      currentSubscription: json['currentSubscription'] != null
          ? UserSubscription.fromJson(json['currentSubscription'])
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> providerDataJson =
        providerData?.map((provider) => provider.toJson()).toList() ?? [];

    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'createDate': createDate?.toIso8601String(),
      'updateDate': updateDate?.toIso8601String(),
      'id': id,
      'loginStatus': loginStatus,
      'authSource': authSource,
      'phoneNumber': phoneNumber,
      'description': description,
      'isEmailShared': isEmailShared,
      'isPhoneShared': isPhoneShared,
      'isDescriptionShared': isDescriptionShared,
      'canReceiveNotifications': canReceiveNotifications,
      // 'idToken': idToken,
      // 'refreshToken': refreshToken,
      'providerData': providerDataJson,
      'currentSubscription': currentSubscription?.toJson(),
    };
  }

  static AppUser copyAppUser(AppUser? originalUser) {
    if (originalUser == null) {
      return AppUser(providerData: []);
    }

    List<ProviderData> providerDataCopyList = [];
    for (var providerData in originalUser.providerData ?? []) {
      // 创建 ProviderData 的副本
      ProviderData providerDataCopy = ProviderData(
        uid: providerData.uid,
        email: providerData.email,
        displayName: providerData.displayName,
        photoUrl: providerData.photoUrl,
        createDate: providerData.createDate,
        updateDate: providerData.updateDate,
        providerId: providerData.providerId,
      );
      providerDataCopyList.add(providerDataCopy);
    }

    // 创建 AppUser 的副本
    AppUser copiedUser = AppUser(
      uid: originalUser.uid,
      email: originalUser.email,
      displayName: originalUser.displayName,
      photoUrl: originalUser.photoUrl,
      createDate: originalUser.createDate,
      updateDate: originalUser.updateDate,
      id: originalUser.id,
      loginStatus: originalUser.loginStatus,
      authSource: originalUser.authSource,
      phoneNumber: originalUser.phoneNumber,
      description: originalUser.description,
      isEmailShared: originalUser.isEmailShared,
      isPhoneShared: originalUser.isPhoneShared,
      isDescriptionShared: originalUser.isDescriptionShared,
      canReceiveNotifications: originalUser.canReceiveNotifications,
      idToken: originalUser.idToken,
      refreshToken: originalUser.refreshToken,
      providerData: providerDataCopyList,
    );

    return copiedUser;
  }
}

class ProviderData {
  final String uid;
  final String email;
  final String displayName;
  final String photoUrl;
  final DateTime createDate;
  final DateTime updateDate;
  final String providerId;

  ProviderData({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoUrl,
    required this.createDate,
    required this.updateDate,
    required this.providerId,
  });

  factory ProviderData.fromJson(Map<String, dynamic> json) {
    return ProviderData(
      uid: json['uid'],
      email: json['email'],
      displayName: json['displayName'],
      photoUrl: json['photoUrl'],
      createDate: DateTime.parse(json['createDate']),
      updateDate: DateTime.parse(json['updateDate']),
      providerId: json['providerId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'createDate': createDate.toIso8601String(),
      'updateDate': updateDate.toIso8601String(),
      'providerId': providerId,
    };
  }
}

class UserSubscription {
  final String id;
  final String userId;
  final String subscriptionId;
  final String productId;
  final String platform;
  final DateTime purchaseDate;
  final DateTime startDate;
  final DateTime endDate;
  final SubscriptionStatus status;
  final bool isAutoRenewing;
  final DateTime updateDate;
  final String purchaseToken;
  final String? purchaseId;
  int verificationResult;

  UserSubscription({
    required this.id,
    required this.userId,
    required this.subscriptionId,
    required this.productId,
    required this.platform,
    required this.purchaseDate,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.isAutoRenewing,
    required this.updateDate,
    required this.purchaseToken,
    required this.verificationResult,
    this.purchaseId,
  });

  @override
  String toString() {
    return 'UserSubscription{id: $id, userId: $userId, subscriptionId: $subscriptionId, productId: $productId, platform: $platform, purchaseDate: $purchaseDate, startDate: $startDate, endDate: $endDate, status: ${stringFromEnum(status)}, isAutoRenewing: $isAutoRenewing, updateDate: $updateDate, purchaseId: $purchaseId, purchaseToken? $purchaseToken, verificationResult: $verificationResult}';
  }

  factory UserSubscription.fromJson(Map<String, dynamic> json) {
    try {
      // debugPrint(
      //     '======> UserSubscription.fromJson: $json'); // Print input JSON.
      var userSubscription = UserSubscription(
        id: json['id'] ?? '',
        userId: json['userId'] ?? '',
        subscriptionId: json['subscriptionId'] ?? '',
        productId: json['productId'] ?? '',
        platform: json['platform'] ?? '',
        startDate: json['startDate'] != null
            ? DateTime.parse(json['startDate'])
            : DateTime.now(),
        endDate: json['endDate'] != null
            ? DateTime.parse(json['endDate'])
            : DateTime.now(),
        status: enumFromString(SubscriptionStatus.values, json['status'] ?? ''),
        isAutoRenewing: json['isAutoRenewing'] ?? false,
        updateDate: json['updateDate'] != null
            ? DateTime.parse(json['updateDate'])
            : DateTime.now(),
        purchaseDate: json['purchaseDate'] != null
            ? DateTime.parse(json['purchaseDate'])
            : DateTime.now(),
        purchaseId: json['purchaseId'],
        purchaseToken: json['purchaseToken'] ?? '',
        verificationResult: json['verificationResult'] ?? 0,
      );
      debugPrint(
          '======> UserSubscription.fromJson: created UserSubscription: $userSubscription'); // Print created UserSubscription.
      return userSubscription;
    } catch (e) {
      debugPrint(
          '======> UserSubscription.fromJson: error: $e'); // Print error.
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    var json = {
      'id': id,
      'userId': userId,
      'subscriptionId': subscriptionId,
      'productId': productId,
      'platform': platform,
      'purchaseDate': purchaseDate.toIso8601String(),
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': stringFromEnum(status),
      'isAutoRenewing': isAutoRenewing,
      'updateDate': updateDate.toIso8601String(),
      'purchaseId': purchaseId,
      'purchaseToken': purchaseToken,
      'verificationResult': verificationResult,
    };

    //remove empty string for null value
    json.removeWhere((key, value) => value == null || value == '');
    debugPrint(jsonEncode(json).toString());
    return json;
  }
}
