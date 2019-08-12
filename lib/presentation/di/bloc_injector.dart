import 'package:flutter_app_bloc/domain/buisness/site_detail/site_detail_bloc.dart';
import 'package:flutter_app_bloc/domain/buisness/sites/site_bloc.dart';
import 'package:inject/inject.dart';

//import 'bloc_injector.inject.dart' as g;
import '../../app.dart';
import 'bloc_injector.inject.dart';
import 'bloc_module.dart';

@Injector(const [BlocModule])
abstract class BlocInjector {

  @provide
  SiteBloc get siteBloc;

  @provide
  SiteDetailBloc get siteDetailBloc;

  static final create = BlocInjector$Injector.create;
}
