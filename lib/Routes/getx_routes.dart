import 'package:get/get.dart';
import 'package:sportperformance/Components/changePassword.dart';
import 'package:sportperformance/Screens/EquipmentScreen.dart';
import 'package:sportperformance/Screens/MetricScreen.dart';
import 'package:sportperformance/Screens/PlanListScreen.dart';
import 'package:sportperformance/Screens/splashScreen.dart';

import '../Screens/BodyCompositionScreen.dart';
import '../Screens/EditProfileScreen.dart';
import '../Screens/EntertainmentScreen.dart';
import '../Screens/GettingStartScreen.dart';
import '../Screens/GoalScreen.dart';
import '../Screens/LoginScreen.dart';
import '../Screens/MainScreen.dart';
import '../Screens/NotificationScreen.dart';
import '../Screens/SettingScreen.dart';
import '../Screens/sports_nutrition.dart';
import '../Screens/workout_detail_screen.dart';

appRoutes() => [
      GetPage(
        name: '/gettingstart',
        page: () => GettingStartScreen(),
      ),
      GetPage(
        name: '/login',
        page: () => LoginScreen(),
      ),
      GetPage(
        name: '/main-screen',
        page: () => MainScreen(),
      ),
      GetPage(
        name: '/splash',
        page: () => SplashScreen(),
      ),
      GetPage(
        name: '/edit-profile',
        page: () => EditProfileScreen(),
      ),
      GetPage(
        name: '/setting-screen',
        page: () => SettingScreen(),
      ),
      GetPage(
        name: '/change-password',
        page: () => ChangePassword(),
      ),
      GetPage(
        name: '/notification',
        page: () => NotificationScreen(),
      ),
      GetPage(
        name: '/goal-screen',
        page: () => GoalScreen(),
      ),
      GetPage(
        name: '/entertainment-screen',
        page: () => EntertainmentScreen(),
      ),
      GetPage(
        name: '/nutrition-screen',
        page: () => NutritionScreen(),
        // page: () => SportNutritionScreen(),
      ),
      GetPage(
        name: '/body-composition-screen',
        page: () => BodyCompositionScreen(),
        // page: () => SportNutritionScreen(),
      ),
      GetPage(
        name: '/workout-detail-screen',
        page: () => WorkoutDetailPage(),
      ),
      GetPage(
        name: '/plan-list-screen',
        page: () => PlanListScreen(),
      ),
      GetPage(
        name: '/equipment-screen',
        page: () => EquipmentScreen(),
      ),
      GetPage(
        name: '/metric-screen',
        page: () => MetricScreen(),
      ),
    ];
