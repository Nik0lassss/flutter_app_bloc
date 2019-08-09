import 'package:flutter_app_bloc/data/network/model/questions/tag.dart';

class QuestionItem {
  List<QuestionTag> _tags;
  bool _isAnswered;
  int _viewCount;
  int _answerCount;
  int _score;
  int _questionId;
  DateTime _creationDate;
  String link;
  String title;

  QuestionItem(this._tags, this._isAnswered, this._viewCount, this._answerCount,
      this._score, this._questionId, this._creationDate, this.link, this.title);

  DateTime get creationDate => _creationDate;

  int get questionId => _questionId;

  int get score => _score;

  int get answerCount => _answerCount;

  int get viewCount => _viewCount;

  bool get isAnswered => _isAnswered;

  List<QuestionTag> get tags => _tags;
}
