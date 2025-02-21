import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_c13/models/articles.dart';
import 'package:news_c13/models/news_data_response.dart';

class NewsItem extends StatelessWidget {
  final Articles article;

  const NewsItem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              article.title ?? "",
              maxLines: 2,
              style: theme.textTheme.titleSmall,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(article.author?.split(" ").first ?? "",style: theme.textTheme.titleSmall,),
                Text(article.publishedAt?.substring(0, 10) ?? "",style: theme.textTheme.titleSmall,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
