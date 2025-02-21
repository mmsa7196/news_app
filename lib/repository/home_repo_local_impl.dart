import 'dart:convert';

import 'package:news_c13/cache_helper.dart';
import 'package:news_c13/models/news_data_response.dart';
import 'package:news_c13/models/source_response.dart';
import 'package:news_c13/repository/home_repo.dart';
import 'package:http/http.dart' as http;

class HomeRepoLocalImpl implements HomeRepo {
  @override
  Future<NewsDataResponse> getNewsData(String sourceId) async {
    return await HiveService.getNewsResponse();
  }

  @override
  Future<SourceResponse> getSources(String catId) async {
    return await HiveService.getSourcesResponse();
  }
}
