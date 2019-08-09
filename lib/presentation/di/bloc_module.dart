import 'package:flutter_app_bloc/data/network/client/stack_over_flow_service.dart';
import 'package:flutter_app_bloc/data/repository/question_repository_impl.dart';
import 'package:flutter_app_bloc/data/repository/site_repository_impl.dart';
import 'package:flutter_app_bloc/domain/buisness/base/bloc_base.dart';
import 'package:flutter_app_bloc/domain/buisness/site_detail/site_detail_bloc.dart';
import 'package:flutter_app_bloc/domain/buisness/sites/site_bloc.dart';
import 'package:flutter_app_bloc/domain/repository/question_repository.dart';
import 'package:flutter_app_bloc/domain/repository/site_repository.dart';
import 'package:http/http.dart';
import 'package:inject/inject.dart';

@module
class BlocModule {
  @provide
  @singleton
  Client client() => Client();

  @provide
  @singleton
  StackOverFlowService stackOverFlowService(Client client) =>
      StackOverFlowService(client);

  @provide
  @singleton
  SiteRepository siteRepository(StackOverFlowService stackOverFlowService) =>
      SiteRepositoryImpl(stackOverFlowService);

  @provide
  @singleton
  QuestionRepository questionRepository(
          StackOverFlowService stackOverFlowService) =>
      QuestionRepositortImpl(stackOverFlowService);

  @provide
  @singleton
  SiteBloc siteBloc(SiteRepository repository) => SiteBloc(repository);

  @provide
  @singleton
  SiteDetailBloc siteDetailBloc(QuestionRepository repository) => SiteDetailBloc(repository);
}
