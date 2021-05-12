

import 'dart:convert';

LoginRespond loginFromJson(String str) => LoginRespond.fromJson(json.decode(str));

String loginToJson(LoginRespond data) => json.encode(data.toJson());

class LoginRespond {
  LoginRespond({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  LoginData data;
  String message;

  factory LoginRespond.fromJson(Map<String, dynamic> json) => LoginRespond(
    success: json["success"] == null ? null : json["success"],
    data: json["data"] == null ? null : LoginData.fromJson(json["data"]),
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "data": data == null ? null : data.toJson(),
    "message": message == null ? null : message,
  };

  LoginRespond.withError(String errorValue)
      : data =  null,
        message = errorValue;
}

class LoginData {
  LoginData({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.about,
    this.address,
    this.referalCode,
    this.joinedReferalConde,
    this.otpCreatedAt,
    this.apiToken,
    this.stripeId,
    this.cardBrand,
    this.cardLastFour,
    this.trialEndsAt,
    this.braintreeId,
    this.paypalEmail,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.hasMedia,
    this.country_code,
    this.media,
  });

  int id;
  String name;
  String email;
  String mobile;
  String about;
  String address;
  String referalCode;
  String country_code;
  String joinedReferalConde;
  String otpCreatedAt;
  String apiToken;
  int stripeId;
  String cardBrand;
  String cardLastFour;
  String trialEndsAt;
  int braintreeId;
  String paypalEmail;
  bool status;
  DateTime createdAt;
  DateTime updatedAt;
  bool hasMedia;
  List<Media> media;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    country_code: json["country_code"] == null ? null : json["country_code"],
    about: json["about"],
    address: json["address"],
    referalCode: json["referal_code"] == null ? null : json["referal_code"],
    joinedReferalConde: json["joined_referal_conde"],
    otpCreatedAt: json["otp_created_at"],
    apiToken: json["api_token"] == null ? null : json["api_token"],
    stripeId: json["stripe_id"],
    cardBrand: json["card_brand"],
    cardLastFour: json["card_last_four"],
    trialEndsAt: json["trial_ends_at"],
    braintreeId: json["braintree_id"],
    paypalEmail: json["paypal_email"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    hasMedia: json["has_media"] == null ? null : json["has_media"],
    media: json["media"] == null ? null : List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "mobile": mobile == null ? null : mobile,
    "country_code": country_code == null ? null : country_code,
    "about": about,
    "address": address,
    "referal_code": referalCode == null ? null : referalCode,
    "joined_referal_conde": joinedReferalConde,
    "otp_created_at": otpCreatedAt,
    "api_token": apiToken == null ? null : apiToken,
    "stripe_id": stripeId,
    "card_brand": cardBrand,
    "card_last_four": cardLastFour,
    "trial_ends_at": trialEndsAt,
    "braintree_id": braintreeId,
    "paypal_email": paypalEmail,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "has_media": hasMedia == null ? null : hasMedia,
    "media": media == null ? null : List<Media>.from(media.map((x) => x.toJson())),
  };
}

class Media {
  Media({
    this.id,
    this.modelType,
    this.modelId,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.thumb,
    this.icon,
    this.formatedSize,
  });

  int id;
  String modelType;
  int modelId;
  String collectionName;
  String name;
  String fileName;
  String mimeType;
  String disk;
  int size;
  List<dynamic> manipulations;
  CustomProperties customProperties;
  List<dynamic> responsiveImages;
  int orderColumn;
  DateTime createdAt;
  DateTime updatedAt;
  String url;
  String thumb;
  String icon;
  String formatedSize;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"] == null ? null : json["id"],
    modelType: json["model_type"] == null ? null : json["model_type"],
    modelId: json["model_id"] == null ? null : json["model_id"],
    collectionName: json["collection_name"] == null ? null : json["collection_name"],
    name: json["name"] == null ? null : json["name"],
    fileName: json["file_name"] == null ? null : json["file_name"],
    mimeType: json["mime_type"] == null ? null : json["mime_type"],
    disk: json["disk"] == null ? null : json["disk"],
    size: json["size"] == null ? null : json["size"],
    manipulations: json["manipulations"] == null ? null : List<dynamic>.from(json["manipulations"].map((x) => x)),
    customProperties: json["custom_properties"] == null ? null : CustomProperties.fromJson(json["custom_properties"]),
    responsiveImages: json["responsive_images"] == null ? null : List<dynamic>.from(json["responsive_images"].map((x) => x)),
    orderColumn: json["order_column"] == null ? null : json["order_column"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    url: json["url"] == null ? null : json["url"],
    thumb: json["thumb"] == null ? null : json["thumb"],
    icon: json["icon"] == null ? null : json["icon"],
    formatedSize: json["formated_size"] == null ? null : json["formated_size"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "model_type": modelType == null ? null : modelType,
    "model_id": modelId == null ? null : modelId,
    "collection_name": collectionName == null ? null : collectionName,
    "name": name == null ? null : name,
    "file_name": fileName == null ? null : fileName,
    "mime_type": mimeType == null ? null : mimeType,
    "disk": disk == null ? null : disk,
    "size": size == null ? null : size,
    "manipulations": manipulations == null ? null : List<dynamic>.from(manipulations.map((x) => x)),
    "custom_properties": customProperties == null ? null : customProperties.toJson(),
    "responsive_images": responsiveImages == null ? null : List<dynamic>.from(responsiveImages.map((x) => x)),
    "order_column": orderColumn == null ? null : orderColumn,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "url": url == null ? null : url,
    "thumb": thumb == null ? null : thumb,
    "icon": icon == null ? null : icon,
    "formated_size": formatedSize == null ? null : formatedSize,
  };
}

class CustomProperties {
  CustomProperties({
    this.uuid,
    this.userId,
    this.generatedConversions,
  });

  String uuid;
  int userId;
  GeneratedConversions generatedConversions;

  factory CustomProperties.fromJson(Map<String, dynamic> json) => CustomProperties(
    uuid: json["uuid"] == null ? null : json["uuid"],
    userId: json["user_id"] == null ? null : json["user_id"],
    generatedConversions: json["generated_conversions"] == null ? null : GeneratedConversions.fromJson(json["generated_conversions"]),
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid == null ? null : uuid,
    "user_id": userId == null ? null : userId,
    "generated_conversions": generatedConversions == null ? null : generatedConversions.toJson(),
  };
}

class GeneratedConversions {
  GeneratedConversions({
    this.thumb,
    this.icon,
  });

  bool thumb;
  bool icon;

  factory GeneratedConversions.fromJson(Map<String, dynamic> json) => GeneratedConversions(
    thumb: json["thumb"] == null ? null : json["thumb"],
    icon: json["icon"] == null ? null : json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "thumb": thumb == null ? null : thumb,
    "icon": icon == null ? null : icon,
  };
}
