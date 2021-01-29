import 'dart:async';
import 'dart:convert';
import 'package:o_learning/cores/config.dart';
import 'package:o_learning/repository/base_repository.dart';
import 'package:http/http.dart' as http;
import 'package:o_learning/states/course_data_types.dart';
import 'package:o_learning/states/subject_data_types.dart';
import 'package:o_learning/utils/object_helper.dart';

class CategoryRepository extends BaseRepository {
  dynamic _vm;

  CategoryRepository() {
    this.object.data['category_items'] = List<Map<String, dynamic>>();
    this.object.data['course_items'] = List<Map<String, dynamic>>();
    this.object.data['my_course_items'] = List<Map<String, dynamic>>();
    this.object.data['my_course_item'] = List<Map<String, dynamic>>();
  }

  initial(dynamic vm) {
    this._vm = vm;
  }

  List<ICategoryItem> get items {
    List<ICategoryItem> data = List<ICategoryItem>();
    (this.object.data['category_items'] as List<dynamic>).forEach((raw) {
      Map<String, dynamic> map = ObjectHelper.toMap(raw);
      data.add(ICategoryItem.fromJson(map));
    });

    return data;
  }

  List<ICourseItem> get courseItems {
    List<ICourseItem> data = List<ICourseItem>();
    (this.object.data['course_items'] as List<dynamic>).forEach((raw) {
      Map<String, dynamic> map = ObjectHelper.toMap(raw);
      data.add(ICourseItem.fromJson(map));
    });

    return data;
  }

  List<ICourseItem> get myCourseItems {
    List<ICourseItem> data = List<ICourseItem>();
    (this.object.data['my_course_items'] as List<dynamic>).forEach((raw) {
      Map<String, dynamic> map = ObjectHelper.toMap(raw);
      data.add(ICourseItem.fromJson(map));
    });

    return data;
  }

  ICourseItem get myCourseItem {
    ICourseItem data;
    try {
      data = ICourseItem.fromJson(
          ObjectHelper.toMap(this.object.data['my_course_item']));
      return data;
    } catch (e) {
      return null;
    }
  }

  dynamic get categoryItem {
    return this.object.data['category_item'];
  }

  Future<bool> fetchCategories() async {
    try {
      http.Response data = await http.get('${Config.baseURL}/category',
          headers: {...ObjectHelper.getHeaderOption(this)});
      this.object.data['category_items'] = jsonDecode(data.body);
    } catch (e) {
      this.toErrorStatus();
    }

    return true;
  }

  Future<bool> fetchCacheCategories() async {
    if (this.items.isEmpty) {
      try {
        http.Response data = await http.get('${Config.baseURL}/category',
            headers: {...ObjectHelper.getHeaderOption(this)});
        this.object.data['category_items'] = jsonDecode(data.body);
      } catch (e) {
        this.toErrorStatus();
      }
    }

    return true;
  }

  Future<bool> fetchAllCourse() async {
    try {
      http.Response data = await http.get(
          '${Config.baseURL}/courses?category_id=none',
          headers: {...ObjectHelper.getHeaderOption(this)});
      this.object.data['course_items'] = jsonDecode(data.body);
    } catch (e) {
      this.toErrorStatus();
    }

    return true;
  }

  Future<bool> fetchCacheAllCourse() async {
    if (this.courseItems.isEmpty) {
      try {
        http.Response data = await http.get(
            '${Config.baseURL}/courses?category_id=none',
            headers: {...ObjectHelper.getHeaderOption(this)});
        this.object.data['course_items'] = jsonDecode(data.body);
      } catch (e) {
        this.toErrorStatus();
      }
    }

    return true;
  }

  Future<bool> fetchMyCourse() async {
    try {
      http.Response data = await http.get('${Config.baseURL}/courses/my',
          headers: {...ObjectHelper.getHeaderOption(this)});
      this.object.data['my_course_items'] = jsonDecode(data.body);
    } catch (e) {
      this.toErrorStatus();
    }

    return true;
  }

  Future<bool> fetchCacheMyCourse() async {
    if (this.myCourseItems.isEmpty) {
      try {
        http.Response data = await http.get('${Config.baseURL}/courses/my',
            headers: {...ObjectHelper.getHeaderOption(this)});
        this.object.data['my_course_items'] = jsonDecode(data.body);
      } catch (e) {
        this.toErrorStatus();
      }
    }

    return true;
  }

  Future<bool> fetchMyCourseDetail(String courseId) async {
    if (courseId != '') {
      try {
        http.Response data = await http.get(
            '${Config.baseURL}/courses/my/$courseId',
            headers: {...ObjectHelper.getHeaderOption(this)});
        this.object.data['my_course_item'] = jsonDecode(data.body);
      } catch (e) {
        this.toErrorStatus();
      }
    }

    return true;
  }

  Future<bool> fetchCacheMyCourseDetail(String courseId) async {
    if (courseId != '' && this.myCourseItem == null) {
      try {
        http.Response data = await http.get(
            '${Config.baseURL}/courses/my/$courseId',
            headers: {...ObjectHelper.getHeaderOption(this)});
        this.object.data['my_course_item'] = jsonDecode(data.body);
      } catch (e) {
        this.toErrorStatus();
      }
    }

    return true;
  }
}
