import 'dart:convert';
import 'package:o_learning/cores/config.dart';
import 'package:o_learning/repository/base_repository.dart';
import 'package:http/http.dart' as http;
import 'package:o_learning/utils/object_helper.dart';

class LeaderBoardRepository extends BaseRepository {
  LeaderBoardRepository() {
    this.object.items = [];
    this.object.data['leader_board_items'] = List<Map<String, dynamic>>();
    notifyListeners();
  }

  List get items {
    return this.object.data['leader_board_items'];
  }

  Future<bool> fetchLeaderBoard() async {
    this.toLoadingStatus();

    try {
      http.Response data = await http.get('${Config.baseURL}/leaderboard',
          headers: {...ObjectHelper.getHeaderOption(this)});
      this.object.data['leader_board_items'] = jsonDecode(data.body);

      this.toSuccessItemsStatus();
    } catch (e) {
      this.toErrorStatus();
    }

    this.toCompleteStatus();

    return true;
  }

  Future<bool> fetchCacheLeaderBoard() async {
    this.toLoadingStatus();
    if (this.items.isEmpty) {
      try {
        http.Response data = await http.get('${Config.baseURL}/leaderboard',
            headers: {...ObjectHelper.getHeaderOption(this)});
        this.object.data['leader_board_items'] = jsonDecode(data.body);

        this.toSuccessItemsStatus();
      } catch (e) {
        this.toErrorStatus();
      }
    }
    this.toCompleteStatus();

    return true;
  }
}
