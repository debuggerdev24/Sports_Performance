import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotification {
  static final FirebaseNotification _singleton =
  FirebaseNotification._internal();
  FirebaseNotification._internal();
  factory FirebaseNotification() {
    return _singleton;
  }

  FirebaseMessaging? _firebaseMessaging;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Updated setUpFirebase with correct initialization
  void setUpFirebase(onDidReceiveLocalNotification) {
    tz.initializeTimeZones();
    _firebaseMessaging = FirebaseMessaging.instance;
    firebaseCloudMessagingListeners();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    // DarwinInitializationSettings updated without onDidReceiveLocalNotification
    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings();

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: onSelectNotification, // Updated callback
    );
    _register();
  }


  _register() async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
    !kIsWeb && Platform.isLinux
        ? null
        : await flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();

    // Check if app is launched from a notification
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      print("Going to Launch the APP");
      // final payload = notificationAppLaunchDetails?.payload ?? '';
      // print(payload);
    }
  }

  Future<String?> getToken() async {
    return await _firebaseMessaging?.getToken();
  }

  void firebaseCloudMessagingListeners() async {
    final bool receiveNotifications = await getNotificationPreference();
    if (Platform.isIOS) iOSPermission();

    _firebaseMessaging!.getToken().then((token) async {
      if (token != null) _uploadToken(token);
    });

    _firebaseMessaging?.onTokenRefresh.listen((token) async {
      _uploadToken(token);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (receiveNotifications) {
        displayNotification(message);
      }
    });
  }

  _uploadToken(String token) async {
    // Add your token upload logic here
  }

  get androidNotificationDetails => AndroidNotificationDetails(
    'your_channel_id',
    'your_channel_name',
    channelDescription: 'your_channel_description',
    playSound: true,
    icon: '@mipmap/ic_launcher',
    channelShowBadge: true,
    enableLights: true,
    importance: Importance.max,
    usesChronometer: false,
  );

  Future displayNotification(RemoteMessage message) async {
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iOSPlatformChannelSpecifics,
    );

    RemoteNotification notification = message.notification!;
    await flutterLocalNotificationsPlugin.show(
      0,
      notification.title,
      notification.body,
      platformChannelSpecifics,
      payload: notification.body,
    );
  }

  void iOSPermission() {
    // Handle iOS permissions if needed
  }

  Future<void> clearAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  // Updated to handle the payload correctly
  Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      print("Notification Payload: $payload");
      // Handle navigation or any other action based on payload
      // Example: Navigator.pushNamed(_context!, YourScreen.tag);
    }
  }

  Future<bool> getNotificationPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('notification_preference') ?? true;
  }
}



// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// import 'main.dart';
//
// class FirebaseNotification {
//   static final FirebaseNotification _singleton =
//       FirebaseNotification._internal();
//   FirebaseNotification._internal();
//   factory FirebaseNotification() {
//     return _singleton;
//   }
//   FirebaseMessaging? _firebaseMessaging;
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   void setUpFirebase(onDidReceiveLocalNotification) {
//     tz.initializeTimeZones();
//     _firebaseMessaging = FirebaseMessaging.instance;
//     firebaseCloudMessagingListeners();
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     final DarwinInitializationSettings initializationSettingsIOS =
//         IOSInitializationSettings(
//             onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: initializationSettingsAndroid,
//             iOS: initializationSettingsIOS);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//     _register();
//   }
//
//   _register() async {
//     final NotificationAppLaunchDetails? notificationAppLaunchDetails =
//         !kIsWeb && Platform.isLinux
//             ? null
//             : await flutterLocalNotificationsPlugin
//                 .getNotificationAppLaunchDetails();
//     if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
//       print("Going to Launch the APP");
//       print(notificationAppLaunchDetails?.payload ?? '');
//     }
//   }
//
//   Future<String?> getToken() async {
//     return await _firebaseMessaging?.getToken();
//   }
//
//   void firebaseCloudMessagingListeners() async {
//     final bool receiveNotifications = await getNotificationPreference();
//     if (Platform.isIOS) iOSPermission();
//
//     _firebaseMessaging!.getToken().then((token) async {
//       if (token != null) _uploadToken(token);
//     });
//
//     _firebaseMessaging?.onTokenRefresh.listen((token) async {
//       _uploadToken(token);
//     });
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       if (receiveNotifications) {
//         displayNotification(message);
//       }
//     });
//   }
//
//   _uploadToken(String token) async {}
//
//   get androidNotificationDetails => AndroidNotificationDetails(
//         channel.id,
//         channel.name,
//         channelDescription: channel.description,
//         playSound: true,
//         icon: "@mipmap/ic_launcher",
//         channelShowBadge: true,
//         enableLights: true,
//         importance: Importance.max,
//         usesChronometer: false,
//       );
//
//   Future displayNotification(RemoteMessage message) async {
//     var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: iOSPlatformChannelSpecifics,
//     );
//
//     RemoteNotification notification = message.notification!;
//
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       notification.title,
//       notification.body,
//       platformChannelSpecifics,
//       payload: notification.body,
//     );
//   }
//
//   void iOSPermission() {}
//
//   Future<void> clearAllNotifications() async {
//     await flutterLocalNotificationsPlugin.cancelAll();
//   }
//
//   Future onSelectNotification(String? payload) async {
//     if (payload != null) {
//       // Navigator.pushNamed(_context!, WASplashScreen.tag);
//     }
//   }
//
//   Future<bool> getNotificationPreference() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool('notification_preference') ?? true;
//   }
// }
