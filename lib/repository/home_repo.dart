import 'package:news_c13/models/news_data_response.dart';
import 'package:news_c13/models/source_response.dart';

abstract class HomeRepo {
  Future<SourceResponse> getSources(String catId);

  Future<NewsDataResponse> getNewsData(String sourceId);
}
