import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaySelection extends StatelessWidget {
  final DateTime selectedDate;
  final int day;
  final bool isWorkOutCompleted;
  final bool isContainsWorkOut;
  final Function() onTap;

  const DaySelection({
    Key? key,
    required this.selectedDate,
    required this.day,
    required this.onTap,
    required this.isWorkOutCompleted,
    required this.isContainsWorkOut,
  }) : super(key: key);

  // Enhanced color scheme
  Color _getContainerColor(BuildContext context) {
    if (selectedDate.day == day) {
      // Only show completion status if this day contains a workout AND it's completed
      if (isWorkOutCompleted) {
        return const Color(0xFF4CAF50); // Success Green
      } else if (isContainsWorkOut) {
        return const Color(0xFF2196F3); // Active Blue
      } else {
        return Colors.black;
      }
    } else {
      // Only show completion status if this day contains a workout AND it's completed
      if (isWorkOutCompleted) {
        return const Color(0xFFCCFFCE); // Light Green
      } else if (isContainsWorkOut) {
        return const Color(0xFFE3F2FD); // Light Blue
      } else {
        return const Color(0xFFF5F5F5); // Light Gray
      }
    }
  }

  Color _getTextColor(BuildContext context) {
    if (selectedDate.day == day) {
      return Colors.white;
    } else {
      // Non-selected days: black text for all states
      return Colors.black87;
    }
  }

  Color _getCircleColor(BuildContext context) {
    if (selectedDate.day == day) {
      // Make selected day circle more visible with darker background
      if (isContainsWorkOut && isWorkOutCompleted) {
        return const Color(0xFF2E7D32); // Darker Green
      } else if (isContainsWorkOut) {
        return const Color(0xFF1565C0); // Darker Blue
      } else {
        return Theme.of(context).primaryColorDark; // Darker primary color
      }
    } else {
      // Non-selected days: black circle for all states
      return Colors.black87;
    }
  }

  Color _getCircleTextColor(BuildContext context) {
    if (selectedDate.day == day && isContainsWorkOut) {
      // Selected day: white text for good contrast
      return Colors.white;
    } else if (selectedDate.day == day) {
      return Colors.black;
    } else {
      // Non-selected days: white text on black circle
      return Colors.white;
    }
  }

  // Get workout indicator
  Widget _getWorkoutIndicator() {
    if (isContainsWorkOut && isWorkOutCompleted) {
      return Container(
        margin: const EdgeInsets.only(top: 4),
        child: Icon(
          Icons.check_circle,
          size: 12,
          color:
              selectedDate.day == day ? Colors.white : const Color(0xFF4CAF50),
        ),
      );
    } else if (isContainsWorkOut) {
      return Container(
        margin: const EdgeInsets.only(top: 4),
        width: 6,
        height: 6,
        decoration: BoxDecoration(
          color:
              selectedDate.day == day ? Colors.white : const Color(0xFF2196F3),
          shape: BoxShape.circle,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime(selectedDate.year, selectedDate.month, day);
    final dayName = DateFormat('E').format(currentDate).substring(0, 3);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _getContainerColor(context),
          boxShadow: selectedDate.day == day
              ? [
                  BoxShadow(
                    color: _getContainerColor(context).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
          border: Border.all(
            color: selectedDate.day == day
                ? Colors.transparent
                : Colors.grey[500]!, // Light border for non-selected days
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dayName,
              style: TextStyle(
                fontSize: 12,
                color: _getTextColor(context),
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: _getCircleColor(context),
                  child: Text(
                    "$day",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: _getCircleTextColor(context),
                    ),
                  ),
                ),
                if (selectedDate.day == day)
                  Positioned(
                    bottom: -2,
                    child: _getWorkoutIndicator(),
                  ),
              ],
            ),
            if (selectedDate.day != day &&
                (isWorkOutCompleted || isContainsWorkOut))
              _getWorkoutIndicator(),
          ],
        ),
      ),
    );
  }
}
