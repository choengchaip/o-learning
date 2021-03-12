// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:o_learning/utils/array_helper.dart';

class ISubModule {
  final String id;
  final String title;
  final String description;
  final String moduleId;
  final int current;
  final int max;

  ISubModule({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.moduleId,
    @required this.current,
    @required this.max,
  });

  factory ISubModule.fromJson(Map<String, dynamic> rawJson) {
    return ISubModule(
      id: rawJson["submodule_id"],
      title: rawJson["submodule_name"],
      description: rawJson["submodule_description"],
      moduleId: rawJson["module_id"],
      current: rawJson["current"],
      max: rawJson["max"],
    );
  }
}

class IModule {
  final String id;
  final String title;
  final String description;
  final String image;
  final String courseId;
  final List<ISubModule> subModules;

  IModule({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.courseId,
    @required this.subModules,
  });

  factory IModule.fromJson(Map<String, dynamic> rawJson) {
    return IModule(
      id: rawJson["module_id"],
      title: rawJson["module_name"],
      description: rawJson["module_description"],
      image: rawJson["module_image"],
      courseId: rawJson["course_id"],
      subModules: (rawJson["submodules"] as List)
          .map((e) => ISubModule.fromJson(e))
          .toList(),
    );
  }
}

class ICourseItem {
  final String id;
  final String title;
  final String description;
  final String image;
  final String categoryId;
  final int current;
  final int max;
  final List<IModule> modules;

  ICourseItem({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.categoryId,
    @required this.current,
    @required this.max,
    @required this.modules,
  });

  factory ICourseItem.fromJson(Map<String, dynamic> rawJson) {
    return ICourseItem(
      id: rawJson["course_id"],
      title: rawJson["course_name"],
      description: rawJson["course_description"],
      image: rawJson["course_image"],
      categoryId: rawJson["category_id"],
      current: rawJson["current"],
      max: rawJson["max"],
      modules:
          ArrayHelper.toArray((rawJson["modules"] as List)).map((e) => IModule.fromJson(e)).toList(),
    );
  }
}

class IChapterItem {
  final String id;
  final String image;
  final IconData icon;
  final String title;
  final String description;
  final bool canLearn;
  final bool isPassed;
  final int progress;

  IChapterItem({
    this.id,
    this.image,
    this.icon,
    @required this.title,
    this.description,
    this.canLearn,
    this.isPassed,
    this.progress,
  });
}
