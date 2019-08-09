import 'package:flutter_app_bloc/data/network/model/questions/questions_response.dart';

abstract class QuestionRepository {
  Future<QuestionResponse> getQuestions(
      int page, int pageSize, String order, String sort, String site);
}
