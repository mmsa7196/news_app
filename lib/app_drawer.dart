import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_c13/Providers/my_provider.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  Function onTap;

  AppDrawer({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var myProvider = Provider.of<MyProvider>(context);
    return Container(
      color: Color(0xFF171717),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.8,
      height: double.infinity,
      child: Column(
        children: [
          Container(
              color: Colors.white,
              width: double.infinity,
              height: 220,
              alignment: Alignment.center,
              child: Text("News App".tr(),style: theme.textTheme.headlineMedium,)),
          InkWell(
            onTap: () {
              onTap();
            },
            child: ListTile(
              leading: Icon(
                Icons.home_outlined,
                size: 30,
                color: Colors.white,
              ),
              title: Text(
                "Go To Home".tr(),
                style: theme.textTheme.titleMedium,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            children: [
              ListTile(
                leading: ImageIcon(
                  AssetImage("assets/images/brush.png"),
                  color: Colors.white,
                  size: 30,
                ),
                title: Text(
                  "Theme".tr(),
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: theme.cardColor),
                  ),
                  child: DropdownButton<ThemeMode>(
                    value: myProvider.themeMode,
                    elevation: 0,
                    isExpanded: true,
                    dropdownColor: theme.unselectedWidgetColor,
                    menuMaxHeight: 200,
                    menuWidth: 200,
                    focusNode: FocusNode(canRequestFocus: false),
                    icon: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: Theme.of(context).cardColor,
                      size: 40,
                    ),
                    underline: const SizedBox(),
                    items: [
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text("Light".tr(),
                            style: theme.textTheme.titleMedium,
                        ),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text("Dark".tr(),
                          style:theme.textTheme.titleMedium ,
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        myProvider.changeTheme();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),



          SizedBox(
            height: 24,
          ),
          Divider(
            color: Colors.white,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: 24,
          ),
          Column(
            children: [
              ListTile(
                leading: ImageIcon(
                  AssetImage("assets/images/icons.png"),
                  color: Colors.white,
                  size: 30,
                ),
                title: Text(
                  "Language".tr(),
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: theme.cardColor),
                  ),
                  child: DropdownButton<String>(
                    value: myProvider.currentLanguage,
                    isExpanded: true,
                    elevation: 0,
                    dropdownColor: theme.unselectedWidgetColor,
                    menuMaxHeight: 200,
                    menuWidth: 200,
                    focusNode: FocusNode(canRequestFocus: false),
                    icon: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: theme.cardColor,
                      size: 40,
                    ),
                    underline: const SizedBox(),
                    items: [
                      DropdownMenuItem(
                        value: "ar",
                        child: Text("Arabic".tr(),
                            style: theme.textTheme.titleMedium),
                      ),
                      DropdownMenuItem(
                        value: "en",
                        child: Text("English".tr(),
                            style: theme.textTheme.titleMedium),
                      ),
                    ],
                    onChanged: (value) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        myProvider.changeLanguage(context, value!);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
