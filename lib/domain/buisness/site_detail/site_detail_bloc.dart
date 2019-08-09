import 'package:flutter_app_bloc/data/network/model/questions/question_item.dart';
import 'package:flutter_app_bloc/domain/buisness/base/bloc_base.dart';
import 'package:flutter_app_bloc/domain/repository/question_repository.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

class SiteDetailBloc extends BlocBase {
  final QuestionRepository _repository;
  PublishSubject<String> _siteName;
  BehaviorSubject<Future<List<QuestionItem>>> _questionFetcher;

  @provide
  SiteDetailBloc(this._repository);

  Function(String) get fetchQuestionsBySite => _siteName.sink.add;

  Observable<Future<List<QuestionItem>>> get questions =>
      _questionFetcher.stream;

  init() {
    _siteName = PublishSubject<String>();
    _questionFetcher = BehaviorSubject<Future<List<QuestionItem>>>();
    _siteName.stream.transform(_itemTransformer()).pipe(_questionFetcher);
  }

  _itemTransformer() {
    return ScanStreamTransformer(
        (Future<List<QuestionItem>> items, String name, int index) {
      items = _repository
          .getQuestions(1, 20, "desc", "activity", "stackoverflow")
          .then((response) => response.items);
      return items;
    });
  }

  _itemTransformer2() {
    return ScanStreamTransformer(
            (Future<List<QuestionItem>> items, String name, int index) {
          items = _repository
              .getQuestions(1, 20, "desc", "activity", "stackoverflow")
              .then((response) => response.items);
          return items;
        });
  }

  @override
  void dispose() {}
}
