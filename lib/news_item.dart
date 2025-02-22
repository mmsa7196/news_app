import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_c13/models/articles.dart';
import 'package:news_c13/models/news_data_response.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {
  final Articles article;

  const NewsItem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        _showArticleDetailsBottomSheet(context,article);
      },
      child: Card(
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
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall,
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
      ),
    );
  }

  void _showArticleDetailsBottomSheet(BuildContext context, Articles article) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      isDismissible: true,
      builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color:Theme.of(context).primaryColor ,
            borderRadius: BorderRadius.circular(24),
          ),
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
                article.description ?? "",
                maxLines: 3,
                style: Theme.of(context).textTheme.labelMedium,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 16,
              ),
              FilledButton(onPressed: () {
                launchUrl(Uri.parse(article.url ?? ""),
                    mode: LaunchMode.inAppWebView);
              },
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  foregroundColor: Theme.of(context).textTheme.titleSmall?.color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all( 16,),
                  textStyle: Theme.of(context).textTheme.titleSmall,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("View Full Articel"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}
