import 'package:flutter/material.dart';
import '../widgets/tech_card.dart';

class TechnologiesScreen extends StatelessWidget {

  TechnologiesScreen({super.key});

  final List<Map<String, dynamic>> technologies = [
    {'name': 'Flutter', 'icon': Icons.mobile_friendly},
    {'name': 'Dart', 'icon': Icons.code},
    {'name': 'Java', 'icon': Icons.coffee},
    {'name': 'Python', 'icon': Icons.terminal},
    {'name': 'Database', 'icon': Icons.storage},
    {'name': 'Web Development', 'icon': Icons.web},
    {'name': 'Networking', 'icon': Icons.router},
    {'name': 'AI', 'icon': Icons.psychology},
    {'name': 'Cybersecurity', 'icon': Icons.security},
    {'name': 'Cloud Computing', 'icon': Icons.cloud},
    {'name': 'IoT', 'icon': Icons.sensors},
    {'name': 'DevOps', 'icon': Icons.devices},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Technologies We Teach', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: technologies.length,
            itemBuilder: (context, index) {
              final tech = technologies[index];
              return TechCard(
                name: tech['name'],
                icon: tech['icon'],
              );
            },
          ),
        ],
      ),
    );
  }
}