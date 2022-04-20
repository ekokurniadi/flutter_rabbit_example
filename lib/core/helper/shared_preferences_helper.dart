import 'package:rabbitmq_flutter/core/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  Future<int?> getUserID() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    int? userID = _sharedPreferences.getInt("id");
    return userID;
  }

  Future<String?> getNameUser() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    String? name = _sharedPreferences.getString("name");
    return name;
  }

  Future<String?> getEmailUser() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    String? email = _sharedPreferences.getString("email");
    return email;
  }

  Future<String?> getUserName() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    String? userName = _sharedPreferences.getString("user_name");
    return userName;
  }

  Future<String?> getProfilePicture() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    String? profilePicture = _sharedPreferences.getString("profile_picture");
    return profilePicture;
  }

  Future<String?> getAccessToken() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    String? accessToken = _sharedPreferences.getString("token");
    return accessToken;
  }

  Future<bool> setUserPreferences(UserModel data) async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    _sharedPreferences.setInt("id", data.id!);
    _sharedPreferences.setString("name", data.name!);
    _sharedPreferences.setString("email", data.email!);
    _sharedPreferences.setString("user_name", data.userName!);
    _sharedPreferences.setString("profile_picture", data.profilePhotoUrl!);
    _sharedPreferences.setString("token", data.token!);
    return true;
  }

  Future<UserModel> getUserPreferences() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    int? userID = _sharedPreferences.getInt("id");
    String? name = _sharedPreferences.getString("name");
    String? email = _sharedPreferences.getString("email");
    String? userName = _sharedPreferences.getString("user_name");
    String? profilePicture = _sharedPreferences.getString("profile_picture");
    String? token = _sharedPreferences.getString("token");

    final UserModel userModel = UserModel(
      id: userID,
      name: name,
      email: email ?? "email@gmail.com",
      userName: userName,
      profilePhotoUrl: profilePicture,
      token: token,
    );

    return userModel;
  }

  Future<bool> resetUserPreferences() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    _sharedPreferences.remove("id");
    _sharedPreferences.remove("name");
    _sharedPreferences.remove("email");
    _sharedPreferences.remove("user_name");
    _sharedPreferences.remove("profile_picture");
    _sharedPreferences.remove("token");
    return true;
  }

  Future<void> setThemeToPreferences(String? theme) async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    _sharedPreferences.setString("theme", theme!);
  }

  Future<String?> getThemeToPreferences() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    final theme = _sharedPreferences.getString("theme");
    return theme;
  }
}
