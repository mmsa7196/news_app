import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_c13/Providers/my_provider.dart';
import 'package:provider/provider.dart';

class CategoriesSection extends StatelessWidget {
  Function onTap;
  CategoriesSection({required this.onTap, super.key});

  List<String> categories = [
    "general".tr(),
    "business".tr(),
    "sports".tr(),
    "health".tr(),
    "entertainment".tr(),
    "technology".tr(),
    "science".tr(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    bool isLight = provider.themeMode == ThemeMode.light;
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning\nHere is Some News For You".tr(),
            style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) {
                return Stack(
                  alignment: !index.isOdd
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                            "assets/images/${categories[index]}.png"),
                    ),
                    InkWell(
                      onTap: () {
                        onTap(categories[index]);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: !index.isOdd ? 18 : 0,
                            left: index.isOdd ? 18 : 0,
                            bottom: 18),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: !index.isOdd
                              ? [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: Text(
                                      "View All".tr(),
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor:Theme.of(context).scaffoldBackgroundColor,
                                    radius: 25,
                                    child: Icon(Icons.arrow_forward_ios,color: theme.primaryColor,),
                                  )
                                ]
                              : [
                                  CircleAvatar(
                                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                    radius: 25,
                                    child: Icon(Icons.arrow_back_ios,color: theme.primaryColor,),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: Text(
                                      "View All".tr(),
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                        ),
                      ),
                    )
                  ],
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
