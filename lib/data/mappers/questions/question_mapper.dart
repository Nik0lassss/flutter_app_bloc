import 'package:flutter_app_bloc/data/mappers/questions/tag_mapper.dart';
import 'package:flutter_app_bloc/data/network/model/questions/question_item.dart';

class QuestionMapper {
  TagMapper tagMapper = TagMapper();

  QuestionItem fromJson(Map<String, dynamic> parsedJson) {
    bool _isAnswered = parsedJson['is_answered'];
    int _viewCount = parsedJson['view_count'];
    int _answerCount = parsedJson['answer_count'];
    int _score = parsedJson['score'];
    int _questionId = parsedJson['question_id'];
    DateTime _creationDate =
        DateTime.fromMicrosecondsSinceEpoch(parsedJson['creation_date']);
    String _link = parsedJson['link'];
    String _title = parsedJson['title'];
    return QuestionItem(tagMapper.fromList(parsedJson), _isAnswered, _viewCount,
        _answerCount, _score, _questionId, _creationDate, _link, _title);
  }

  List<QuestionItem> toListFromJson(Map<String, dynamic> parsedJson) {
    List<QuestionItem> result = [];
    for (int i = 0; i < parsedJson['items'].length; i++) {
      result.add(fromJson(parsedJson['items'][i]));
    }
    return result;
  }
}
