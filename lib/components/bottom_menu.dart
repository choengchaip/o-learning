import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/states/types.dart';

class BottomMenu extends StatelessWidget {
  final List<IBottomMenuType> menuItems;
  final Function(BottomMenuType) onChanged;
  final BottomMenuType currentMenu;

  BottomMenu({
    @required this.menuItems,
    @required this.onChanged,
    @required this.currentMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -5),
              blurRadius: 6,
              spreadRadius: 0),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(this.menuItems.length, (int index) {
          return GestureDetector(
            onTap: () {
              this.onChanged(this.menuItems[index].menuType);
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(
                      this.menuItems[index].icon,
                      color: this.currentMenu == this.menuItems[index].menuType
                          ? Theme.of(context).primaryColor
                          : Colors.black87,
                    ),
                  ),
                  Container(
                    child: Text(
                      this.menuItems[index].title,
                      style: TextStyle(
                        color:
                            this.currentMenu == this.menuItems[index].menuType
                                ? Theme.of(context).primaryColor
                                : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
