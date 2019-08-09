import 'bloc_injector.dart' as _i1;
import 'bloc_module.dart' as _i2;
import 'package:http/src/client.dart' as _i3;
import '../../data/network/client/stack_over_flow_service.dart' as _i4;
import '../../domain/repository/site_repository.dart' as _i5;
import '../../domain/buisness/sites/site_bloc.dart' as _i6;
import '../../domain/repository/question_repository.dart' as _i7;
import '../../domain/buisness/site_detail/site_detail_bloc.dart' as _i8;
import 'dart:async' as _i9;

class BlocInjector$Injector implements _i1.BlocInjector {
  BlocInjector$Injector._(this._blocModule);

  final _i2.BlocModule _blocModule;

  _i3.Client _singletonClient;

  _i4.StackOverFlowService _singletonStackOverFlowService;

  _i5.SiteRepository _singletonSiteRepository;

  _i6.SiteBloc _singletonSiteBloc;

  _i7.QuestionRepository _singletonQuestionRepository;

  _i8.SiteDetailBloc _singletonSiteDetailBloc;

  static _i9.Future<_i1.BlocInjector> create(_i2.BlocModule blocModule) async {
    final injector = BlocInjector$Injector._(blocModule);

    return injector;
  }

  _i6.SiteBloc _createSiteBloc() =>
      _singletonSiteBloc ??= _blocModule.siteBloc(_createSiteRepository());
  _i5.SiteRepository _createSiteRepository() => _singletonSiteRepository ??=
      _blocModule.siteRepository(_createStackOverFlowService());
  _i4.StackOverFlowService _createStackOverFlowService() =>
      _singletonStackOverFlowService ??=
          _blocModule.stackOverFlowService(_createClient());
  _i3.Client _createClient() => _singletonClient ??= _blocModule.client();
  _i8.SiteDetailBloc _createSiteDetailBloc() => _singletonSiteDetailBloc ??=
      _blocModule.siteDetailBloc(_createQuestionRepository());
  _i7.QuestionRepository _createQuestionRepository() =>
      _singletonQuestionRepository ??=
          _blocModule.questionRepository(_createStackOverFlowService());
  @override
  _i6.SiteBloc get siteBloc => _createSiteBloc();
  @override
  _i8.SiteDetailBloc get siteDetailBloc => _createSiteDetailBloc();
}
