import 'package:flutter/material.dart';
import 'package:sportperformance/Screens/AudioBookScreen.dart';
import 'package:sportperformance/Screens/BodyCompositionScreen.dart';
import 'package:sportperformance/Screens/EditProfileScreen.dart';
import 'package:sportperformance/Screens/EntertainmentPlanScreen.dart';
import 'package:sportperformance/Screens/EvaluationPlanScreen.dart';
import 'package:sportperformance/Screens/LoginScreen.dart';
import 'package:sportperformance/Screens/MainScreen.dart';
import 'package:sportperformance/Screens/NotificationScreen.dart';
import 'package:sportperformance/Screens/NutritionPlanScreen.dart';
import 'package:sportperformance/Screens/SettingScreen.dart';
import 'package:sportperformance/Screens/SportNutritionScreen.dart';
import 'package:sportperformance/Screens/VidoeTraninigDetailScreen.dart';
import 'package:sportperformance/Screens/VidoeTraninigScreen.dart';
import 'package:sportperformance/Screens/YoutuebChannelScreen.dart';

import '../screens/TrainingScreen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginScreen.routeName: (_) => LoginScreen(),
  MainScreen.routeName: (_) => MainScreen(0),
  SettingScreen.routeName: (_) => SettingScreen(),
  NotificationScreen.routeName: (_) => NotificationScreen(),
  TrainingScreen.routeName: (_) => TrainingScreen(),
  EditProfileScreen.routeName: (_) => EditProfileScreen(),
  SportNutritionScreen.routeName: (_) => SportNutritionScreen(),
  BodyCompositionScreen.routeName: (_) => BodyCompositionScreen(),
  EntertainmentPlanScreen.routeName: (_) => EntertainmentPlanScreen(),
  NutritionPlanScreen.routeName: (_) => NutritionPlanScreen(),
  EvalauationPlanScreen.routeName: (_) => EvalauationPlanScreen(),
  VidoeTraninigScreen.routeName: (_) => VidoeTraninigScreen(),
  VideoTrainingDetailScreen.routeName: (_) => VideoTrainingDetailScreen(),
  AudioBookScreen.routeName: (_) => AudioBookScreen(),
  YoutubeChannelScreen.routeName: (_) => YoutubeChannelScreen(),
};
