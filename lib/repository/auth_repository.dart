// @dart=2.9

import 'dart:async';
import 'dart:convert';
import 'package:o_learning/cores/config.dart';
import 'package:http/http.dart' as http;
import 'package:o_learning/repository/base_repository.dart';
import 'package:o_learning/states/about_data_types.dart';
import 'package:o_learning/utils/cache_helper.dart';
import 'package:o_learning/utils/object_helper.dart';

class AuthRepository extends BaseRepository {
  CacheHelper cacheHelper;
  int currentStar = 0;
  int currentProgress = 0;
  String userId = '';
  String nameText = '';
  String emailText = '';
  String passwordText = '';
  String newPasswordText = '';
  String confirmPasswordText = '';
  String accessToken = '';
  String currentCourseId = '';
  String currentCourseName = '';
  int star = 0;
  int progress = 0;

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
            "email": this.emailText,
            "password": this.passwordText,
          }));
      if (data.body == "") {
        throw ('Username or Password Wrong');
      } else {
        this.accessToken = data.body;
        this.object.data['access_token'] = data.body;
        await this.fetchMe();
      }
    } catch (e) {
      print(e.toString());
      this.toErrorStatus();
    }

    if (isErrorMock) {
      this.toErrorStatus();
    }
    this.toCompleteStatus();
  }

  Future<void> register({bool isErrorMock: false}) async {
    this.toLoadingStatus();

    try {
      http.Response data = await http.post('${Config.baseURL}/users',
          body: jsonEncode({
            "email": this.emailText,
            "password": this.passwordText,
          }));
      print('register ${data.body}');
      if (data.body == "") {
        throw ('Error');
      } else {
        this.accessToken = data.body;
        this.object.data['access_token'] = data.body;

        data = await http.put('${Config.baseURL}/users/profile',
            body: jsonEncode({
              "name": this.nameText,
            }),
            headers: {...ObjectHelper.getHeaderOption(this)});

        await this.fetchMe();

        if (this.currentCourseId != '') {
          data = await http.post('${Config.baseURL}/courses/my',
              body: jsonEncode({
                "course_id": this.currentCourseId,
                "user_id": this.userId,
              }),
              headers: {...ObjectHelper.getHeaderOption(this)});

          if (data.body == "") {
            throw ('Error');
          }
        }
      }
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
    this.object.data['category_items'] = '';
    this.object.data['course_items'] = '';
    this.object.data['my_course_items'] = '';
    this.object.data['my_course_item'] = '';
    this.userId = '';
    this.nameText = '';
    this.emailText = '';
    this.passwordText = '';
    this.newPasswordText = '';
    this.confirmPasswordText = '';
    this.accessToken = '';
    this.currentCourseId = '';
    this.currentCourseName = '';
    await this.cacheHelper.removeUser();
    this.toCompleteStatus();
  }

  Future fetchMe() async {
    this.toLoadingStatus();

    try {
      http.Response data = await http.get('${Config.baseURL}/users/profile',
          headers: {...ObjectHelper.getHeaderOption(this)});

      IAboutMe me = IAboutMe.fromJson(jsonDecode(data.body));
      this.setUserId(me.id);
      this.setName(me.name);
      this.setEmail(me.email);
      this.setStar(me.star);
      this.setProgress(me.progress);

      await this.cacheHelper.setUser(me.email, this.accessToken);
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

  void setUserId(String userId) {
    this.userId = userId;
    this.object.data['id'] = userId;
    this.notifyListeners();
  }

  void setName(String name) {
    this.nameText = name;
    this.object.data['name'] = name;
    this.notifyListeners();
  }

  void setEmail(String email) {
    this.emailText = email;
    this.object.data['email'] = email;
    this.notifyListeners();
  }

  void setStar(int start) {
    this.star = start;
    this.object.data['star'] = star;
    this.notifyListeners();
  }

  void setProgress(int progress) {
    this.progress = progress ?? 0;
    this.object.data['progress'] = progress ?? 0;
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

  void setCourseId(String courseId) {
    this.currentCourseId = courseId;
    this.notifyListeners();
  }

  void setCourseName(String courseName) {
    this.currentCourseName = courseName;
    this.notifyListeners();
  }

  Future<void> changePassword() async {
    this.toLoadingStatus();

    this.toLoadingStatus();

    try {
      http.Response data =
      await http.patch('${Config.baseURL}/users/resetpassword',
          body: jsonEncode({
            "oldpassword": this.passwordText,
            "newpassword": this.newPasswordText,
          }),
          headers: {...ObjectHelper.getHeaderOption(this)});
      if (data.body == "400") {
        this.toErrorStatus();
      }
    } catch (e) {
      print('change password error $e');
      this.toErrorStatus();
    }

    this.toCompleteStatus();
  }
}
