import 'package:o_learning/states/subject_data_types.dart';

List<IContinueLearningItem> mockContinueLearning = [
  IContinueLearningItem(
    image: 'lib/statics/mocks/course_continue_1.jpg',
    title: 'Artificial Intelligence',
    progress: 0,
    totalChoice: 6,
  ),
  IContinueLearningItem(
    image: 'lib/statics/mocks/course_continue_3.jpg',
    title: 'UI/UX Design',
    progress: 1,
    totalChoice: 10,
  ),
  IContinueLearningItem(
    image: 'lib/statics/mocks/course_continue_2.jpg',
    title: 'Web development',
    progress: 2,
    totalChoice: 7,
  ),
];

List<IRecommendItem> mockRecommend = [
  IRecommendItem(
    image: 'lib/statics/mocks/course_continue_3.jpg',
    title: 'UX Design',
  ),
  IRecommendItem(
    image: 'lib/statics/mocks/course_continue_2.jpg',
    title: 'Web development',
  ),
  IRecommendItem(
    image: 'lib/statics/mocks/course_continue_1.jpg',
    title: 'Artificial Intelligence',
  ),
];
