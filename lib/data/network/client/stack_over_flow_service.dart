import 'package:flutter_app_bloc/data/mappers/questions/response_mapper.dart';
import 'package:flutter_app_bloc/data/mappers/site/response_mapper.dart';
import 'package:flutter_app_bloc/data/network/model/questions/questions_response.dart';
import 'package:flutter_app_bloc/data/network/model/sites/site_response.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:inject/inject.dart';
import 'dart:convert';

class StackOverFlowService {
  final ResponseSiteMapper siteMapper = new ResponseSiteMapper();
  final ResponseQuestionMapper questionMapper = new ResponseQuestionMapper();

  final Client client;
  final _baseUrl = "https://api.stackexchange.com/2.2";

  @provide
  StackOverFlowService(this.client);

  Future<SitemResponse> getSites(int page, int pageSize) async {
    Response response;
    response =
        await client.get("$_baseUrl/sites?page=$page"
            "&pagesize=$pageSize");
    if (response.statusCode == 200) {
      return siteMapper.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  Future<QuestionResponse> getQuestions(
      int page, int pageSize, String order, String sort, String site) async {
    Response response;
    response = await client.get(
        "$_baseUrl/questions?page=$page"
            "&pagesize=$pageSize"
            "&order=$order"
            "&sort=$sort"
            "&site=$site");
    if (response.statusCode == 200) {
      return questionMapper.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.body);
    }
  }
}
