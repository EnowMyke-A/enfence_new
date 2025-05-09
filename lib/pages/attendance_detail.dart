import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  // Placeholder for dynamic data
  Map<String, dynamic> courseData = {};
  Map<String, dynamic> studentData = {};
  List<Map<String, dynamic>> attendanceData = [];

  @override
  void initState() {
    super.initState();
    // Simulate fetching data (replace with your actual API call)
    _fetchData();
  }

  Future<void> _fetchData() async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      courseData = {
        'code': 'ENG101',
        'name': 'Use of English I',
      };
      studentData = {
        'name': 'Oliver Twist',
        'id': 'FE21A183',
        'semester': '',
        'attendanceRate': 80,
        'presentDays': 4,
        'absentDays': 1,
      };
      attendanceData = [
        {
          'date': 'Wednesday, Feb 26, 2025',
          'time': '09:00 AM-10:30 AM',
          'room': 'FET Hall 1',
          'status': 'Present',
        },
        {
          'date': 'Wednesday, Feb 19, 2025',
          'time': '09:00 AM-10:30 AM',
          'room': 'FET Hall 1',
          'status': 'Present',
        },
        {
          'date': 'Wednesday, Feb 12, 2025',
          'time': '09:00 AM-10:30 AM',
          'room': 'FET Hall 1',
          'status': 'Absent',
        },
        {
          'date': 'Wednesday, Feb 5, 2025',
          'time': '09:00 AM-10:30 AM',
          'room': 'FET Hall 1',
          'status': 'Present',
        },
        {
          'date': 'Wednesday, Jan 29, 2025',
          'time': '09:00 AM-10:30 AM',
          'room': 'FET Hall 1',
          'status': 'Present',
        },
      ];
    });
  }

  Future<pw.Document> _generatePdf() async {
    final pdf = pw.Document();

    // Load the logo image
    final ByteData imageData =
        await rootBundle.load('assets/images/enfence_v1.png');
    final Uint8List imageBytes = imageData.buffer.asUint8List();
    final pw.MemoryImage logoImage = pw.MemoryImage(imageBytes);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Stack(
            children: [
              // Main content
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Course Information',
                      style: pw.TextStyle(
                          fontSize: 20, fontWeight: pw.FontWeight.bold)),
                  pw.Text('Course Name: ${courseData['name'] ?? ''}'),
                  pw.Text('Course Code: ${courseData['code'] ?? ''}'),
                  pw.SizedBox(height: 20),
                  pw.Text('Student Information',
                      style: pw.TextStyle(
                          fontSize: 20, fontWeight: pw.FontWeight.bold)),
                  pw.Text('Name: ${studentData['name'] ?? ''}'),
                  pw.Text('ID: ${studentData['id'] ?? ''}'),
                  pw.SizedBox(height: 20),
                  pw.Text('Attendance Record',
                      style: pw.TextStyle(
                          fontSize: 20, fontWeight: pw.FontWeight.bold)),
                  pw.Table.fromTextArray(
                    context: context,
                    data: <List<String>>[
                      <String>['Date', 'Time', 'Room', 'Status'],
                      ...attendanceData.map((item) => [
                            item['date'] ?? '',
                            item['time'] ?? '',
                            item['room'] ?? '',
                            item['status'] ?? '',
                          ])
                    ],
                  ),
                ],
              ),

              // Watermark
              pw.Positioned(
                bottom: 100,
                left: 100,
                child: pw.Opacity(
                  opacity: 0.3,
                  child: pw.Transform.rotate(
                    angle: 0.5,
                    child: pw.Image(logoImage, width: 300),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
    return pdf;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    const primaryColor = Color(0xFF735BF2);
    const fontColor = Color(0xFF222B45);
    const backgroundColor = Color(0xFFFCFFFF);
    const grayColor = Color(0xFF8F9BB3);
    const errorColor = Color(0xFFF25B5B);

    return Scaffold(
      backgroundColor: backgroundColor, // Set background color
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              courseData['name'] ?? '',
              style: const TextStyle(
                  color: backgroundColor, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text('Course Code: ${courseData['code'] ?? ''}',
                style: const TextStyle(
                  fontSize: 14,
                  color: backgroundColor,
                )),
          ],
        ),
        backgroundColor: primaryColor,
        toolbarHeight: 100.0,
        iconTheme: const IconThemeData(color: backgroundColor), // Add this line
      ),
      body: courseData.isEmpty // Show loading indicator while fetching data
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              // Added for scrollability
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Student Info
                  Text(studentData['name'] ?? '',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: fontColor)),
                  Text(
                      'ID: ${studentData['id'] ?? ''} | ${studentData['semester'] ?? ''}',
                      style: const TextStyle(fontSize: 16, color: fontColor)),
                  const SizedBox(height: 20),

                  // Attendance Summary
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildAttendanceSummary('Attendance Rate',
                          '${studentData['attendanceRate']}%'),
                      _buildAttendanceSummary(
                          'Present', '${studentData['presentDays']}'),
                      _buildAttendanceSummary(
                          'Absent', '${studentData['absentDays']}'),
                    ],
                  ),
                  const SizedBox(height: 64),

                  // Attendance List
                  const Text('Attendance Record',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: fontColor)), // Corrected label
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true, // Important for nested scrolling
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable scrolling of ListView
                    itemCount: attendanceData.length,
                    itemBuilder: (context, index) {
                      final attendance = attendanceData[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: _buildAttendanceCard(attendance),
                      );
                    },
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomAppBar(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: SmoothContainer(
            borderRadius: BorderRadius.circular(12.0),
            smoothness: 1.0,
            color: const Color(0xFF735BF2),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0.0,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0))),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Download PDF",
                    style: TextStyle(
                        color: backgroundColor,
                        fontFamily: "Satoshi",
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(title: const Text('Attendance Report')),
                      body: PdfPreview(
                        build: (format) =>
                            _generatePdf().then((pdf) => pdf.save()),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAttendanceSummary(String label, String value) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF222B45))),
        Text(label,
            style: const TextStyle(fontSize: 16, color: Color(0xFF222B45))),
      ],
    );
  }

  Widget _buildAttendanceCard(Map<String, dynamic> attendance) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      decoration: ShapeDecoration(
        color: const Color(0xFFFCFFFF),
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          smoothness: 1.0,
        ),
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
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(attendance['date'] ?? '',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF222B45))),
          const SizedBox(
            height: 16.0,
          ),
          Text(attendance['time'] ?? '',
              style: const TextStyle(color: Color(0xFF222B45))),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16),
                  Text(attendance['room'] ?? '',
                      style: const TextStyle(color: Color(0xFF222B45))),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: attendance['status'] == 'Present'
                      ? Colors.green.withOpacity(0.1)
                      : Colors.red.withOpacity(0.1),
                ),
                child: Text(attendance['status'] ?? '',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: attendance['status'] == 'Present'
                            ? Colors.green
                            : Colors.red)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
