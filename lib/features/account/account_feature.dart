import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class AccountFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  AccountFeature({@required this.pageSliderRepository});

  @override
  _AccountFeature createState() => _AccountFeature(pageSliderRepository: this.pageSliderRepository);
}

class _AccountFeature extends State<AccountFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  _AccountFeature({@required this.pageSliderRepository});

  @override
  void initState() {
    this.widgetSliderRepository.initial(pageSliderRepo: this.pageSliderRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text('Account Page'),
            ),
          )
        ],
      ),
    );
  }
}
