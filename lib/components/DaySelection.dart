import 'package:flutter/material.dart';

class DaySelection extends StatelessWidget {
  final DateTime selectedDate;
  final int day;
  final Function() onTap;

  const DaySelection({
    required this.selectedDate,
    required this.day,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selectedDate.day == day
              ? Theme.of(context).primaryColorLight
              : Theme.of(context).disabledColor,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          children: [
            Text(
              DateTime(selectedDate.year, selectedDate.month, day).weekday ==
                      DateTime.saturday
                  ? "Sat"
                  : DateTime(selectedDate.year, selectedDate.month, day)
                              .weekday ==
                          DateTime.sunday
                      ? "Sun"
                      : DateTime(selectedDate.year, selectedDate.month, day)
                                  .weekday ==
                              DateTime.monday
                          ? "Mon"
                          : DateTime(selectedDate.year, selectedDate.month, day)
                                      .weekday ==
                                  DateTime.tuesday
                              ? "Tue"
                              : DateTime(selectedDate.year, selectedDate.month,
                                              day)
                                          .weekday ==
                                      DateTime.wednesday
                                  ? "Wed"
                                  : DateTime(selectedDate.year,
                                                  selectedDate.month, day)
                                              .weekday ==
                                          DateTime.thursday
                                      ? "Thu"
                                      : DateTime(selectedDate.year,
                                                      selectedDate.month, day)
                                                  .weekday ==
                                              DateTime.friday
                                          ? "Fri"
                                          : "",
              style: TextStyle(
                fontSize: 13,
                color: selectedDate.day == day
                    ? Theme.of(context).primaryColorDark
                    : Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 15,
              backgroundColor: Theme.of(context).primaryColorDark,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "$day",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
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
