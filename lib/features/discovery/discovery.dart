import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/components/widget_slider.dart';
import 'package:o_learning/features/discovery/discovert_list.dart';

class DiscoveryFeature extends StatefulWidget {
  @override
  _DiscoveryFeature createState() => _DiscoveryFeature();
}

class _DiscoveryFeature extends State<DiscoveryFeature> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: WidgetSlider(
              scrollable: false,
              showDot: false,
              components: [
                IWidgetSlider(component: DiscoveryListFeature()),
                IWidgetSlider(component: DiscoveryListFeature()),
                IWidgetSlider(component: DiscoveryListFeature()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
