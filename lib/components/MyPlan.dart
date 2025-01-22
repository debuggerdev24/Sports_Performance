import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sportperformance/Models/PlannigModel.dart';
import 'package:sportperformance/Utils/color.dart';

class MyPlan extends StatelessWidget {
  final PlanningModel plan;

  const MyPlan(this.plan);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: primaryColor.withOpacity(0.2),
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: primaryColor, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${plan.planName}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${plan.startDate} - ${plan.endDate}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "${plan.description}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Wrap(
              children: [
                MyBadge("${plan.sunday}"),
                MyBadge("${plan.monday}"),
                MyBadge("${plan.tuesday}"),
                MyBadge("${plan.wednesday}"),
                MyBadge("${plan.thursday}"),
                MyBadge("${plan.friday}"),
                MyBadge("${plan.saturday}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyBadge extends StatelessWidget {
  final String title;

  const MyBadge(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
            .withOpacity(0.3),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
