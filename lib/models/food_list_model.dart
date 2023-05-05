class FoodListModel {
  int? count;
  List<Results>? results;

  FoodListModel({this.count, this.results});

  FoodListModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? description;
  List<Instructions>? instructions;
  String? name;
  int? cookTimeMinutes;
  String? thumbnailUrl;
  int? totalTimeMinutes;
  String? videoUrl;
  UserRatings? userRatings;
  List<Recipes>? recipes;
  int? numServings;
  List<Sections>? sections;

  Results(
      {this.description,
      this.instructions,
      this.name,
      this.cookTimeMinutes,
      this.numServings,
      this.thumbnailUrl,
      this.totalTimeMinutes,
      this.videoUrl,
      this.userRatings,
      this.recipes,
      this.sections});

  Results.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    if (json['instructions'] != null) {
      instructions = <Instructions>[];
      json['instructions'].forEach((v) {
        instructions!.add(new Instructions.fromJson(v));
      });
    }

    name = json['name'];

    cookTimeMinutes = json['cook_time_minutes'];

    numServings = json['num_servings'];
    thumbnailUrl = json['thumbnail_url'];
    totalTimeMinutes = json['total_time_minutes'];
    videoUrl = json['video_url'];

    userRatings = json['user_ratings'] != null
        ? new UserRatings.fromJson(json['user_ratings'])
        : null;
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
    if (json['recipes'] != null) {
      recipes = <Recipes>[];
      json['recipes'].forEach((v) {
        recipes!.add(new Recipes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    if (this.instructions != null) {
      data['instructions'] = this.instructions!.map((v) => v.toJson()).toList();
    }

    data['name'] = this.name;

    data['cook_time_minutes'] = this.cookTimeMinutes;
    data['num_servings'] = this.numServings;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['total_time_minutes'] = this.totalTimeMinutes;
    data['video_url'] = this.videoUrl;
    if (this.userRatings != null) {
      data['user_ratings'] = this.userRatings!.toJson();
    }
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    if (this.recipes != null) {
      data['recipes'] = this.recipes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Instructions {
  int? endTime;
  int? temperature;
  int? id;
  int? position;
  String? displayText;
  int? startTime;
  String? appliance;

  Instructions(
      {this.endTime,
      this.temperature,
      this.id,
      this.position,
      this.displayText,
      this.startTime,
      this.appliance});

  Instructions.fromJson(Map<String, dynamic> json) {
    endTime = json['end_time'];
    temperature = json['temperature'];
    id = json['id'];
    position = json['position'];
    displayText = json['display_text'];
    startTime = json['start_time'];
    appliance = json['appliance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['end_time'] = this.endTime;
    data['temperature'] = this.temperature;
    data['id'] = this.id;
    data['position'] = this.position;
    data['display_text'] = this.displayText;
    data['start_time'] = this.startTime;
    data['appliance'] = this.appliance;
    return data;
  }
}

class Tags {
  String? type;
  String? name;
  int? id;
  String? displayName;

  Tags({this.type, this.name, this.id, this.displayName});

  Tags.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    id = json['id'];
    displayName = json['display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    data['id'] = this.id;
    data['display_name'] = this.displayName;
    return data;
  }
}

class Topics {
  String? name;
  String? slug;

  Topics({this.name, this.slug});

  Topics.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class UserRatings {
  int? countPositive;
  num? score;
  int? countNegative;

  UserRatings({this.countPositive, this.score, this.countNegative});

  UserRatings.fromJson(Map<String, dynamic> json) {
    countPositive = json['count_positive'];
    score = json['score'];
    countNegative = json['count_negative'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count_positive'] = this.countPositive;
    data['score'] = this.score;
    data['count_negative'] = this.countNegative;
    return data;
  }
}

class Sections {
  List<Components>? components;
  String? name;
  int? position;

  Sections({this.components, this.name, this.position});

  Sections.fromJson(Map<String, dynamic> json) {
    if (json['components'] != null) {
      components = <Components>[];
      json['components'].forEach((v) {
        components!.add(new Components.fromJson(v));
      });
    }
    name = json['name'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.components != null) {
      data['components'] = this.components!.map((v) => v.toJson()).toList();
    }
    data['position'] = this.position;
    return data;
  }
}

class Components {
  String? rawText;
  String? extraComment;
  Ingredient? ingredient;
  int? id;
  int? position;

  Components({
    this.rawText,
    this.extraComment,
    this.ingredient,
    this.id,
    this.position,
  });

  Components.fromJson(Map<String, dynamic> json) {
    rawText = json['raw_text'];
    extraComment = json['extra_comment'];
    ingredient = json['ingredient'] != null
        ? new Ingredient.fromJson(json['ingredient'])
        : null;
    id = json['id'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw_text'] = this.rawText;
    data['extra_comment'] = this.extraComment;
    if (this.ingredient != null) {
      data['ingredient'] = this.ingredient!.toJson();
    }
    data['id'] = this.id;
    data['position'] = this.position;

    return data;
  }
}

class Ingredient {
  String? displaySingular;
  int? updatedAt;
  String? name;
  int? createdAt;
  String? displayPlural;
  int? id;

  Ingredient(
      {this.displaySingular,
      this.updatedAt,
      this.name,
      this.createdAt,
      this.displayPlural,
      this.id});

  Ingredient.fromJson(Map<String, dynamic> json) {
    displaySingular = json['display_singular'];
    updatedAt = json['updated_at'];
    name = json['name'];
    createdAt = json['created_at'];
    displayPlural = json['display_plural'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_singular'] = this.displaySingular;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['display_plural'] = this.displayPlural;
    data['id'] = this.id;
    return data;
  }
}

class Recipes {
  String? draftStatus;
  bool? isShoppable;
  List<Instructions>? instructions;
  List<Sections>? sections;
  List<Tags>? tags;
  int? totalTimeMinutes;
  String? videoUrl;
  UserRatings? userRatings;
  String? sOpType;
  String? seoTitle;
  String? promotion;
  int? prepTimeMinutes;
  String? thumbnailAltText;
  String? servingsNounPlural;
  int? numServings;
  int? videoId;
  String? servingsNounSingular;
  int? iId;
  String? aspectRatio;
  int? showId;
  bool? tipsAndRatingsEnabled;
  String? nutritionVisibility;
  int? id;
  String? keywords;
  String? name;
  String? description;
  String? canonicalId;
  int? brandId;
  String? sIndex;
  String? thumbnailUrl;
  bool? isOneTop;
  String? sType;
  String? videoAdContent;
  String? yields;
  String? country;
  int? createdAt;
  List<Topics>? topics;

  String? originalVideoUrl;
  String? language;
  int? updatedAt;
  int? approvedAt;
  int? cookTimeMinutes;
  String? slug;

  Recipes(
      {this.draftStatus,
      this.isShoppable,
      this.instructions,
      this.sections,
      this.tags,
      this.totalTimeMinutes,
      this.videoUrl,
      this.userRatings,
      this.sOpType,
      this.seoTitle,
      this.promotion,
      this.prepTimeMinutes,
      this.thumbnailAltText,
      this.servingsNounPlural,
      this.numServings,
      this.videoId,
      this.servingsNounSingular,
      this.iId,
      this.aspectRatio,
      this.showId,
      this.tipsAndRatingsEnabled,
      this.nutritionVisibility,
      this.id,
      this.keywords,
      this.name,
      this.description,
      this.canonicalId,
      this.brandId,
      this.sIndex,
      this.thumbnailUrl,
      this.isOneTop,
      this.sType,
      this.videoAdContent,
      this.yields,
      this.country,
      this.createdAt,
      this.topics,
      this.originalVideoUrl,
      this.language,
      this.updatedAt,
      this.approvedAt,
      this.cookTimeMinutes,
      this.slug});

  Recipes.fromJson(Map<String, dynamic> json) {
    draftStatus = json['draft_status'];
    isShoppable = json['is_shoppable'];
    if (json['instructions'] != null) {
      instructions = <Instructions>[];
      json['instructions'].forEach((v) {
        instructions!.add(new Instructions.fromJson(v));
      });
    }

    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    totalTimeMinutes = json['total_time_minutes'];
    videoUrl = json['video_url'];
    userRatings = json['user_ratings'] != null
        ? new UserRatings.fromJson(json['user_ratings'])
        : null;
    sOpType = json['_op_type'];
    seoTitle = json['seo_title'];

    servingsNounPlural = json['servings_noun_plural'];
    numServings = json['num_servings'];
    videoId = json['video_id'];
    servingsNounSingular = json['servings_noun_singular'];
    iId = json['_id'];
    aspectRatio = json['aspect_ratio'];

    showId = json['show_id'];
    tipsAndRatingsEnabled = json['tips_and_ratings_enabled'];
    nutritionVisibility = json['nutrition_visibility'];
    id = json['id'];

    keywords = json['keywords'];
    name = json['name'];
    description = json['description'];
    canonicalId = json['canonical_id'];
    brandId = json['brand_id'];
    sIndex = json['_index'];
    thumbnailUrl = json['thumbnail_url'];
    isOneTop = json['is_one_top'];
    sType = json['_type'];
    videoAdContent = json['video_ad_content'];
    yields = json['yields'];
    country = json['country'];
    createdAt = json['created_at'];
    if (json['topics'] != null) {
      topics = <Topics>[];
      json['topics'].forEach((v) {
        topics!.add(new Topics.fromJson(v));
      });
    }

    originalVideoUrl = json['original_video_url'];
    language = json['language'];

    updatedAt = json['updated_at'];
    approvedAt = json['approved_at'];
    cookTimeMinutes = json['cook_time_minutes'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['draft_status'] = this.draftStatus;
    data['is_shoppable'] = this.isShoppable;
    if (this.instructions != null) {
      data['instructions'] = this.instructions!.map((v) => v.toJson()).toList();
    }

    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    data['total_time_minutes'] = this.totalTimeMinutes;
    data['video_url'] = this.videoUrl;
    if (this.userRatings != null) {
      data['user_ratings'] = this.userRatings!.toJson();
    }
    data['_op_type'] = this.sOpType;
    data['seo_title'] = this.seoTitle;

    data['promotion'] = this.promotion;
    data['prep_time_minutes'] = this.prepTimeMinutes;
    data['thumbnail_alt_text'] = this.thumbnailAltText;

    data['servings_noun_plural'] = this.servingsNounPlural;
    data['num_servings'] = this.numServings;

    data['video_id'] = this.videoId;
    data['servings_noun_singular'] = this.servingsNounSingular;
    data['_id'] = this.iId;
    data['aspect_ratio'] = this.aspectRatio;

    data['show_id'] = this.showId;
    data['tips_and_ratings_enabled'] = this.tipsAndRatingsEnabled;
    data['nutrition_visibility'] = this.nutritionVisibility;
    data['id'] = this.id;

    data['keywords'] = this.keywords;
    data['name'] = this.name;
    data['description'] = this.description;
    data['canonical_id'] = this.canonicalId;
    data['brand_id'] = this.brandId;
    data['_index'] = this.sIndex;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['is_one_top'] = this.isOneTop;
    data['_type'] = this.sType;
    data['video_ad_content'] = this.videoAdContent;
    data['yields'] = this.yields;
    data['country'] = this.country;
    data['created_at'] = this.createdAt;
    if (this.topics != null) {
      data['topics'] = this.topics!.map((v) => v.toJson()).toList();
    }

    data['original_video_url'] = this.originalVideoUrl;
    data['language'] = this.language;

    data['updated_at'] = this.updatedAt;
    data['approved_at'] = this.approvedAt;
    data['cook_time_minutes'] = this.cookTimeMinutes;
    data['slug'] = this.slug;
    return data;
  }
}

