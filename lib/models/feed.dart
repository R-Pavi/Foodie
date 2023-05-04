class Recipe {
  final String id;
  final String name;
  final String description;
  final String duration;
  final String thumbnailUrl;
  final String videoUrl;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.thumbnailUrl,
    required this.videoUrl,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      thumbnailUrl: json['thumbnail_url'],
      videoUrl: json['video_url'],
    );
  }
}
