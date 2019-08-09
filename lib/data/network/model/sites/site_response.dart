import 'package:flutter_app_bloc/data/network/model/sites/item.dart';

class SitemResponse {
  List<SiteItem> _sites = [];
  bool _hasMore;
  int _quotaMax;
  int _quotaRemaning;


  SitemResponse(this._sites, this._hasMore, this._quotaMax,
      this._quotaRemaning);

  List<SiteItem> get sites => _sites;

  bool get hasMore => _hasMore;

  int get quotaMax => _quotaMax;

  int get quotaRemaning => _quotaRemaning;
}
