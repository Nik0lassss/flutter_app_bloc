import 'package:flutter_app_bloc/data/network/model/item.dart';

class ItemMapper {
  SiteItem fromJson(Map<String, dynamic> parsedJson) {
    String site_state = parsedJson['site_state'];
    String icon_url = parsedJson['icon_url'];
    String site_url = parsedJson['site_url'];
    String name = parsedJson['name'];
    return SiteItem(site_state, icon_url, site_url, name);
  }

  List<SiteItem> fromJsonList(Map<String, dynamic> parsedJson) {
    List<SiteItem> result = [];
    for (int i = 0; i < parsedJson['items'].length; i++) {
      SiteItem siteItem = fromJson(parsedJson['results'][i]);
      result.add(siteItem);
    }
    return result;
  }
}
