import 'package:hive/hive.dart';
import 'package:news_c13/models/news_data_response.dart';

import 'package:news_c13/models/source_response.dart';

class HiveService {
  static const String _boxName = "NewsSourcesBox1";
  static const String _boxNewsName = "NewsDataBox1";

  static Future<Box<SourceResponse>> _openBox() async {
    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox<SourceResponse>(_boxName);
    }
    return Hive.box<SourceResponse>(_boxName);
  }

  static Future<Box<NewsDataResponse>> _openNewsBox() async {
    if (!Hive.isBoxOpen(_boxNewsName)) {
      return await Hive.openBox<NewsDataResponse>(_boxNewsName);
    }
    return Hive.box<NewsDataResponse>(_boxNewsName);
  }

  static Future<void> saveSourcesResponse(SourceResponse sourceResponse) async {
    final box = await _openBox();
    await box.put("sourceResponse", sourceResponse);
  }

  static Future<void> saveNewsResponse(NewsDataResponse newsData) async {
    final box = await _openNewsBox();
    await box.put("newsData", newsData);
  }

  static Future<SourceResponse> getSourcesResponse() async {
    final box = await _openBox();

    SourceResponse? sourceResponse = box.get("sourceResponse");

    return sourceResponse ?? SourceResponse();
  }

  static Future<NewsDataResponse> getNewsResponse() async {
    final box = await _openNewsBox();

    NewsDataResponse? newsDataResponse = box.get("newsData");

    return newsDataResponse ?? NewsDataResponse();
  }

  static Future<void> clearSources() async {
    final box = await _openBox();

    await box.delete("sourceResponse");
  }

  static Future<void> clearNews() async {
    final box = await _openNewsBox();

    await box.delete("newsData");
  }
}
