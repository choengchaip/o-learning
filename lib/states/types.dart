import 'package:flutter/cupertino.dart';

class IStatus {
  bool isLoading;
  bool isLoaded;
  bool isSuccess;
  bool isError;
  Map<String, dynamic> data;
  List<Map<String, dynamic>> items = [];

  IStatus(
      {this.isLoading,
      this.isLoaded,
      this.isSuccess,
      this.isError,
      this.data,
      this.items});
}

enum BottomMenuType { COURSE, SUBJECT, LEADER_BOARD, ACCOUNT }

class IBottomMenuType {
  IconData icon;
  String title;
  BottomMenuType menuType;

  IBottomMenuType({@required this.icon, @required this.title, @required this.menuType});
}
