import 'package:o_learning/states/discovery_data_types.dart';

List<IDiscoveryItem> mockDiscoveryItems1 = [
  IDiscoveryItem(title: 'For my current job', alias: 'job1'),
  IDiscoveryItem(title: 'Just for fun', alias: 'job2'),
  IDiscoveryItem(title: 'To become a professional\ndeveloper', alias: 'job3'),
  IDiscoveryItem(title: 'For a different reason', alias: 'job4'),
];

List<IDiscoveryItem> mockDiscoveryItems2 = [
  IDiscoveryItem(title: 'High school student', alias: 'job1'),
  IDiscoveryItem(title: 'University student', alias: 'job2'),
  IDiscoveryItem(title: 'Employee', alias: 'job3'),
  IDiscoveryItem(title: 'None of these', alias: 'job4'),
];

List<IDiscoveryCourseItem> mockDiscoveryCourseItems = [
  IDiscoveryCourseItem(
    id: 'id1',
    image: 'lib/statics/mocks/course_web_development.png',
    title: 'Web Development',
    description:
        'Learning to code made easy through beautiful, interactive websites. Code in HTML, CSS, then Javascript',
  ),
  IDiscoveryCourseItem(
    id: 'id2',
    image: 'lib/statics/mocks/course_python.png',
    title: 'Python',
    description:
        'Begin your coding journey with a fun, all-purpose language, and take the next step in your career',
  )
];
