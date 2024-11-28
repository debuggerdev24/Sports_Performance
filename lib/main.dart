import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sportperformance/Utils/Theme.dart';
import 'package:sportperformance/locale/locale.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'Routes/getx_routes.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  "High_Importance_channel",
  "Notification",
  playSound: true,
  importance: Importance.high,
  showBadge: true,
);

final AndroidFlutterLocalNotificationsPlugin notificationsPlugin =
    AndroidFlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

final darkMode = ValueNotifier<bool>(false);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final translator = TranslatorGenerator.instance;
  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  void initState() {
    translator.init(
      initCountryCode: "US",
      initLanguageCode: 'en',
      mapLocales: [
        MapLocale('en', AppLocale.EN, countryCode: "US"),
        MapLocale('es', AppLocale.ES, countryCode: "ES"),
      ],
    );
    translator.onTranslatedLanguage = _onTranslatedLanguage;
    SharedPreferences.getInstance().then((value) {
      darkMode.value = value.getBool("darkMode") ?? false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: darkMode,
      builder: (context, isDark, child) {
        return GetMaterialApp(
          title: 'Sports',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          supportedLocales: translator.supportedLocales,
          localizationsDelegates: translator.localizationsDelegates,
          initialRoute: '/splash',
          // home: '',
          defaultTransition: Transition.fade,
          getPages: appRoutes(),
          debugShowCheckedModeBanner: false,
        );
        // MaterialApp(
        //   title: 'Sport Performance',
        //   theme: lightTheme,
        //   darkTheme: darkTheme,
        //   themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
        //   supportedLocales: translator.supportedLocales,
        //   localizationsDelegates: translator.localizationsDelegates,
        //   routes: routes,
        //   home: GettingStartScreen(),
        //   debugShowCheckedModeBanner: false,
        // );
      },
    );
  }
}

// login page  //SportPerformance-main\lib\controllers\login_controller.dart