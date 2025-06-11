import 'package:get/get.dart';
import 'package:sportperformance/Components/changePassword.dart';
import 'package:sportperformance/Screens/EquipmentScreen.dart';
import 'package:sportperformance/Screens/MetricScreen.dart';
import 'package:sportperformance/Screens/planning_screen.dart';
import 'package:sportperformance/Screens/planning_programming_screen.dart';
import 'package:sportperformance/Screens/VidoeTraninigScreen.dart';
import 'package:sportperformance/Screens/splashScreen.dart';
import 'package:sportperformance/screens/fms_screen.dart';
import 'package:sportperformance/screens/program_screen.dart';
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
import '../screens/GoalScreen.dart';
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
        page: () => const MainScreen(0),
      ),
      GetPage(
        name: '/splash',
        page: () => const SplashScreen(),
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
      // GetPage(
      //   name: '/workout-detail-screen',
      //   page: () {
      //     return WorkoutDetailPage();
      //   },
      // ),
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
        page: () => const PlanScree(),
      ),
      GetPage(
        name: '/plan&programing',
        page: () => const PlanningAndProgramming(),
      ),
      GetPage(
        name: "/strengthScreen",
        page: () => const StrengthScreen(),
      ),
      GetPage(
        name: "/limitationScreen",
        page: () => const LimitationScreen(),
      ),
      GetPage(
        name: "/fmsScreen",
        page: () => const FmsScreen(),
      ),
      GetPage(
        name: "/toolsScreen",
        page: () => TutorialVideos(),
      ),
      GetPage(
        name: "/tipsScreen",
        page: () => const TipsScreen(),
      ),
      GetPage(
        name: "/videoTrainingDetailsScreen",
        page: () => VideoTrainingDetailScreen(),
      ),
      GetPage(
        name: "/programListScreen",
        page: () => ProgramListScreen(),
      ),
    ];
