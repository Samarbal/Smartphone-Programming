import 'package:flutter/material.dart';

class TechCard extends StatelessWidget {
  final String name;
  final IconData icon;

  const TechCard({Key? key, required this.name, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Theme.of(context).primaryColor),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontWeight: FontWeight.w500), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}