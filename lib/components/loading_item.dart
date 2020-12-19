import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:provider/provider.dart';

class LoadingItem extends StatelessWidget {
  final bool isLoading;
  String message;

  LoadingItem({
    @required this.isLoading,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
    Provider.of<AppLocaleRepository>(context);

    if (this.message == null) {
      this.message = appLocaleRepo.$l('status', 'loading');
    }

    return IgnorePointer(
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
    );
  }
}
