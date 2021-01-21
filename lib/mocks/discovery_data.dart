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
    course_id: 'id1',
    course_image: 'lib/statics/mocks/course_web_development.png',
    course_name: 'Web Development',
    course_description:
        'Learning to code made easy through beautiful, interactive websites. Code in HTML, CSS, then Javascript',
  ),
  IDiscoveryCourseItem(
    course_id: 'id2',
    course_image: 'lib/statics/mocks/course_python.png',
    course_name: 'Python',
    course_description:
        'Begin your coding journey with a fun, all-purpose language, and take the next step in your career',
  )
];
