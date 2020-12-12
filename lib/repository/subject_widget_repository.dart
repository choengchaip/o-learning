import 'package:o_learning/repository/base_repository.dart';
import 'package:o_learning/states/subject_data_types.dart';

class SubjectRepository extends BaseRepository {
  SubjectRepository() {
    this.object.data['course_id'] = '';
    this.object.data['course_detail'] = {};
    notifyListeners();
  }

  ICategoryItem get categoryItem =>  this.object.data['course_detail'];

  setCourseId(String id) {
    this.object.data['course_id'] = id;
    notifyListeners();
  }

  setCourseDetail(ICategoryItem categoryItem) {
    this.object.data['course_detail'] = categoryItem;
    notifyListeners();
  }
}
