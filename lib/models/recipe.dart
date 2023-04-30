class Recipe {
  final String name;
  final String thumbnail_url;
  final String user_ratings;
  final String cook_time_minutes;
  final String description;
  final String videoUrl;

  Recipe({
    required this.name,
    required this.thumbnail_url,
    required this.cook_time_minutes,
    required this.description,
    required this.user_ratings,
    required this.videoUrl
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        thumbnail_url: json['thumbnail_url'][0]['hostedLargeUrl'] as String,
        user_ratings: json['user_ratings'] as String,
        cook_time_minutes: json['cook_time_minutes'].toString(),
        description: json['description'] != null ? json['description'] : " ",
    videoUrl: json['original_video_url'] != null ? json ['original_video_url']: 'noVideo');
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $thumbnail_url,  totalTime: $cook_time_minutes}';
  }
}
