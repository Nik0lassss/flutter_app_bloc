import 'package:flutter_app_bloc/data/mappers/questions/question_mapper.dart';
import 'package:flutter_app_bloc/data/network/model/questions/questions_response.dart';

class ResponseQuestionMapper {
  QuestionMapper questionMapper = QuestionMapper();

  QuestionResponse fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['items'].length);
    bool _has_more = parsedJson['has_more'];
    int _quota_max = parsedJson['quota_max'];
    int _quota_remaning = parsedJson['quota_remaning'];
    return QuestionResponse(questionMapper.toListFromJson(parsedJson),
        _has_more, _quota_max, _quota_remaning);
  }
}
