import 'package:o_learning/states/course_data_types.dart';
import 'package:o_learning/states/subject_data_types.dart';

List<IContinueLearningItem> mockContinueLearning = [
  IContinueLearningItem(
    id: 'id1',
    image: 'lib/statics/mocks/course_continue_1.jpg',
    title: 'Artificial Intelligence',
    progress: 0,
    totalChoice: 6,
  ),
  IContinueLearningItem(
    id: 'id2',
    image: 'lib/statics/mocks/course_continue_3.jpg',
    title: 'UI/UX Design',
    progress: 1,
    totalChoice: 10,
  ),
  IContinueLearningItem(
    id: 'id3',
    image: 'lib/statics/mocks/course_continue_2.jpg',
    title: 'Web development',
    progress: 2,
    totalChoice: 7,
  ),
];

List<IRecommendItem> mockRecommend = [
  IRecommendItem(
    id: 'id1',
    image: 'lib/statics/mocks/course_continue_3.jpg',
    title: 'UX Design',
  ),
  IRecommendItem(
    id: 'id2',
    image: 'lib/statics/mocks/course_continue_2.jpg',
    title: 'Web development',
  ),
  IRecommendItem(
    id: 'id3',
    image: 'lib/statics/mocks/course_continue_1.jpg',
    title: 'Artificial Intelligence',
  ),
];

List<ICategoryItem> mockCategories = [
  ICategoryItem(
    id: 'id1',
    title: 'Web development',
    image: 'lib/statics/mocks/course_continue_1.jpg',
  ),
  ICategoryItem(
    id: 'id2',
    title: 'Artificial Intelligence',
    image: 'lib/statics/mocks/course_continue_2.jpg',
  ),
  ICategoryItem(
    id: 'id3',
    title: 'UI/UX Design',
    image: 'lib/statics/mocks/course_continue_3.jpg',
  ),
  ICategoryItem(
    id: 'id4',
    title: 'Python',
    image: 'lib/statics/mocks/course_continue_1.jpg',
  ),
  ICategoryItem(
    id: 'id5',
    title: 'Mobile development',
    image: 'lib/statics/mocks/course_continue_2.jpg',
  ),
  ICategoryItem(
    id: 'id6',
    title: 'Digital marketing',
    image: 'lib/statics/mocks/course_continue_3.jpg',
  ),
];

List<IChapterItem> mockCategoryChapters = [
  IChapterItem(
    id: 'id1',
    image: 'lib/statics/mocks/course_continue_1.jpg',
    title: 'Web development',
    description:
    'Learning to code made easy through beautiful, interactive websites. Code in HTML, CSS, then Javascript',
  ),
  IChapterItem(
    id: 'id2',
    image: 'lib/statics/mocks/course_python.png',
    title: 'Python',
    description:
    'Begin your coding journey with a fun, all-purpose language, and take the next step in your career',
  ),
  IChapterItem(
    id: 'id3',
    image: 'lib/statics/mocks/course_web_development.png',
    title: 'Web development',
    description:
    'Learning to code made easy through beautiful, interactive websites. Code in HTML, CSS, then Javascript',
  ),
  IChapterItem(
    id: 'id4',
    image: 'lib/statics/mocks/course_continue_2.jpg',
    title: 'Python',
    description:
    'Begin your coding journey with a fun, all-purpose language, and take the next step in your career',
  ),
  IChapterItem(
    id: 'id5',
    image: 'lib/statics/mocks/course_continue_3.jpg',
    title: 'Web development',
    description:
    'Learning to code made easy through beautiful, interactive websites. Code in HTML, CSS, then Javascript',
  ),
  IChapterItem(
    id: 'id2',
    image: 'lib/statics/mocks/course_python.png',
    title: 'Python',
    description:
    'Begin your coding journey with a fun, all-purpose language, and take the next step in your career',
  ),
  IChapterItem(
    id: 'id6',
    image: 'lib/statics/mocks/course_web_development.png',
    title: 'Web development',
    description:
    'Learning to code made easy through beautiful, interactive websites. Code in HTML, CSS, then Javascript',
  ),
  IChapterItem(
    id: 'id7',
    image: 'lib/statics/mocks/course_continue_3.jpg',
    title: 'Python',
    description:
    'Begin your coding journey with a fun, all-purpose language, and take the next step in your career',
  ),
];
