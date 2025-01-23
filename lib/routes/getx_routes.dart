import 'package:get/get.dart';
import 'package:sportperformance/Components/changePassword.dart';
import 'package:sportperformance/Screens/EquipmentScreen.dart';
import 'package:sportperformance/Screens/MetricScreen.dart';
import 'package:sportperformance/Screens/PlanListScreen.dart';
import 'package:sportperformance/Screens/planning_programming_screen.dart';
import 'package:sportperformance/Screens/VidoeTraninigScreen.dart';
import 'package:sportperformance/Screens/splashScreen.dart';
import 'package:sportperformance/screens/fms_screen.dart';
import 'package:sportperformance/screens/tips.dart';
import '../Screens/AudioBookScreen.dart';
import '../Screens/BodyCompositionScreen.dart';
import '../Screens/EditProfileScreen.dart';
import '../Screens/GettingStartScreen.dart';
import '../Screens/indicator_screen.dart';
import '../Screens/LoginScreen.dart';
import '../Screens/MainScreen.dart';
import '../Screens/NotificationScreen.dart';
import '../Screens/SettingScreen.dart';
import '../Screens/YoutuebChannelScreen.dart';
import '../Screens/sports_nutrition.dart';
import '../Screens/workout_detail_screen.dart';
import '../screens/TrainingScreen.dart';
import '../screens/VidoeTraninigDetailScreen.dart';
import '../screens/limitation_screen.dart';
import '../screens/strength_screen.dart';
import '../screens/tutorial_videos.dart';

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
        page: () => MainScreen(0),
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
      // GetPage(
      //   name: '/goal-screen',
      //   page: () => GoalScreen(),
      // ),
      GetPage(
        name: '/trainingScreen',
        page: () => TrainingScreen(),
      ),
      GetPage(
        name: '/nutrition-screen',
        page: () => NutritionScreen(),
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
      GetPage(
        name: '/vidoe-traninig-screen',
        page: () => VidoeTraninigScreen(),
      ),
      GetPage(
        name: '/youtube-channel-screen',
        page: () => YoutubeChannelScreen(),
      ),
      GetPage(
        name: '/audio-book-screen',
        page: () => AudioBookScreen(),
      ),
      GetPage(
        name: '/indicator',
        page: () => PlanScree(),
      ),
      GetPage(
        name: '/plan&programing',
        page: () => PlanningAndProgramming(),
      ),
      GetPage(
        name: "/strengthScreen",
        page: () => StrengthScreen(),
      ),
      GetPage(
        name: "/limitationScreen",
        page: () => LimitationScreen(),
      ),
      GetPage(
        name: "/fmsScreen",
        page: () => FmsScreen(),
      ),
      GetPage(
        name: "/toolsScreen",
        page: () => TutorialVideos(),
      ),
      GetPage(
        name: "/tipsScreen",
        page: () => TipsScreen(),
      ),
      GetPage(
        name: "/videoTrainingDetailsScreen",
        page: () => VideoTrainingDetailScreen(),
      ),
    ];
