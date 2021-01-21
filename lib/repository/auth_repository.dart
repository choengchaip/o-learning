import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:o_learning/cores/config.dart';
import 'package:http/http.dart' as http;
import 'package:o_learning/repository/base_repository.dart';
import 'package:o_learning/utils/cache_helper.dart';

class AuthRepository extends BaseRepository {
  CacheHelper cacheHelper;
  String nameText = '';
  String emailText = '';
  String passwordText = '';
  String newPasswordText = '';
  String confirmPasswordText = '';
  String accessToken = '';

  initCacheHelper(CacheHelper cacheHelper) {
    this.cacheHelper = cacheHelper;
  }

  bool get isAuth =>
      this.object.data['access_token'] != '' ||
      this.object.data['access_token'] != null;

  bool get isNotAuth =>
      this.object.data['access_token'] == '' ||
      this.object.data['access_token'] == null;

  Future<void> login({bool isErrorMock: false}) async {
    this.toLoadingStatus();

    try {
      http.Response data = await http.post('${Config.baseURL}/oauth/token',
          body: jsonEncode({
            "email": 'demo1@gmail.com',
            "password": '12345678',
          }));
      this.accessToken = data.body;
      this.object.data['access_token'] = data.body;
      await this.fetchMe();
    } catch (e) {
      print(e);
      this.toErrorStatus();
    }

    if (isErrorMock) {
      this.toErrorStatus();
    }
    this.toCompleteStatus();
  }

  Future<void> logout() async {
    this.toLoadingStatus();
    this.reset();
    this.object.data['access_token'] = '';
    await this.cacheHelper.removeUser();
    this.toCompleteStatus();
  }

  Future fetchMe() async {
    this.toLoadingStatus();

    try {
      http.Request request = new http.Request('GET', Uri.parse('${Config.baseURL}/users/profile'));
      request.headers['Authorization'] = "Bearer "+this.accessToken.replaceAll('"', '');

      print(request.headers);


      await http.Client().send(request).then((response) {
        response.stream.bytesToString().then((value) {
          print(value.toString());
          // jsonResponse = value.toString();
          // completer.complete(jsonResponse);
        });
      });


      // await http.send(request).then((response) {
      //   response.stream.bytesToString().then((value) {
      //     print(value.toString());
      //     jsonResponse = value.toString();
      //     completer.complete(jsonResponse);
      //   });
      // }).catchError((error) {
      //   print(error.toString());
      // });


      // http.Response data = await http
      //     .get('https://oschool.topwork.asia/api/users/profile', headers: {
      //   'Content-Type': 'application/json; charset=UTF-8',
      //   'Authorization': this.accessToken
      // });

      await this.cacheHelper.setUser(this.emailText, this.accessToken);
    } catch (e) {
      print(e);
      this.toErrorStatus();
    }

    this.toCompleteStatus();
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
    this.object.data['email'] = email;
    this.notifyListeners();
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

  void setAccessToken(String token) {
    this.accessToken = token;
    this.object.data['access_token'] = token;
    this.notifyListeners();
  }

  Future<void> changePassword() async {
    this.toLoadingStatus();

    await Future.delayed(Duration(seconds: 2), () {});

    this.toCompleteStatus();
  }
}
