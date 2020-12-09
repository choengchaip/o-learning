import 'package:o_learning/repository/base_repository.dart';

class AuthRepository extends BaseRepository<dynamic, dynamic> {
  bool get isAuth => this.object.data['isAuth'] ?? false;

  bool get isNotAuth => !this.isAuth;

  Future<void> login() async {
    this.object.data['isAuth'] = true;
  }

  Future<void> logout() async {
    this.object.data['isAuth'] = false;
  }
}
