import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportperformance/Utils/url.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/utils/global.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/main_screen_controller.dart';
import 'MainScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // //final translator = TranslatorGenerator.instance;



  final mainscreenController = Get.find<MainScreenController>();

  bool notification = true;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.offAll(MainScreen(0));
        return;
      },
      child: Scaffold(
        body: Obx(() {
          return Stack(
            children: [
              backgroundImage(context),
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          context.translator.profileTitle,
                          //translator.getString("Profile.title"),
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                      ),
                      const SizedBox(height: 25),
                      ListTile(
                        leading: mainscreenController.isLoading.value
                            ? const CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.orange,
                                child: CircularProgressIndicator(),
                              )
                            : mainscreenController.userdetailList.isNotEmpty
                                ? mainscreenController
                                            .userdetailList[0].profilePicture !=
                                        ''
                                    ? CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.orange,
                                        backgroundImage: NetworkImage(mainUrl +
                                            imageUrl +
                                            mainscreenController
                                                .userdetailList[0].profilePicture),
                                      )
                                    : const CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.orange,
                                        backgroundImage:
                                            AssetImage("assets/images/profile.jpg"),
                                      )
                                : const CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.orange,
                                    backgroundImage:
                                        AssetImage("assets/images/profile.jpg"),
                                  ),
                        title: Text(
                          mainscreenController.userdetailList.isNotEmpty
                              ? mainscreenController.userdetailList[0].name
                              : "User",
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                        trailing: InkWell(
                          onTap: () {
                            // Navigator.of(context).pushNamed(
                            //   EditProfileScreen.routeName,
                            // );
                            Get.toNamed('/edit-profile');
                          },
                          child: Image.asset(
                            "assets/images/edit.png",
                            color: Theme.of(context).primaryColorLight,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      InkWell(
                        onTap: () {
                          // Navigator.of(context).pushNamed(
                          //   EditProfileScreen.routeName,
                          // );
                          Get.toNamed('/edit-profile');
                        },
                        child: Section(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 5,
                                ),
                                child: Text(
                                  context.translator.profileAccount,
                                      //.getString("Profile.account"),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Item(
                                Icons.person_outline,
                                context.translator.profilePersonalData
                                //translator.getString("Profile.personalData"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          // Get.toNamed('/goal-screen');
                        },
                        child: Section(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 5,
                                ),
                                child: Text(
                                  context.translator.profileGoal,
                                  // translator.getString("Profile.goal"),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Item(
                                Icons.fitness_center,
                                context.translator.profileGoal,
                  
                                // translator.getString("Profile.goal"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Section(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.translator.profileCouch,
                                      // translator.getString("Profile.couch"),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.person_outline,
                                          color: Colors.cyan,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          mainscreenController
                                                  .userdetailList.isNotEmpty
                                              ? mainscreenController
                                                  .userdetailList[0].myCoach
                                              : "User",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15),
                              mainscreenController.isLoading.value
                                  ? const CircleAvatar(
                                      radius: 22,
                                      child: CircularProgressIndicator(),
                                    )
                                  : mainscreenController.userdetailList.isNotEmpty
                                      ? mainscreenController
                                                  .userdetailList[0].coachPic !=
                                              ''
                                          ? CircleAvatar(
                                              radius: 22,
                                              backgroundImage: NetworkImage(
                                                  mainUrl +
                                                      imageUrl +
                                                      mainscreenController
                                                          .userdetailList[0]
                                                          .coachPic),
                                            )
                                          : const CircleAvatar(
                                              radius: 22,
                                              backgroundImage: AssetImage(
                                                  "assets/images/avatar.png"),
                                            )
                                      : const CircleAvatar(
                                          radius: 22,
                                          backgroundImage: AssetImage(
                                              "assets/images/avatar.png"),
                                        ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Section(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 5,
                              ),
                              child: Text(
                                context.translator.profileNotification,
                                // translator.getString("Profile.notification"),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            ListTile(
                              dense: true,
                              minLeadingWidth: 20,
                              horizontalTitleGap: 15,
                              leading: const Icon(
                                Icons.notifications_outlined,
                                color: Colors.cyan,
                                size: 18,
                              ),
                              title: Text(
                                context.translator.profileNotificationSub,
                                // translator.getString("Profile.notificationSub"),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: Transform.scale(
                                scale: 0.6,
                                child: CupertinoSwitch(
                                  value: notification,
                                  onChanged: (n) async {
                                    notification = n;
                                    setState(() {});
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setBool(
                                        'notification_preference', notification);
                                  },
                                  trackColor: Colors.grey,
                                  activeColor: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Section(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 5,
                              ),
                              child: Text(
                                context.translator.profileOther,
                                // translator.getString("Profile.other"),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Item(
                              Icons.mail_outline,
                              onTap: () {
                                sendEmail('nicoaguilerag@gmail.com');
                              },
                              context.translator.profileContactUs
                              // translator.getString("Profile.contactUs"),
                            ),
                            Item(
                              Icons.verified_user_outlined,
                              context.translator.profilePrivacyPolicy,
                              // translator.getString("Profile.privacyPolicy"),
                              onTap: () {},
                            ),
                            Item(
                              Icons.settings_outlined,
                              context.translator.profileSetting,
                              // translator.getString("Profile.setting"),
                              onTap: () {
                                Get.toNamed('/setting-screen');
                                // Navigator.of(context).pushNamed(
                                //   SettingScreen.routeName,
                                // );
                              },
                            ),
                            Item(
                              Icons.logout_rounded,
                              context.translator.profileLogout,
                              // translator.getString("Profile.logout"),
                              onTap: () {
                                GetStorage().erase();
                                Get.offAllNamed('/login', arguments: [context]);
                                // Navigator.of(context).pushNamed(LoginScreen.routeName);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  void sendEmail(String recipient) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: recipient,
    );
    launchUrl(emailLaunchUri);
  }
}

class Item extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;

  const Item(this.icon, this.title, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      minLeadingWidth: 20,
      horizontalTitleGap: 15,
      leading: Icon(icon, color: Colors.cyan, size: 18),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 12,
        color: Colors.grey,
      ),
    );
  }
}

class Section extends StatelessWidget {
  final Widget child;

  const Section({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: darkMode.value ? Colors.grey.shade200 : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            offset: const Offset(0, 1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
          BoxShadow(
            color: Colors.grey.shade100,
            offset: const Offset(1, 0),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
