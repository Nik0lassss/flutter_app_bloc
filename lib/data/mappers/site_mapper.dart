import 'package:flutter_app_bloc/data/network/model/site_response.dart';

import 'item_mapper.dart';

class SiteMapper {
  ItemMapper itemMapper = ItemMapper();

  SitemResponse fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['items'].length);
    bool has_more = parsedJson['has_more'];
    int quota_max = parsedJson['quota_max'];
    int quota_remaning = parsedJson['quota_remaning'];
    return SitemResponse(itemMapper.fromJsonList(parsedJson['items']), has_more,
        quota_max, quota_remaning);
  }
}
