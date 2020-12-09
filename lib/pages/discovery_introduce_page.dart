import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/page_slider.dart';
import 'file:///C:/Users/singh/Desktop/Projects/o_learning/lib/features/discovery_introduce/discovery_introduce.dart';

class DiscoveryIntroducePage extends StatefulWidget {
  @override
  _DiscoveryIntroducePage createState() => _DiscoveryIntroducePage();
}

class _DiscoveryIntroducePage extends State<DiscoveryIntroducePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: PageSlider(
                    components: [
                      DiscoveryIntroduceFeature(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
