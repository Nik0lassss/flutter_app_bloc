import 'package:flutter_app_bloc/data/network/client/stack_over_flow_service.dart';
import 'package:flutter_app_bloc/data/network/model/sites/site_response.dart';
import 'package:flutter_app_bloc/domain/repository/site_repository.dart';
import 'package:inject/inject.dart';

class SiteRepositoryImpl implements SiteRepository {
  final StackOverFlowService stackOverFlowService;

  @provide
  SiteRepositoryImpl(this.stackOverFlowService);

  @override
  Future<SitemResponse> getAllSites(int page, int pageSize) =>
      stackOverFlowService.getSites(page, pageSize);
}
