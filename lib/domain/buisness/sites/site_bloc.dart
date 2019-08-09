import 'package:flutter_app_bloc/data/network/model/sites/item.dart';
import 'package:flutter_app_bloc/data/network/model/sites/site_response.dart';
import 'package:flutter_app_bloc/data/repository/site_repository_impl.dart';
import 'package:flutter_app_bloc/domain/buisness/base/bloc_base.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

class SiteBloc extends BlocBase {
  final SiteRepositoryImpl _repository;

  PublishSubject<List<SiteItem>> _siteFetcher;

  List<SiteItem> _items = [];

  @provide
  SiteBloc(this._repository);

  init() {
    _siteFetcher = PublishSubject<List<SiteItem>>();
  }

  Observable<List<SiteItem>> get allSites {

    return _siteFetcher.stream;
  }

  fetch(int page, int pageSize) async {
    SitemResponse sitemResponse = await _repository
        .getAllSites(page, pageSize)
        .catchError((e) => _siteFetcher.sink.addError(e));
    _items.addAll(sitemResponse.sites);
    _siteFetcher.sink.add(_items);
  }

  @override
  void dispose() {
    _siteFetcher.close();
  }
}
