import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportperformance/Components/ToolsInnerCategory.dart';
import 'package:sportperformance/Responsive%20Grid%20Package/responsive_grid_list.dart';
import 'package:sportperformance/Screens/VidoeTraninigDetailScreen.dart';
import 'package:sportperformance/main.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:sportperformance/Screens/NotificationScreen.dart';

class VidoeTraninigScreen extends StatefulWidget {
  static const routeName = 'VidoeTraninigScreen';
  @override
  State<VidoeTraninigScreen> createState() => _VidoeTraninigScreenState();
}

class _VidoeTraninigScreenState extends State<VidoeTraninigScreen> {
  final translator = TranslatorGenerator.instance;
  late String title;
  late String image;

  final List<Map<String, dynamic>> categories = [
    {"title": "Piernas", "icon": "assets/images/tool1.png"},
    {"title": "Pectorales", "icon": "assets/images/tool2.png"},
    {"title": "Espalda", "icon": "assets/images/tool3.png"},
    {"title": "Piernas", "icon": "assets/images/tool1.png"},
    {"title": "Pectorales", "icon": "assets/images/tool2.png"},
    {"title": "Espalda", "icon": "assets/images/tool3.png"},
    {"title": "Piernas", "icon": "assets/images/tool1.png"},
    {"title": "Pectorales", "icon": "assets/images/tool2.png"},
    {"title": "Espalda", "icon": "assets/images/tool3.png"},
  ];

  final List<Map<String, dynamic>> tabs = [
    {"title": "Main.tab1", "icon": "assets/images/home.png"},
    {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
    {"title": "Main.tab3", "icon": "assets/images/settings.png"},
    {"title": "Main.tab4", "icon": "assets/images/profile.png"},
  ];

  @override
  void didChangeDependencies() {
    Map arg = ModalRoute.of(context)!.settings.arguments as Map;
    title = arg['title'];
    image = arg['image'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(darkMode.value
                    ? "assets/images/darkBg.png"
                    : "assets/images/bgImage.PNG"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: size.width / 2.5,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/tool.png",
                          width: 30,
                          height: 30,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/images/tool.png",
                          width: 30,
                          height: 30,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              NotificationScreen.routeName,
                            );
                          },
                          child: Image.asset(
                            "assets/images/notification.png",
                            width: 25,
                            height: 25,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ResponsiveGridList(
                    shrinkWrap: true,
                    minItemWidth: size.width / 4,
                    children: List.generate(
                      categories.length,
                      (i) => ToolsInnerCategory(
                        image: categories[i]['icon'],
                        title: categories[i]['title'],
                        onTap: () async {
                          var page = await Navigator.of(context).pushNamed(
                            VidoeTraninigDetailScreen.routeName,
                            arguments: {
                              'title': title,
                              'subTitle': categories[i]['title'],
                              'image': image,
                            },
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop(page);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        iconSize: 30,
        currentIndex: 2,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Theme.of(context).primaryColorLight,
        onTap: (page) => Navigator.of(context).pop(page),
        items: List.generate(
          tabs.length,
          (index) => BottomNavigationBarItem(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            icon: ImageIcon(AssetImage(tabs[index]['icon'])),
            label: translator.getString(tabs[index]['title']),
          ),
        ),
      ),
    );
  }
}
