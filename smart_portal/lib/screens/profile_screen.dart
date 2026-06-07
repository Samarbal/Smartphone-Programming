import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {

  ProfileScreen({super.key});
  final List<String> skills = ['Data Analyst', 'Excel', 'Python', 'Database', 'Problem Solving', 'Teamwork'];
  final List<String> certificates = ['Data Analyst Certificate', 'AI Fundamentals', 'Data Science with Python'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Personal image
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('lib/assest/SamarBal.jpg'),
            backgroundColor: Colors.grey.shade200,
          ),
          const SizedBox(height: 12),
          const Text('Samar Bal', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text('Computer Engineering', style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 12),
          const Text(
            'Passionate data analyst and AI enthusiast. Leading multiple student projects and Hackathons .',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 20),
          // Skills chips
          const Align(alignment: Alignment.centerLeft, child: Text('Skills', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) => Chip(label: Text(skill), backgroundColor: Colors.blue.shade100)).toList(),
          ),
          const SizedBox(height: 20),
          // Certificates
          const Align(alignment: Alignment.centerLeft, child: Text('Certificates', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          const SizedBox(height: 8),
          ...certificates.map((cert) => ListTile(leading: const Icon(Icons.verified), title: Text(cert))),
          const SizedBox(height: 24),
          // Contact Section
          const Text(' Contact', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(icon: Icons.email, label: 'Email', onPressed: () => _showSnackbar(context, 'Email')),
              CustomButton(icon: Icons.phone, label: 'Phone', onPressed: () => _showSnackbar(context, 'Phone')),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(icon: Icons.language, label: 'Website', onPressed: () => _showSnackbar(context, 'Website')),
              CustomButton(icon: Icons.download, label: 'Download CV', onPressed: () => _showSnackbar(context, 'CV Downloaded'), color: Colors.green),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$message action simulated')));
  }
}