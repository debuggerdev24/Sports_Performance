import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/Utils/utils.dart';
import 'package:sportperformance/Components/Plan2.dart';
import 'package:sportperformance/Components/StartPlan.dart';


import 'package:sportperformance/Screens/NotificationScreen.dart';
import 'package:sportperformance/utils/global.dart';

class NutritionPlanScreen extends StatefulWidget {
  static const routeName = 'NutritionPlanScreen';
  @override
  State<NutritionPlanScreen> createState() => _NutritionPlanScreenState();
}

class _NutritionPlanScreenState extends State<NutritionPlanScreen> {
  //final translator = TranslatorGenerator.instance;

  late String title;
  List<Map<String, dynamic>> plan2 = [
    {
      "title": "Asesoría nutricional",
      "subTitle":
          "Entrevista y anamnesis nutricional vía zoom con un o una nutricionista deportivo.\nLa finalidad de esta asesoría es entregarte orientación básica de organización de tu alimentación para conseguir los resultados deportivos esperados.",
    },
    {
      "title": "Entrevista y dieta",
      "subTitle":
          "Entrevista y anamnesis nutricional vía zoom con un o una nutricionista deportivo.\nLuego de la entrevista se te prescribirá una pauta de alimentación, específica acorde a tus necesidades",
    },
    {
      "title": "Coaching nutricional",
      "subTitle":
          "Reunión semanal vía zoom con tu coach de nutrición.\nResolverás dudas, inquietudes y junto a el o ella lograrás encontrar la alimentación que más se acomode a tu estilo de vida.",
    },
  ];

  // final List<Map<String, dynamic>> tabs = [
  //   {"title": "Main.tab1", "icon": "assets/images/home.png"},
  //   {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
  //   {"title": "Main.tab3", "icon": "assets/images/settings.png"},
  //   {"title": "Main.tab4", "icon": "assets/images/profile.png"},
  // ];
  late List<Map<String, dynamic>> tabs;

  @override
  void didChangeDependencies() {
    title = ModalRoute.of(context)!.settings.arguments.toString();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    tabs = [
      {"title": context.translator.mainTab1, "icon": "assets/images/home.png"},
      // {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
      {"title":  context.translator.mainTab3, "icon": "assets/images/settings.png"},
      {"title": context.translator.mainTab4, "icon": "assets/images/profile.png"},
    ];
    var size = MediaQuery.of(context).size;
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
                const SizedBox(height: 25),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider(
                          items: plan2
                              .map(
                                (item) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                      "assets/images/banner2.png",
                                      width: size.width,
                                      height: size.height / 6,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            height: size.height / 6,
                            viewportFraction: 1,
                            autoPlay: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, -15, 0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: plan2.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, i) => Plan2(
                              title: plan2[i]['title'],
                              isVip: false,
                              selected: "",
                              onTap: () {
                                Utils.showMyBottomSheet(
                                  context,
                                  StartPlan(
                                    title: plan2[i]['title'],
                                    subTitle: plan2[i]['subTitle'],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(tabs: tabs),
    );
  }
}
//BottomNavigationBar(
//         elevation: 0,
//         iconSize: 30,
//         selectedFontSize: 10,
//         unselectedFontSize: 10,
//         showUnselectedLabels: true,
//         unselectedItemColor: Colors.grey,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         selectedItemColor: Theme.of(context).primaryColorLight,
//         onTap: (page) => Navigator.of(context).pop(page),
//         items: List.generate(
//           tabs.length,
//           (index) => BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             icon: ImageIcon(AssetImage(tabs[index]['icon'])),
//             label: tabs[index]['title'],
//           ),
//         ),
//       ),