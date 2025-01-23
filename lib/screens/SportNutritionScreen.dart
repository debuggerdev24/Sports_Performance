import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportperformance/Components/MyCell.dart';
import 'package:sportperformance/Components/MyHeader.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/Screens/NotificationScreen.dart';
import 'package:sportperformance/utils/global.dart';

class SportNutritionScreen extends StatefulWidget {
  static const routeName = "SportNutritionScreen";
  @override
  State<SportNutritionScreen> createState() => _SportNutritionScreenState();
}

class _SportNutritionScreenState extends State<SportNutritionScreen> {
  // //final translator = TranslatorGenerator.instance;



  // final List<Map<String, dynamic>> tabs = [
  //   {"title": "Main.tab1", "icon": "assets/images/home.png"},
  //   {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
  //   {"title": "Main.tab3", "icon": "assets/images/settings.png"},
  //   {"title": "Main.tab4", "icon": "assets/images/profile.png"},
  // ];
  late List<Map<String, dynamic>> tabs;

  final List<Map<String, dynamic>> data = [
    {
      'type': 'Desayuno',
      'hour': '07:00',
      'prot': '26',
      'cho': '73',
      'fat': '12',
    },
    {
      'type': 'Merienda',
      'hour': '09:30',
      'prot': '13',
      'cho': '36',
      'fat': '6',
    },
    {
      'type': 'Post entto',
      'hour': '12:00',
      'prot': '26',
      'cho': '73',
      'fat': '12',
    },
    {
      'type': 'Almuerzo',
      'hour': '14:30',
      'prot': '26',
      'cho': '73',
      'fat': '12',
    },
    {
      'type': 'Once',
      'hour': '19:00',
      'prot': '20',
      'cho': '55',
      'fat': '9',
    },
    {
      'type': 'Cena',
      'hour': '21:00',
      'prot': '20',
      'cho': '55',
      'fat': '9',
    },
  ];

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
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Image.asset(
                //       "assets/images/logo.png",
                //       width: size.width / 2.5,
                //       height: 60,
                //       fit: BoxFit.fill,
                //     ),
                //     Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Image.asset(
                //           "assets/images/tool.png",
                //           width: 30,
                //           height: 30,
                //           fit: BoxFit.fill,
                //         ),
                //         const SizedBox(width: 10),
                //         Image.asset(
                //           "assets/images/tool.png",
                //           width: 30,
                //           height: 30,
                //           fit: BoxFit.fill,
                //         ),
                //         const SizedBox(width: 10),
                //         InkWell(
                //           onTap: () {
                //             Navigator.of(context).pushNamed(
                //               NotificationScreen.routeName,
                //             );
                //           },
                //           child: Image.asset(
                //             "assets/images/notification.png",
                //             width: 25,
                //             height: 25,
                //             fit: BoxFit.fill,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                MyAppBar(),
                const SizedBox(height: 25),
                Text(
                  context.translator.sportNutritionTitle,
                  // translator.getString("SportNutrition.title"),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: size.width,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.green.shade700,
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      context.translator.sportNutritionTableTitle,
                      // translator.getString("SportNutrition.tableTitle"),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        showCheckboxColumn: false,
                        border: TableBorder.all(
                          color: darkMode.value ? Colors.white : Colors.black,
                        ),
                        columns: [
                          DataColumn(label: MyHeader(context.translator.sportNutritionHeader1)),
                          DataColumn(label: MyHeader(context.translator.sportNutritionHeader2)),
                          DataColumn(label: MyHeader(context.translator.sportNutritionHeader3)),
                          DataColumn(label: MyHeader(context.translator.sportNutritionHeader4)),
                          DataColumn(label: MyHeader(context.translator.sportNutritionHeader5)),
                        ],
                        rows: List.generate(
                          data.length,
                          (i) => DataRow(
                            cells: [
                              DataCell(MyCell(data[i]['type'])),
                              DataCell(MyCell(data[i]['hour'])),
                              DataCell(MyCell(data[i]['prot'])),
                              DataCell(MyCell(data[i]['cho'])),
                              DataCell(MyCell(data[i]['fat'])),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(tabs: tabs)
    );
  }
}
//BottomNavigationBar(
//         elevation: 0,
//         selectedFontSize: 10,
//         unselectedFontSize: 10,
//         showUnselectedLabels: true,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         iconSize: 30,
//         selectedItemColor: Theme.of(context).primaryColorLight,
//         unselectedItemColor: Colors.grey,
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