import 'package:flutter_app_bloc/data/network/model/questions/tag.dart';

class TagMapper {
  List<QuestionTag> fromList(Map<String, dynamic> parsedJson) {
    List<QuestionTag> result = [];
    for (int i = 0; i < parsedJson['tags'].length; i++) {
      QuestionTag questionTag = QuestionTag(parsedJson['tags'][i]);
      result.add(questionTag);
    }
  }
}
