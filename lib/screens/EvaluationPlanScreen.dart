import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/Utils/utils.dart';
import 'package:sportperformance/Components/Plan2.dart';
import 'package:sportperformance/Components/StartPlan.dart';


import 'package:sportperformance/Screens/NotificationScreen.dart';

class EvalauationPlanScreen extends StatefulWidget {
  static const routeName = 'EvalauationPlanScreen';
  @override
  State<EvalauationPlanScreen> createState() => _EvalauationPlanScreenState();
}

class _EvalauationPlanScreenState extends State<EvalauationPlanScreen> {
  ////final translator = TranslatorGenerator.instance;



  late String title;
  List<Map<String, dynamic>> plan2 = [
    {
      "title": "Calorimetría indirecta en reposo",
      "subTitle":
          "Test realizado en reposo con medidor de gases, que permite encontrar 3 cosas fundamentales para la prescripcion de la alimentación y el ejercicio:\n\nCociente resporatorio\nMetabolismo basal\nFelxibilidad metabólica",
    },
    {
      "title": "Test de Consumo de Oxígeno",
      "subTitle":
          "Test realizado en treadmill o bicicleta, que permite encontrar 4 cosas fundamentales para la prescripcion del ejercicio aeróbico:\n\nVT 1\nVT 2\nVO2 Max\nVAM",
    },
    {
      "title": "FMS",
      "subTitle":
          "Screening funcional de moviemiento que permite determinar la capacidad de rendimiento observable de movimientos básicos, manipulativos y de estabilización.\n\nEl test incluye una prescripción de ejercicios correctivos si fuera necesario según los resultados que obtenga la persona.",
    },
    {
      "title": "Cineantropometría",
      "subTitle":
          "Evaluación de composición corporal y aplicabilidad de los resultados al objetivo personal que tengas.\nLos parametros más utilizados son:\nraccionamiento en % de 5 componentes\nSumatoria de 6 y 8pliegues\nÍndice músculo óseo \nKgs de masa muscular y masa adiposa\nSomatotipo",
    },
    {
      "title": "Test de RM Directo – Encoder Lineal",
      "subTitle":
          "Evaluación de fuerza a través de transductor de velocidad lineal o encoder.\n\nEsta evaluación te garantiza trabar la fuerza en las zonas específicas según el objetivo de entrenamiento que tengas.\n\nSe entrega una evaluación de 8 ejercicios indicadores con sus respectivos nivels de fuerza máxima.\nEl test incluye 2 reevaluaciones en un periodo de 24 semanas",
    },
  ];

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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        iconSize: 30,
        currentIndex: 1,
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
            label: tabs[index]['title'],
          ),
        ),
      ),
    );
  }
}
