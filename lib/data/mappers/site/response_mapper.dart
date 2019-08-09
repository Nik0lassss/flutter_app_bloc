import 'package:flutter_app_bloc/data/network/model/sites/site_response.dart';

import 'package:flutter_app_bloc/data/mappers/site/site_mapper.dart';

class ResponseSiteMapper {
  SiteMapper itemMapper = SiteMapper();

  SitemResponse fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['items'].length);
    bool has_more = parsedJson['has_more'];
    int quota_max = parsedJson['quota_max'];
    int quota_remaning = parsedJson['quota_remaning'];
    return SitemResponse(itemMapper.fromJsonList(parsedJson), has_more,
        quota_max, quota_remaning);
  }
}
