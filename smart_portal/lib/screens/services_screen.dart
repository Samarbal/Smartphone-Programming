import 'package:flutter/material.dart';
import '../widgets/service_card.dart';


class ServicesScreen extends StatelessWidget {

  ServicesScreen({super.key});

  final List<Map<String, dynamic>> services = [
    {'icon': Icons.app_registration, 'title': 'Registration', 'desc': 'Register for courses online'},
    {'icon': Icons.people, 'title': 'Advising', 'desc': 'Academic advising support'},
    {'icon': Icons.computer, 'title': 'E-Learning', 'desc': 'Access online materials'},
    {'icon': Icons.local_library, 'title': 'Library', 'desc': 'Digital library resources'},
    {'icon': Icons.quiz, 'title': 'Exams', 'desc': 'Exam schedules & results'},
    {'icon': Icons.attach_money, 'title': 'Scholarships', 'desc': 'Apply for financial aid'},
    {'icon': Icons.quiz, 'title': 'Certificates', 'desc': 'Request official documents'},
    {'icon': Icons.feedback, 'title': 'Complaints', 'desc': 'Submit feedback or complaints'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Academic Services', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) => ServiceCard(
              icon: services[index]['icon'],
              title: services[index]['title'],
              description: services[index]['desc'],
              onAction: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Opening ${services[index]['title']}'))),
            ),
          ),
        ],
      ),
    );
  }
}