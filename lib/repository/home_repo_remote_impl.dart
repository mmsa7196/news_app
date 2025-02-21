import 'dart:convert';

import 'package:news_c13/cache_helper.dart';
import 'package:news_c13/models/news_data_response.dart';

import 'package:news_c13/models/source_response.dart';
import 'package:news_c13/repository/home_repo.dart';
import 'package:http/http.dart' as http;

class HomeRepoRemoteImpl implements HomeRepo {
  @override
  Future<NewsDataResponse> getNewsData(String sourceId) async {
    Uri url = Uri.https("newsapi.org", "/v2/everything", {
      "apiKey": "01223e9ad796488c9e98254e365a7ab2",
      "sources": sourceId,
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(json);
    await HiveService.saveNewsResponse(newsDataResponse);
    print("News newsDataResponse  Saved on local DB");
    return newsDataResponse;
  }

  @override
  Future<SourceResponse> getSources(String catId) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources", {
      "apiKey": "01223e9ad796488c9e98254e365a7ab2",
      "category": catId,
    });

    http.Response response = await http.get(url);

    var json = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    await HiveService.saveSourcesResponse(sourceResponse);
    print("News Sources Saved on local DB");
    return sourceResponse;
  }
}
