class Project {
  final String id;
  final String title;
  final String description;
  final String shortDescription;
  final List<String> imageUrls;
  final String appStoreUrl;
  final String playStoreUrl;
  final List<String> technologies;
  final DateTime completionDate;
  final List<String> features;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.shortDescription,
    required this.imageUrls,
    required this.appStoreUrl,
    required this.playStoreUrl,
    required this.technologies,
    required this.completionDate,
    required this.features,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      shortDescription: json['shortDescription'] as String,
      imageUrls: List<String>.from(json['imageUrls'] as List),
      appStoreUrl: json['appStoreUrl'] as String,
      playStoreUrl: json['playStoreUrl'] as String,
      technologies: List<String>.from(json['technologies'] as List),
      completionDate: DateTime.parse(json['completionDate'] as String),
      features: List<String>.from(json['features'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'shortDescription': shortDescription,
      'imageUrls': imageUrls,
      'appStoreUrl': appStoreUrl,
      'playStoreUrl': playStoreUrl,
      'technologies': technologies,
      'completionDate': completionDate.toIso8601String(),
      'features': features,
    };
  }
}
