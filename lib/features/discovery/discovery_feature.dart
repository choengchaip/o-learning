import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/components/widget_slider.dart';
import 'package:o_learning/features/discovery/discovery_feature_list.dart';
import 'package:o_learning/features/discovery/discovery_feature_course.dart';
import 'package:o_learning/features/discovery/discovery_feature_experience.dart';
import 'package:o_learning/features/discovery/discovery_feature_goal.dart';
import 'package:o_learning/features/discovery/discovery_feature_notification.dart';
import 'package:o_learning/mocks/discovery_data.dart';
import 'package:o_learning/repository/discovery_widget_repository.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class DiscoveryFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  DiscoveryFeature({@required this.pageSliderRepository});

  @override
  _DiscoveryFeature createState() => _DiscoveryFeature(pageSliderRepository: this.pageSliderRepository);
}

class _DiscoveryFeature extends State<DiscoveryFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();
  DiscoveryWidgetRepository discoveryWidgetRepository =
  new DiscoveryWidgetRepository();

  _DiscoveryFeature({@required this.pageSliderRepository});

  @override
  void initState() {
    this.widgetSliderRepository.initial(pageSliderRepo: this.pageSliderRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: WidgetSlider(
              widgetSliderRepository: this.widgetSliderRepository,
              scrollable: false,
              showDot: false,
              components: [
                IWidgetSlider(
                  component: DiscoveryListFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                    discoveryWidgetRepository: this.discoveryWidgetRepository,
                    mockItems: mockDiscoveryItems1,
                  ),
                ),
                IWidgetSlider(
                  component: DiscoveryListFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                    discoveryWidgetRepository: this.discoveryWidgetRepository,
                    mockItems: mockDiscoveryItems2,
                  ),
                ),
                IWidgetSlider(
                  component: DiscoveryExperienceFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                    discoveryWidgetRepository: this.discoveryWidgetRepository,
                  ),
                ),
                IWidgetSlider(
                  component: DiscoveryCourse(
                    widgetSliderRepository: this.widgetSliderRepository,
                    discoveryWidgetRepository: this.discoveryWidgetRepository,
                    mockItems: mockDiscoveryCourseItems,
                  ),
                ),
                IWidgetSlider(
                  component: DiscoveryGoal(
                    widgetSliderRepository: this.widgetSliderRepository,
                    discoveryWidgetRepository: this.discoveryWidgetRepository,
                  ),
                ),
                IWidgetSlider(
                  component: DiscoveryNotification(
                    widgetSliderRepository: this.widgetSliderRepository,
                    discoveryWidgetRepository: this.discoveryWidgetRepository,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
