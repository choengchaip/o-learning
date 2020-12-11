import 'package:flutter/cupertino.dart';

class IStatus<T, L> {
  bool isLoading;
  bool isLoaded;
  bool isSuccess;
  bool isError;
  T data;
  List<L> items = [];

  IStatus(
      {this.isLoading,
      this.isLoaded,
      this.isSuccess,
      this.isError,
      this.data,
      this.items});
}

enum BottomMenuType { COURSE, SUBJECT, LEADER_BOARD, PROFILE }

class IBottomMenuType {
  IconData icon;
  String title;
  BottomMenuType menuType;

  IBottomMenuType({@required this.icon, @required this.title, @required this.menuType});
}
