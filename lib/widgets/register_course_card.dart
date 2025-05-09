import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class RegisterCourseCard extends StatefulWidget {
  final String courseCode;
  final String courseTitle;
  final int creditValue;
  final List<String> lecturers;
  final ValueChanged<String>? onCheckboxChanged;

  const RegisterCourseCard({
    super.key,
    required this.courseCode,
    required this.courseTitle,
    required this.creditValue,
    required this.lecturers,
    this.onCheckboxChanged,
  });

  @override
  _RegisterCourseCardState createState() => _RegisterCourseCardState();
}

class _RegisterCourseCardState extends State<RegisterCourseCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF735BF2);
    const fontColor = Color(0xFF222B45);
    const backgroundColor = Color(0xFFFCFFFF);
    const grayColor = Color(0xFF8F9BB3);
    const errorColor = Color(0xFFF25B5B);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
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
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothContainer(
                smoothness: 1.0,
                borderRadius: BorderRadius.circular(8.0),
                padding: const EdgeInsets.all(8.0),
                color: const Color(0x33735BF2),
                child: Text(
                  '${widget.creditValue} Credit',
                  style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              Checkbox(
                value: isChecked,
                activeColor: primaryColor,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                  widget.onCheckboxChanged?.call(widget.courseCode);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Image.asset(
                'assets/images/course_icon.png',
                height: 48.0,
                width: 48.0,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.courseCode,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: fontColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 200.0,
                    child: Text(
                      widget.courseTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14,
                          color: fontColor,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const CircleAvatar(
                radius: 14,
                backgroundColor: grayColor,
                child: Icon(Icons.person, color: backgroundColor, size: 18),
              ),
              const SizedBox(width: 8),
              Expanded(
                  child: SizedBox(
                width: 100.0,
                child: Text(
                  widget.lecturers.join(', '),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: grayColor),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
