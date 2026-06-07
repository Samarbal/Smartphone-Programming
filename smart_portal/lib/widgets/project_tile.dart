import 'package:flutter/material.dart';

class ProjectTile extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const ProjectTile({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Viewing $title'))),
      ),
    );
  }
}