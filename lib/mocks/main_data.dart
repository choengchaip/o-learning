import 'package:o_learning/states/discovery_data_types.dart';
import 'package:o_learning/states/subject_data_types.dart';

List<IDiscoveryCourseItem> mockMainCourseItems = [
  IDiscoveryCourseItem(
    id: 'id1',
    image: 'lib/statics/mocks/course_web_development.png',
    title: 'Web Development',
    description:
    'Learning to code made easy through beautiful, interactive websites. Code in HTML, CSS, then Javascript',
    progress: 2,
  ),
  IDiscoveryCourseItem(
    id: 'id2',
    image: 'lib/statics/mocks/course_python.png',
    title: 'Python',
    description:
    'Begin your coding journey with a fun, all-purpose language, and take the next step in your career',
  )
];

List<IQuizItem> mockQuizItems = [
  IQuizItem(
    id: 'id0',
    no: '0',
    title: 'Introduce',
    progress: 15,
    totalChoice: 15,
  ),
  IQuizItem(
    id: 'id1',
    no: '1',
    title: 'Get Start',
    progress: 4,
    totalChoice: 15,
  ),
  IQuizItem(
    id: 'id2',
    no: '2',
    title: 'Manipulation',
    progress: 0,
    totalChoice: 16,
  ),
  IQuizItem(
    id: 'id3',
    no: '3',
    title: 'Redirection',
    progress: 0,
    totalChoice: 13,
  ),
  IQuizItem(
    id: 'id4',
    no: '4',
    title: 'Permission',
    progress: 0,
    totalChoice: 14,
  ),
  IQuizItem(
    id: 'id5',
    no: '5',
    title: 'Environment',
    progress: 0,
    totalChoice: 12,
  ),
  IQuizItem(
    id: 'id6',
    no: '6',
    title: 'Extras',
    progress: 0,
    totalChoice: 11,
  ),
];