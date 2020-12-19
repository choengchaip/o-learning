import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:provider/provider.dart';

class Loading extends StatelessWidget {
  final bool isLoading;
  final Widget component;
  String message;

  Loading({
    @required this.isLoading,
    @required this.component,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);

    if (this.message == null) {
      this.message = appLocaleRepo.$l('status', 'loading');
    }

    return Stack(
      children: [
        IgnorePointer(
          ignoring: this.isLoading,
          child: AnimatedOpacity(
            opacity: this.isLoading ? 0.5 : 1,
            duration: Duration(milliseconds: 250),
            child: this.component,
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: Opacity(
            opacity: this.isLoading ? 1 : 0,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            child: Text(
                              this.message,
                              style: TextStyle(
                                fontSize: fontSizeP,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
