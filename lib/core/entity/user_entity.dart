import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? userName;
  final String? profilePhotoUrl;
  final String? token;

  const UserEntity({
    this.id,
    this.name,
    this.email,
    this.userName,
    this.profilePhotoUrl,
    this.token,
  });

  @override
  List<Object?> get props =>
      [id, name, email, userName, profilePhotoUrl, token];
}
