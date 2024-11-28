import 'package:flutter/material.dart';

class WorkoutPlan extends StatelessWidget {
  final String title;
  final String seat;

  const WorkoutPlan({
    required this.title,
    required this.seat,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              title,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
              ),
            ),
            const Expanded(child: SizedBox()),
            Text(
              "$seat Sets",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
