import 'package:hive/hive.dart';
import 'package:news_c13/models/sources.dart';

part 'articles.g.dart'; // This file will be generated

@HiveType(typeId: 3)
class Articles {
  @HiveField(0)
  final Sources? source;
  @HiveField(1)
  final String? author;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? url;
  @HiveField(5)
  final String? urlToImage;
  @HiveField(6)
  final String? publishedAt;
  @HiveField(7)
  final String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Articles.fromJson(dynamic json) => Articles(
    source: json['source'] != null ? Sources.fromJson(json['source']) : null,
    author: json['author'],
    title: json['title'],
    description: json['description'],
    url: json['url'],
    urlToImage: json['urlToImage'],
    publishedAt: json['publishedAt'],
    content: json['content'],
  );
}
