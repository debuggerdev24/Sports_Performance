import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sportperformance/controllers/profile/setting_controller.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportperformance/Components/MySwitchButton.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = "SettingScreen";

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  bool isDark = darkMode.value;
  final settingController = Get.put(SettingController());

  changeThemeMode(bool value) {
    isDark = value;
    darkMode.value = value;
    SharedPreferences.getInstance().then((v) {
      v.setBool("darkMode", value);
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(isDark
                    ? "assets/images/darkBg.png"
                    : "assets/images/bgImage.PNG"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        CupertinoIcons.back,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          context.translator.settingTitle,
                          // translator.getString("Setting.title"),
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
                const SizedBox(height: 25),
                SettingItem(
                  icon: Icons.lock_outline,
                  title: context.translator.settingChangePass,
                  //translator.getString("Setting.changePass"),
                  onTap: () {
                    Get.toNamed(
                      '/change-password',
                    );
                    // Utils.showMyDialog(context, ChangePassword());
                  },
                ),
                SettingItem(
                  icon: CupertinoIcons.moon,
                  title: context.translator.settingDarkMode,
                  //translator.getString("Setting.darkMode"),
                  trailing: MySwitchButton(isDark, changeThemeMode),
                ),
                SettingItem(
                  icon: Icons.language,
                  title: context.translator.settingLanguage,
                  //translator.getString("Setting.language"),
                  trailing: PopupMenuButton(
                    onSelected: (lang) {
                      if (lang == "English") {
                        settingController.changeLanguage("en");
                        // translator.translate("en", save: true);
                      } else {
                        settingController.changeLanguage("es");
                        // translator.translate("es", save: true);
                      }
                    },
                    child: Text(
                      // translator.currentLocale!.languageCode == "en"
                      //     ? "English"
                      //     : "Español",
                      settingController.languageCode == "en"
                          ? "English"
                          : "Español",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    itemBuilder: (ctx) => [
                      PopupMenuItem(
                        value: "English",
                        child: Text(
                          "English",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      PopupMenuItem(
                        value: "Spanish",
                        child: Text(
                          "Español",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  "${context.translator.settingVersion} 1.0.0",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Function()? onTap;
  final Widget? trailing;

  const SettingItem({
    this.icon,
    this.trailing,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: ListTile(
        dense: true,
        minLeadingWidth: 30,
        horizontalTitleGap: 4,
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
        leading: Icon(
          icon,
          color: Theme.of(context).iconTheme.color,
          size: 20,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
        ),
        trailing: trailing,
      ),
    );
  }
}
