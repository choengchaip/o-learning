import 'package:o_learning/repository/base_repository.dart';

class DiscoveryWidgetRepository extends BaseRepository {
  DiscoveryWidgetRepository() {
    this.object.data['aliases'] = List<String>();
    notifyListeners();
  }

  addAliasToList(String alias) {
    (this.object.data['aliases'] as List<String>).add(alias);
    notifyListeners();
  }

  popAliasFromList() {
    (this.object.data['aliases'] as List<String>).removeLast();
    notifyListeners();
  }
}
