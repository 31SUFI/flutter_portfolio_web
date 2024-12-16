// lib/models/project_model.dart
class Project {
  final String title;
  final String description;
  final String githubUrl;
  final String imageUrl;

  const Project({
    required this.title,
    required this.description,
    required this.githubUrl,
    required this.imageUrl,
  });
}
