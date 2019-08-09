import 'package:flutter_app_bloc/data/network/model/questions/question_item.dart';

class QuestionResponse {
  List<QuestionItem> _items;
  bool _hasMore;
  int _quotaMax;
  int _quotaRemainig;

  QuestionResponse(
      this._items, this._hasMore, this._quotaMax, this._quotaRemainig);

  List<QuestionItem> get items => _items;

  bool get hasMore => _hasMore;

  int get quotaMax => _quotaMax;

  int get quotaRemainig => _quotaRemainig;
}
