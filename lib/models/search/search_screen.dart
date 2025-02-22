import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_c13/models/articles.dart';
import 'package:news_c13/news_item.dart';
import 'package:news_c13/repository/home_repo_remote_impl.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "Search";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Articles> articles = [];
  int maxResult = 0;
  int currentPage = 1;
  String? errorMessage = "";
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController= ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        if(scrollController.position.pixels == scrollController.position.maxScrollExtent && articles.length<maxResult){
          _search();
        }

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            leading: const SizedBox(),
            leadingWidth: 0,
            floating: true,
            toolbarHeight: 90,
            title: TextFormField(
              style: theme.textTheme.titleSmall,
              onFieldSubmitted: (value) {
                currentPage = 1;
                maxResult = 0;
                _search();
              },
              controller: searchController,
              cursorColor: theme.primaryColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.scaffoldBackgroundColor,
                hintText: "Search",
                prefixIconColor: theme.primaryColor,
                suffixIconColor: theme.primaryColor,
                hintStyle: theme.textTheme.titleSmall,
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          if (errorMessage != null)
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          if (articles.isEmpty && errorMessage == null)
            SliverToBoxAdapter(
              child: Center(
                child: Lottie.asset("assets/Animations/Animation - empty.json"),
              ),
            ),
          if (articles.isNotEmpty)
            SliverList.separated(
              itemBuilder: (context, index) {
                if(index == articles.length){
                  return CircularProgressIndicator(
                    color: theme.primaryColor,
                  );
                }else{
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: NewsItem(
                      article: articles[index],
                    ),
                  );
                }
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: articles.length<maxResult?articles.length+1:articles.length,
            ),
        ],
      ),
    );
  }

  _search() async {
    errorMessage = "";
    try {
      var response = await HomeRepoRemoteImpl()
          .searchArticles(searchController.text, currentPage);
      articles.addAll(response.articles!);
      maxResult = response.totalResults!;
      currentPage++;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      setState(() {});
    }
  }
}
