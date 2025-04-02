import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseMaterialCard extends StatelessWidget {
  final CourseMaterial material;

  const CourseMaterialCard({
    super.key,
    required this.material,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const Icon(Icons.description, color: Colors.blue),
        title: Text(
          material.title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          '${material.fileType} • ${(material.fileSize / (1024 * 1024)).toStringAsFixed(1)} MB',
          style: TextStyle(color: Colors.grey[400]),
        ),
        trailing: IconButton(
          icon: Icon(
            material.isDownloaded ? Icons.check_circle : Icons.download,
            color: material.isDownloaded ? Colors.green : Colors.blue,
          ),
          onPressed: () {
            // TODO: Implement download functionality
          },
        ),
      ),
    );
  }
} 