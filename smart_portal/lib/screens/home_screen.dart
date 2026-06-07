import 'package:flutter/material.dart';
import '../widgets/info_card.dart';
import '../widgets/project_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool _isFavorite = false;

  final List<Map<String, dynamic>> statistics = [
    {'title': 'Students', 'value': '27,000', 'icon': Icons.people, 'color': Colors.blue},
    {'title': 'Courses', 'value': '420', 'icon': Icons.book, 'color': Colors.green},
    {'title': 'Departments', 'value': '10', 'icon': Icons.business, 'color': Colors.orange},
    {'title': 'Instructors', 'value': '380', 'icon': Icons.person, 'color': Colors.purple},
    {'title': 'Laboratories', 'value': '32', 'icon': Icons.science, 'color': Colors.red},
    {'title': 'Graduation Rate', 'value': '85%', 'icon': Icons.celebration, 'color': Colors.teal},
  ];

  final List<Map<String, String>> projects = [
    {'title': 'Attendance System', 'description': 'Face recognition system to track student attendance.'},
    {'title': 'Library Mobile App', 'description': 'App for borrowing and reserving books online.'},
    {'title': 'Cafeteria Ordering', 'description': 'Mobile app to order food from campus cafeteria.'},
    {'title': 'Bus Tracking', 'description': 'GPS-based system to track university buses.'},
    {'title': 'Exam Scheduler', 'description': 'Tool to organize exam timetables for students.'},
    {'title': 'Student Clubs Portal', 'description': 'Platform to manage and join student activities.'},
    {'title': 'Lost & Found', 'description': 'App to report and find lost items on campus.'},
    {'title': 'Event Manager', 'description': 'System to register and manage university events.'},
    {'title': 'Peer Tutoring', 'description': 'Platform for students to offer and request tutoring.'},
    {'title': 'Scholarship Tracker', 'description': 'Portal to apply and monitor scholarship status.'},
  ];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Section
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('smart_portal/lib/assest/img.png'),
                backgroundColor: Colors.transparent
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Al-Aqsa University', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Smart University Portal', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red, size: 30),
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Statistics Section
          const Text('University Statistics', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
            children: statistics.map((stat) => InfoCard(
              title: stat['title'],
              value: stat['value'],
              icon: stat['icon'],
              color: stat['color'],
            )).toList(),
          ),
          const SizedBox(height: 24),

          //  Projects Section
          const Text(' Student Projects', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            itemBuilder: (context, index) => ProjectTile(
              title: projects[index]['title']!,
              description: projects[index]['description']!,
              icon: Icons.code,
            ),
          ),
        ],
      ),
    );
  }
}