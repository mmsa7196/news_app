import 'package:hive/hive.dart';
import 'package:news_c13/models/articles.dart';

part 'news_data_response.g.dart'; // This file will be generated

@HiveType(typeId: 4)
class NewsDataResponse {
  @HiveField(0)
  final String? status;
  @HiveField(1)
  final String? code;
  @HiveField(2)
  final String? message;
  @HiveField(3)
  final int? totalResults;
  @HiveField(4)
  final List<Articles>? articles;

  NewsDataResponse({
    this.status,
    this.code,
    this.message,
    this.totalResults,
    this.articles,
  });

  factory NewsDataResponse.fromJson(dynamic json) => NewsDataResponse(
    status: json['status'],
    code: json['code'],
    message: json['message'],
    totalResults: json['totalResults'],
    articles: json['articles'] != null ? List<Articles>.from(json['articles'].map((v) => Articles.fromJson(v))) : [],
  );
}
