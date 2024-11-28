import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/StartPlan.dart';
import 'package:sportperformance/Screens/EntertainmentPlanScreen.dart';
import 'package:sportperformance/Screens/EvaluationPlanScreen.dart';
import 'package:sportperformance/Screens/NutritionPlanScreen.dart';
import 'package:sportperformance/Utils/Color.dart';
import 'package:sportperformance/Utils/Utils.dart';
import 'package:sportperformance/Utils/url.dart';
import 'package:sportperformance/controllers/home/homeTab_controller.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/Components/Plan1.dart';
import 'package:sportperformance/Components/Plan2.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:sportperformance/Screens/NotificationScreen.dart';
import 'package:sportperformance/Responsive%20Grid%20Package/responsive_grid_list.dart';
import 'package:url_launcher/url_launcher.dart';

class PlanScree extends StatefulWidget {
  final Function(int page) changeTab;

  const PlanScree(this.changeTab);
  @override
  State<PlanScree> createState() => _PlanScreeState();
}

class _PlanScreeState extends State<PlanScree> {
  final homeController = Get.put(HomeScreenController());
  final translator = TranslatorGenerator.instance;
  String selectedPlan1 = "";
  int currentPage = 0;
  changeTab(int page) {
    currentPage = page;
    setState(() {});
  }

  List<Map<String, dynamic>> items = [
    {'image': 'assets/images/plan.jpeg', 'title': 'Plan.item1'},
    {'image': 'assets/images/metric.jpg', 'title': 'Plan.item2'},
    {'image': 'assets/images/equipment.jpg', 'title': 'Plan.item3'},
  ];

  String selectedPlan2 = "Plam 6 Meses";
  List plan2 = [
    "Plan 3 Meses",
    "Plam 6 Meses",
    "Plan Deportes",
    "Plan Alto Rendimiento",
  ];

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
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed('/entertainment-screen');
                              },
                              child: Image.asset(
                                "assets/images/tool.png",
                                width: 30,
                                height: 30,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> PlanScree(changeTab),));
                              },
                              child: Image.asset(
                                "assets/images/tool.png",
                                width: 30,
                                height: 30,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Get.toNamed('/notification');
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
                        InkWell(
                          onTap: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=> PlanScree(changeTab),));
                            //Get.toNamed('/goal-screen');
                          },
                          child: Text(
                            translator.getString("Plan.title2"),
                            //'Pagos',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 14,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        )
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
                          items: homeController.bannerList
                              .map(
                                (item) => InkWell(
                                  onTap: () async {
                                    if (await canLaunch(item.bannerUrl)) {
                                      await launch(item.bannerUrl);
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        mainUrl + bannerUrl + item.bannerImage,
                                        width: size.width,
                                        height: size.height / 6,
                                        fit: BoxFit.cover,
                                      ),
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
                          translator.getString("Plan.title2"),
                          //translator.getString("Plan.title1"),
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const SizedBox(height: 25),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 13,
                            children: List.generate(
                              items.length,
                              (i) => Plan1(
                                name: translator.getString(items[i]['title']),
                                image: items[i]['image'],
                                selected:
                                    translator.getString(items[1]['title']),
                                onTap: () async {
                                  if (i == 0) {
                                    var page =
                                        await Get.toNamed('/plan-list-screen');
                                    widget.changeTab(page as int);
                                  } else if (i == 1) {
                                    var page =
                                        await Get.toNamed('/metric-screen');
                                    widget.changeTab(page as int);
                                  } else if (i == 2) {
                                    var page =
                                        await Get.toNamed('/equipment-screen');
                                    widget.changeTab(page as int);
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(height: 25),
                        // Text(
                        //   translator.getString("Plan.title2"),
                        //   textAlign: TextAlign.center,
                        //   style:
                        //       Theme.of(context).textTheme.bodyLarge!.copyWith(
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.w600,
                        //           ),
                        // ),
                        // Container(
                        //   transform: Matrix4.translationValues(0, -15, 0),
                        //   child: ResponsiveGridList(
                        //     shrinkWrap: true,
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     minItemWidth: size.width / 2.5,
                        //     children: List.generate(
                        //       plan2.length,
                        //       (i) => Plan2(
                        //         title: plan2[i],
                        //         isVip: i == 1 ? true : false,
                        //         selected: selectedPlan2,
                        //         onTap: () {
                        //           selectedPlan2 = plan2[i];
                        //           setState(() {});
                        //           Utils.showMyBottomSheet(
                        //             context,
                        //             StartPlan(
                        //               title: plan2[i],
                        //               subTitle:
                        //                   'Este plan de asesoría incluye\n\n- Sesión de evaluación presencial y anamnesis\n- Una periodización de fuerza por 12 semanas\n- Videos demostrativos de cada ejercicio\n- Plan de alimentación personalizado',
                        //             ),
                        //           );
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
