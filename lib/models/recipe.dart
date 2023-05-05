class Recipe {
  final String? name;
  final String? thumbnail_url;
  final int? cook_time_minutes;
  final String? description;
  final String? videoUrl;
  final int? servings;
  final String? rawText;
  final String? instructions;

  Recipe({
    required this.name,
    required this.thumbnail_url,
    required this.cook_time_minutes,
    required this.description,
    required this.servings,
    required this.videoUrl,
    this.instructions,
    required this.rawText,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json['name'] as String,
      thumbnail_url: json['thumbnail_url'],
      cook_time_minutes: json['cook_time_minutes'],
      servings: json['num_servings'],
      description: json['description'] ?? " ",
      videoUrl: json['original_video_url'] ?? 'noVideo',
      instructions: json['instructions'] != null
          ? json['instructions']
              .map((instructionData) => instructionData['display_text'])
              .toList()
              .toString()
          : '',
      rawText: (json['sections'][0]['components'] as List)
          .map((component) => component['raw_text'])
          .toList()
          .toString(),
    );
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

class Ingredient {
  late final String? name;

  Ingredient({
    required this.name,
  });

  Ingredient.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Components {
  String? rawText;
  List<Ingredient>? ingredients;

  Components({
    this.rawText,
    this.ingredients,
  });

  Components.fromJson(Map<String, dynamic> json) {
    rawText = json['raw_text'];
    ingredients = (json['ingredient'] as List)
        .map((ingredient) => Ingredient.fromJson(ingredient))
        .toList();
  }
}

class Instructions {
  String? displayText;

  Instructions({this.displayText});

  Instructions.fromJson(Map<String, dynamic> json) {
    displayText = json['display_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_text'] = this.displayText;
    return data;
  }
}
