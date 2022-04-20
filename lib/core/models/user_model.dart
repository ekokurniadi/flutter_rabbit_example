import 'package:rabbitmq_flutter/core/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required int? id,
    required String? name,
    required String? email,
    required String? userName,
    required String? profilePhotoUrl,
    required String? token,
  }) : super(
          id: id,
          name: name,
          email: email,
          userName: userName,
          profilePhotoUrl: profilePhotoUrl,
          token: token,
        );

  factory UserModel.fromJson(dynamic json) {
    var jsonMapper = json['user'];
    return UserModel(
      id: jsonMapper['id'],
      name: jsonMapper['name'],
      email: jsonMapper['email'],
      userName: jsonMapper['username'],
      profilePhotoUrl: jsonMapper['profile_photo_url'],
      token: json['access_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "username": userName,
      "profile_photo_url": profilePhotoUrl,
      "token": token,
    };
  }
}
