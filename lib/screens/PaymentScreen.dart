import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sportperformance/components/planList.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/utils/global.dart';
import '../Components/DatePart.dart';
import '../Components/SelectTab.dart';
import 'MainScreen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late List categoryList;
  int selected = 0;
  late List details;

  @override
  Widget build(BuildContext context) {
    categoryList = [
      {
        "title": context.translator.isTraining,
        "id": "0",
      },
      {
        "title": context.translator.isNutrition,
        "id": "1",
      },
      {
        "title": context.translator.isEvaluations,
        "id": "2",
      }
    ];
    details = [
      {
        "duration": 1,
        "title": context.translator.monthly,
        "price": [30, 80, 150, 280],
        "discount": 0
      },
      {
        "duration": 3,
        "title": context.translator.quarterly,
        "price": [25, 70, 135, 260],
        "discount": 10
      },
      {
        "duration": 6,
        "title": context.translator.biannual,
        "price": [35, 85, 160, 300],
        "discount": 15
      },
      {
        "duration": 12,
        "title": context.translator.annual,
        "price": [35, 85, 160, 300],
        "discount": 20
      }
    ];
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.offAll(const MainScreen(0));
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 12,
          backgroundColor: Colors.transparent,
          title: Text(context.translator.payments),
        ),
        body: Stack(
          children: [
            backgroundImage(context),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(5),
                      Text(
                        context.translator.paymentOptions,
                        // context.translator.bodyCompoTitle,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            categoryList.length,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: SelectTab(
                                  title: categoryList[index]["title"],
                                  index: categoryList[index]["id"],
                                  selected: selected.toString(),
                                  onTap: () {
                                    selected = index;
                                    setState(() {});
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Column(
                        children: List.generate(
                          details.length,
                          (index) {
                            return Section(
                              title: details[index]["title"],
                              child: PlanList(
                                duration: details[index]["duration"],
                                price: details[selected]["price"][index],
                                discount: details[index]["discount"],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//todo ---------------------> 1 Month
// Section(
//   title: "Monthly",
//   child: PlanList(duration: 1, price: 30),
// ),
// //todo ---------------------> 3 Month
// Section(
//   title: "Quarterly",
//   child: PlanList(duration: 3, price: 80),
// ),
// //todo ---------------------> 6 Month
// Section(
//   title: "Biannual",
//   child: PlanList(duration: 6, price: 150),
// ),
// //todo ---------------------> 1 Year
// Section(
//   title: "Annual",
//   child: PlanList(duration: 12, price: 280),
// ),
