import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:intl/intl.dart';

class DateRow extends StatefulWidget {
  const DateRow({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _DateRowState createState() => _DateRowState();
}

class _DateRowState extends State<DateRow> {
  List<Map<String, String>> getDatesAndDays() {
    List<Map<String, String>> datesAndDays = [];
    DateTime now = DateTime.now();

    for (int i = -2; i <= 2; i++) {
      DateTime targetDate = now.add(Duration(days: i));
      String day =
          DateFormat('E').format(targetDate); // Short form of day (e.g., Thu)
      String date = targetDate.day.toString(); // Day of the month (e.g., 17)
      datesAndDays.add({"day": day, "date": date, "position": i.toString()});
    }

    return datesAndDays;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> data = getDatesAndDays();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: data.map((str) {
        return DateBox(
            day: str["day"],
            date: str["date"],
            color: str["position"],
            bgColor: str["position"]);
      }).toList(),
    );
  }
}

class DateBox extends StatefulWidget {
  final String? day;
  final String? date;
  final String? color;
  final String? bgColor;
  const DateBox(
      {super.key,
      required this.day,
      required this.date,
      required this.color,
      required this.bgColor});
  @override
  // ignore: library_private_types_in_public_api
  _DateBoxState createState() => _DateBoxState();
}

class _DateBoxState extends State<DateBox> {
  static const primaryColor = Color(0xFF735BF2);
  static const backgroundColor = Color(0xFFFCFFFF);
  static const grayColor = Color(0xFF8F9BB3);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            smoothness: 1.0,
          ),
          color: widget.bgColor == '0' ? primaryColor : backgroundColor,
          shadows: const [
            BoxShadow(
                offset: Offset(0, -1),
                blurRadius: 25.0,
                spreadRadius: 0,
                color: Color(0x1A8F9BB3)),
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 25.0,
                spreadRadius: 0,
                color: Color(0x0D8F9BB3))
          ]),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Text(
            widget.day == null ? "" : widget.day!,
            style: TextStyle(
                fontSize: 10,
                height: 1.8,
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w500,
                color: widget.color == '0' ? backgroundColor : grayColor),
          ),
          Text(
            widget.date == null ? "" : widget.date!,
            style: TextStyle(
                fontSize: 16,
                height: 1.4,
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w600,
                color: widget.color == '0' ? backgroundColor : grayColor),
          )
        ],
      ),
    );
  }
}
