import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/presentation/ui/site_detail/site_detail.dart';
import 'package:flutter_app_bloc/presentation/ui/site_list/site_list.dart';
import 'package:inject/inject.dart';
import 'data/network/model/sites/item.dart';
import 'domain/buisness/site_detail/site_detail_bloc.dart';
import 'domain/buisness/sites/site_bloc.dart';

class App extends StatelessWidget {
  SiteBloc siteBloc;

  App() : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: SiteList.routeName,
      routes: {
        SiteList.routeName: (context) => SiteList(),
        SiteDetail.routeName: (context) => SiteDetail()
      },
    );
  }
}
