import 'package:o_learning/repository/base_repository.dart';

class DiscoveryWidgetRepository extends BaseRepository {
  DiscoveryWidgetRepository() {
    this.object.data['aliases'] = List<String>();
    this.object.data['course_id'] = '';
    this.object.data['experience'] = '';
    this.object.data['time_spend'] = '';
    notifyListeners();
  }

  addAliasToList(String alias) {
    (this.object.data['aliases'] as List<String>).add(alias);
    notifyListeners();
  }

  addCourse(String courseId) {
    this.object.data['course_id'] = courseId;
  }

  addExperience(double experience) {
    switch (experience.toInt()) {
      case 0:
        this.object.data['experience'] = 'beginner';
        break;
      case 50:
        this.object.data['experience'] = 'junior';
        break;
      case 100:
        this.object.data['experience'] = 'senior';
        break;
      default:
        this.object.data['experience'] = 'beginner';
    }
  }

  addGoal(int timeSpend) {
    switch (timeSpend) {
      case 5:
        this.object.data['time_spend'] = 'casual';
        break;
      case 10:
        this.object.data['time_spend'] = 'regular';
        break;
      case 20:
        this.object.data['time_spend'] = 'serious';
        break;
      default:
        this.object.data['time_spend'] = 'casual';
    }
  }

  popAliasFromList() {
    (this.object.data['aliases'] as List<String>).removeLast();
    notifyListeners();
  }
}
