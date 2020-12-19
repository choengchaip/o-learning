import 'dart:async';

import 'package:o_learning/mocks/about_me_data.dart';
import 'package:o_learning/repository/base_repository.dart';

class AuthRepository extends BaseRepository {
  String nameText = '';
  String emailText = '';
  String passwordText = '';
  String newPasswordText = '';
  String confirmPasswordText = '';

  bool get isAuth => this.object.data['is_auth'] ?? false;

  bool get isNotAuth => !this.isAuth;

  Future<void> login({bool isErrorMock: false}) async {
    this.toLoadingStatus();

    await Future.delayed(Duration(seconds: 2), () {
      this.object.data['is_auth'] = true;
      this.object.data['aboutMe'] = mockAboutMe;
    });

    if (isErrorMock) {
      this.toErrorStatus();
    }
    this.toCompleteStatus();
  }

  Future<void> logout() async {
    this.object.data['is_auth'] = false;
  }

  void reset() {
    this.nameText = '';
    this.emailText = '';
    this.passwordText = '';
    this.newPasswordText = '';
    this.confirmPasswordText = '';
  }

  void setName(String name) {
    this.nameText = name;
  }

  void setEmail(String email) {
    this.emailText = email;
  }

  void setPassword(String password) {
    this.passwordText = password;
  }

  void setNewPassword(String password) {
    this.newPasswordText = password;
  }

  void setConfirmPassword(String password) {
    this.confirmPasswordText = password;
  }

  Future<void> changePassword() async {
    this.toLoadingStatus();

    await Future.delayed(Duration(seconds: 2), () {

    });

    this.toCompleteStatus();
  }
}
