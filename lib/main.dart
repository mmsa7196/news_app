import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_c13/home_screen.dart';
import 'package:news_c13/internet_service.dart';
import 'package:news_c13/models/articles.dart';
import 'package:news_c13/models/news_data_response.dart';
import 'package:news_c13/models/search/search_screen.dart';
import 'package:news_c13/models/source_response.dart';
import 'package:provider/provider.dart';
import 'Providers/my_provider.dart';
import 'core/theme/base_theme.dart';
import 'core/theme/theme_dark.dart';
import 'core/theme/theme_light.dart';
import 'models/sources.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  InternetService().init();

  await Hive.initFlutter();
  Hive.registerAdapter(SourcesAdapter());
  Hive.registerAdapter(SourceResponseAdapter());
  Hive.registerAdapter(ArticlesAdapter());
  Hive.registerAdapter(NewsDataResponseAdapter());

  // Bloc.observer = MyBlocObserver();
  FlutterNativeSplash.remove();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: const Locale("en"),
    child: ChangeNotifierProvider(
        create: (context) => MyProvider(), child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    BaseTheme theme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: theme.themeData,
      darkTheme: darkTheme.themeData,
      themeMode: provider.themeMode,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SearchScreen.routeName: (context) => const SearchScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

// POST - GET
