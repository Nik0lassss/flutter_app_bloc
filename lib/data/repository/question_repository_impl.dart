import 'package:flutter_app_bloc/data/network/client/stack_over_flow_service.dart';
import 'package:flutter_app_bloc/data/network/model/questions/questions_response.dart';
import 'package:flutter_app_bloc/domain/repository/question_repository.dart';
import 'package:inject/inject.dart';

class QuestionRepositortImpl extends QuestionRepository {
  final StackOverFlowService stackOverFlowService;

  @provide
  QuestionRepositortImpl(this.stackOverFlowService);

  @override
  Future<QuestionResponse> getQuestions(
          int page, int pageSize, String order, String sort, String site) =>
      stackOverFlowService.getQuestions(page, pageSize, order, sort, site);
}
