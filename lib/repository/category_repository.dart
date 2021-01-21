import 'dart:convert';
import 'package:o_learning/cores/config.dart';
import 'package:o_learning/repository/base_repository.dart';
import 'package:http/http.dart' as http;
import 'package:o_learning/utils/object_helper.dart';

class CategoryRepository extends BaseRepository {
  CategoryRepository() {
    this.object.data['category_items'] = List<Map<String, dynamic>>();
    this.object.data['course_items'] = List<Map<String, dynamic>>();
  }

  List get items {
    return this.object.data['category_items'];
  }

  List get courseItems {
    return this.object.data['course_items'];
  }

  dynamic get categoryItem {
    return this.object.data['category_item'];
  }

  Future getCategoryDetail(String categoryId) async {
    this.toLoadingStatus();
    try {
      http.Response data = await http.get(
          '${Config.baseURL}/course?category_id=$categoryId',
          headers: {...ObjectHelper.getHeaderOption(this)});
      this.object.data['category_item'] = jsonDecode(data.body);
    } catch (e) {
      print('get category detail error $e');
      this.toErrorStatus();
    }

    this.toCompleteStatus();
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
}
