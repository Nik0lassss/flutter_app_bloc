import 'package:flutter_app_bloc/data/network/model/item.dart';

class SitemResponse {
  List<SiteItem> _sites = [];
  bool _has_more;
  int _quota_max;
  int _quota_remaning;


  SitemResponse(this._sites, this._has_more, this._quota_max,
      this._quota_remaning);

  List<SiteItem> get sites => _sites;

  bool get has_more => _has_more;

  int get quota_max => _quota_max;

  int get quota_remaning => _quota_remaning;
}
