import 'package:flutter_app_bloc/data/network/model/sites/site_response.dart';

abstract class SiteRepository {
  Future<SitemResponse> getAllSites(int page, int pageSize);
}
