import 'package:flutter/cupertino.dart';

class IAboutMe {
  String id;
  String name;
  String email;
  String password;
  String role;
  String phone;
  String remember_token;
  String birthday;
  String gender;
  String blood_group;
  String school_id;
  String authentication_key;
  dynamic watch_history;
  int star;
  int progress;

  IAboutMe({
    this.id,
    @required this.name,
    @required this.email,
    this.password,
    this.role,
    this.phone,
    this.remember_token,
    this.birthday,
    this.gender,
    this.blood_group,
    this.school_id,
    this.authentication_key,
    this.watch_history,
    this.star,
    this.progress,
  });

  factory IAboutMe.fromJson(Map<String, dynamic> rawJson) {
    return IAboutMe(
      id: rawJson['id'],
      name: rawJson['name'],
      email: rawJson['email'],
      password: rawJson['password'],
      role: rawJson['role'],
      phone: rawJson['phone'],
      remember_token: rawJson['remember_token'],
      birthday: rawJson['birthday'],
      gender: rawJson['gender'],
      blood_group: rawJson['blood_group'],
      school_id: rawJson['school_id'],
      authentication_key: rawJson['authentication_key'],
      watch_history: rawJson['watch_history'],
      star: rawJson['star'],
      progress: rawJson['progress'],
    );
  }
}
