import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sportperformance/Utils/theme.dart';
import 'package:sportperformance/controllers/login_controller.dart';
import 'package:sportperformance/controllers/profile/setting_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sportperformance/utils/global.dart';
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
  Stripe.publishableKey = publishKey;
  await GetStorage.init();
  await Firebase.initializeApp();
  Get.put(LoginController()).updateFcmToken();
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
  late SettingController settingController;
  late Locale _locale = Locale("en");

  @override
  void initState() {
    settingController = Get.put(SettingController());
    // ever(settingController.languageCode, (code) {
    //   setState(() {
    //     _locale = Locale(code);
    //   });
    // });
    // translator.init(
    //   initCountryCode: "US",
    //   initLanguageCode: 'en',
    //   mapLocales: [
    //     MapLocale('en', AppLocale.EN, countryCode: "US"),
    //     MapLocale('es', AppLocale.ES, countryCode: "ES"),
    //   ],
    // );

    // translator.onTranslatedLanguage = _onTranslatedLanguage;
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
          locale: _locale,
          //Locale(settingController.languageCode.value),
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          supportedLocales: const [
            Locale("en"),
            Locale("es"),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: '/splash',
          defaultTransition: Transition.fadeIn,
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

//furza -> strength
//FMS -> FMS
// Limitaciones ->

// uid(client_id) = 52
// coach_id = 22