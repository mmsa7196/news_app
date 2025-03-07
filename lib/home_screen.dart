import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_c13/app_drawer.dart';
import 'package:news_c13/categories_section.dart';
import 'package:news_c13/models/search/search_screen.dart';
import 'package:news_c13/sources_section.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName ?? "Home".tr(),style: Theme.of(context).textTheme.titleLarge,),
          centerTitle: true,
          actions: [Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            }, icon: Icon(Icons.search_rounded, color: theme.primaryColor,),
            ),
            ),

          ],
        ),
        drawer: AppDrawer(
          onTap: onDrawerClicked,
        ),
        body: categoryName == null
            ? CategoriesSection(
                onTap: onCategoryClicked,
              )
            : SourcesSection(
                catId: categoryName!,
          onTap: onDrawerClicked,
              ),
    );
  }

  String? categoryName = null;

  onDrawerClicked() {
    Navigator.pop(context);
    categoryName = null;
    setState(() {});
  }

  onCategoryClicked(category) {
    categoryName = category;
    setState(() {});
  }
}
