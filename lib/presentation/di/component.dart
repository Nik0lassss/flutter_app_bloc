import 'package:flutter_app_bloc/domain/buisness/site_detail/site_detail_bloc.dart';
import 'package:flutter_app_bloc/domain/buisness/sites/site_bloc.dart';

import 'bloc_injector.dart';
import 'bloc_module.dart';

class Component {
  static Component component;

  BlocInjector _blocInjector;

  static init() async {
    if (component == null) component = Component();
    await component.build();
  }

  Future<BlocInjector> build() async {
    component._blocInjector = await BlocInjector.create(BlocModule());
  }

  static SiteBloc getSiteBloc() {
    return getBlocInjector().siteBloc;
  }

  static SiteDetailBloc getSiteDetailBloc() {
    return getBlocInjector().siteDetailBloc;
  }

  static BlocInjector getBlocInjector() {
    if (component == null) throw Exception("Before calling you should initialize");
      return component._blocInjector;
  }
}
