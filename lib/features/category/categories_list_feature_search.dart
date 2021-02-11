import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/states/subject_data_types.dart';
import 'package:provider/provider.dart';

class CategoriesListSearchFeature extends StatelessWidget {
  final String title;
  final List<ICategoryItem> items;
  final Function onSearch;
  final Function(String id, String name) onClick;

  CategoriesListSearchFeature({
    @required this.title,
    @required this.items,
    this.onSearch,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
    Provider.of<AppLocaleRepository>(context);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    this.title,
                    style: TextStyle(
                      fontSize: fontSizeP,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      // Container(
                      //   margin: EdgeInsets.only(right: 2),
                      //   child: Icon(
                      //     Icons.search,
                      //     color: Theme.of(context).primaryColor,
                      //     size: fontSizeH4,
                      //   ),
                      // ),
                      // GestureDetector(
                      //   onTap: this.onSearch,
                      //   child: Container(
                      //     child: Text(
                      //       appLocaleRepo.$l('chapter', 'search'),
                      //       style: TextStyle(
                      //         color: Theme.of(context).primaryColor,
                      //         fontSize: fontSizeP,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 12),
            child: Column(
              children: List.generate(
                this.items.length,
                (int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    alignment: Alignment.centerLeft,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          this.onClick(this.items[index].id, this.items[index].title);
                        },
                        child: Container(
                          color: secondaryColor,
                          child: Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(seconds: 2),
                                margin: EdgeInsets.only(right: 16),
                                width: 8,
                                color: Color((Random().nextDouble() * 0xFFFFFF)
                                        .toInt())
                                    .withOpacity(1.0),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    this.items[index].title,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: fontSizeS1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 14),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: fontSizeH5,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
