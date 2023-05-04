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

class Nutrition {
  int? protein;
  int? fat;
  int? calories;
  int? sugar;
  int? carbohydrates;
  int? fiber;
  String? updatedAt;

  Nutrition(
      {this.protein,
      this.fat,
      this.calories,
      this.sugar,
      this.carbohydrates,
      this.fiber,
      this.updatedAt});

  Nutrition.fromJson(Map<String, dynamic> json) {
    protein = json['protein'];
    fat = json['fat'];
    calories = json['calories'];
    sugar = json['sugar'];
    carbohydrates = json['carbohydrates'];
    fiber = json['fiber'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['protein'] = this.protein;
    data['fat'] = this.fat;
    data['calories'] = this.calories;
    data['sugar'] = this.sugar;
    data['carbohydrates'] = this.carbohydrates;
    data['fiber'] = this.fiber;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Show {
  String? name;
  int? id;

  Show({this.name, this.id});

  Show.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class TotalTimeTier {
  String? displayTier;
  String? tier;

  TotalTimeTier({this.displayTier, this.tier});

  TotalTimeTier.fromJson(Map<String, dynamic> json) {
    displayTier = json['display_tier'];
    tier = json['tier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_tier'] = this.displayTier;
    data['tier'] = this.tier;
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

class Brand {
  String? imageUrl;
  String? name;
  int? id;
  String? slug;

  Brand({this.imageUrl, this.name, this.id, this.slug});

  Brand.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    name = json['name'];
    id = json['id'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    data['id'] = this.id;
    data['slug'] = this.slug;
    return data;
  }
}

class Renditions {
  String? container;
  String? posterUrl;
  int? bitRate;
  String? aspect;
  int? minimumBitRate;
  int? maximumBitRate;
  int? fileSize;
  String? url;
  int? duration;
  String? contentType;
  int? width;
  String? name;
  int? height;

  Renditions(
      {this.container,
      this.posterUrl,
      this.bitRate,
      this.aspect,
      this.minimumBitRate,
      this.maximumBitRate,
      this.fileSize,
      this.url,
      this.duration,
      this.contentType,
      this.width,
      this.name,
      this.height});

  Renditions.fromJson(Map<String, dynamic> json) {
    container = json['container'];
    posterUrl = json['poster_url'];
    bitRate = json['bit_rate'];
    aspect = json['aspect'];
    minimumBitRate = json['minimum_bit_rate'];
    maximumBitRate = json['maximum_bit_rate'];
    fileSize = json['file_size'];
    url = json['url'];
    duration = json['duration'];
    contentType = json['content_type'];
    width = json['width'];
    name = json['name'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['container'] = this.container;
    data['poster_url'] = this.posterUrl;
    data['bit_rate'] = this.bitRate;
    data['aspect'] = this.aspect;
    data['minimum_bit_rate'] = this.minimumBitRate;
    data['maximum_bit_rate'] = this.maximumBitRate;
    data['file_size'] = this.fileSize;
    data['url'] = this.url;
    data['duration'] = this.duration;
    data['content_type'] = this.contentType;
    data['width'] = this.width;
    data['name'] = this.name;
    data['height'] = this.height;
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
  List<Measurements>? measurements;

  Components(
      {this.rawText,
      this.extraComment,
      this.ingredient,
      this.id,
      this.position,
      this.measurements});

  Components.fromJson(Map<String, dynamic> json) {
    rawText = json['raw_text'];
    extraComment = json['extra_comment'];
    ingredient = json['ingredient'] != null
        ? new Ingredient.fromJson(json['ingredient'])
        : null;
    id = json['id'];
    position = json['position'];
    if (json['measurements'] != null) {
      measurements = <Measurements>[];
      json['measurements'].forEach((v) {
        measurements!.add(new Measurements.fromJson(v));
      });
    }
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
    if (this.measurements != null) {
      data['measurements'] = this.measurements!.map((v) => v.toJson()).toList();
    }
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

class Measurements {
  Unit? unit;
  String? quantity;
  int? id;

  Measurements({this.unit, this.quantity, this.id});

  Measurements.fromJson(Map<String, dynamic> json) {
    unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;
    quantity = json['quantity'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.unit != null) {
      data['unit'] = this.unit!.toJson();
    }
    data['quantity'] = this.quantity;
    data['id'] = this.id;
    return data;
  }
}

class Unit {
  String? system;
  String? name;
  String? displayPlural;
  String? displaySingular;
  String? abbreviation;

  Unit(
      {this.system,
      this.name,
      this.displayPlural,
      this.displaySingular,
      this.abbreviation});

  Unit.fromJson(Map<String, dynamic> json) {
    system = json['system'];
    name = json['name'];
    displayPlural = json['display_plural'];
    displaySingular = json['display_singular'];
    abbreviation = json['abbreviation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['system'] = this.system;
    data['name'] = this.name;
    data['display_plural'] = this.displayPlural;
    data['display_singular'] = this.displaySingular;
    data['abbreviation'] = this.abbreviation;
    return data;
  }
}

class Credits {
  String? name;
  String? type;
  String? imageUrl;
  int? id;
  String? slug;

  Credits({this.name, this.type, this.imageUrl, this.id, this.slug});

  Credits.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    imageUrl = json['image_url'];
    id = json['id'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['image_url'] = this.imageUrl;
    data['id'] = this.id;
    data['slug'] = this.slug;
    return data;
  }
}

class Price {
  int? consumptionPortion;
  int? total;
  String? updatedAt;
  int? portion;
  int? consumptionTotal;

  Price(
      {this.consumptionPortion,
      this.total,
      this.updatedAt,
      this.portion,
      this.consumptionTotal});

  Price.fromJson(Map<String, dynamic> json) {
    consumptionPortion = json['consumption_portion'];
    total = json['total'];
    updatedAt = json['updated_at'];
    portion = json['portion'];
    consumptionTotal = json['consumption_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consumption_portion'] = this.consumptionPortion;
    data['total'] = this.total;
    data['updated_at'] = this.updatedAt;
    data['portion'] = this.portion;
    data['consumption_total'] = this.consumptionTotal;
    return data;
  }
}

class Recipes {
  Nutrition? nutrition;
  String? draftStatus;
  bool? isShoppable;
  List<Instructions>? instructions;
  Brand? brand;
  List<Sections>? sections;
  List<Tags>? tags;
  int? totalTimeMinutes;
  String? videoUrl;
  UserRatings? userRatings;
  String? sOpType;
  String? seoTitle;
  List<Renditions>? renditions;
  String? promotion;
  int? prepTimeMinutes;
  String? thumbnailAltText;
  List<Credits>? credits;
  String? servingsNounPlural;
  int? numServings;
  Show? show;
  int? videoId;
  String? servingsNounSingular;
  int? iId;
  String? aspectRatio;
  int? showId;
  bool? tipsAndRatingsEnabled;
  String? nutritionVisibility;
  int? id;
  TotalTimeTier? totalTimeTier;
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
  Price? price;
  List<Compilations>? compilations;
  int? updatedAt;
  int? approvedAt;
  int? cookTimeMinutes;
  String? slug;

  Recipes(
      {this.nutrition,
      this.draftStatus,
      this.isShoppable,
      this.instructions,
      this.brand,
      this.sections,
      this.tags,
      this.totalTimeMinutes,
      this.videoUrl,
      this.userRatings,
      this.sOpType,
      this.seoTitle,
      this.renditions,
      this.promotion,
      this.prepTimeMinutes,
      this.thumbnailAltText,
      this.credits,
      this.servingsNounPlural,
      this.numServings,
      this.show,
      this.videoId,
      this.servingsNounSingular,
      this.iId,
      this.aspectRatio,
      this.showId,
      this.tipsAndRatingsEnabled,
      this.nutritionVisibility,
      this.id,
      this.totalTimeTier,
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
      this.price,
      this.compilations,
      this.updatedAt,
      this.approvedAt,
      this.cookTimeMinutes,
      this.slug});

  Recipes.fromJson(Map<String, dynamic> json) {
    nutrition = json['nutrition'] != null
        ? new Nutrition.fromJson(json['nutrition'])
        : null;
    draftStatus = json['draft_status'];
    isShoppable = json['is_shoppable'];
    if (json['instructions'] != null) {
      instructions = <Instructions>[];
      json['instructions'].forEach((v) {
        instructions!.add(new Instructions.fromJson(v));
      });
    }
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
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
    if (json['renditions'] != null) {
      renditions = <Renditions>[];
      json['renditions'].forEach((v) {
        renditions!.add(new Renditions.fromJson(v));
      });
    }
    promotion = json['promotion'];
    prepTimeMinutes = json['prep_time_minutes'];
    thumbnailAltText = json['thumbnail_alt_text'];
    if (json['credits'] != null) {
      credits = <Credits>[];
      json['credits'].forEach((v) {
        credits!.add(new Credits.fromJson(v));
      });
    }
    servingsNounPlural = json['servings_noun_plural'];
    numServings = json['num_servings'];
    show = json['show'] != null ? new Show.fromJson(json['show']) : null;
    videoId = json['video_id'];
    servingsNounSingular = json['servings_noun_singular'];
    iId = json['_id'];
    aspectRatio = json['aspect_ratio'];

    showId = json['show_id'];
    tipsAndRatingsEnabled = json['tips_and_ratings_enabled'];
    nutritionVisibility = json['nutrition_visibility'];
    id = json['id'];
    totalTimeTier = json['total_time_tier'] != null
        ? new TotalTimeTier.fromJson(json['total_time_tier'])
        : null;
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
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    if (json['compilations'] != null) {
      compilations = <Compilations>[];
      json['compilations'].forEach((v) {
        compilations!.add(new Compilations.fromJson(v));
      });
    }
    updatedAt = json['updated_at'];
    approvedAt = json['approved_at'];
    cookTimeMinutes = json['cook_time_minutes'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nutrition != null) {
      data['nutrition'] = this.nutrition!.toJson();
    }
    data['draft_status'] = this.draftStatus;
    data['is_shoppable'] = this.isShoppable;
    if (this.instructions != null) {
      data['instructions'] = this.instructions!.map((v) => v.toJson()).toList();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
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
    if (this.renditions != null) {
      data['renditions'] = this.renditions!.map((v) => v.toJson()).toList();
    }
    data['promotion'] = this.promotion;
    data['prep_time_minutes'] = this.prepTimeMinutes;
    data['thumbnail_alt_text'] = this.thumbnailAltText;
    if (this.credits != null) {
      data['credits'] = this.credits!.map((v) => v.toJson()).toList();
    }
    data['servings_noun_plural'] = this.servingsNounPlural;
    data['num_servings'] = this.numServings;
    if (this.show != null) {
      data['show'] = this.show!.toJson();
    }
    data['video_id'] = this.videoId;
    data['servings_noun_singular'] = this.servingsNounSingular;
    data['_id'] = this.iId;
    data['aspect_ratio'] = this.aspectRatio;

    data['show_id'] = this.showId;
    data['tips_and_ratings_enabled'] = this.tipsAndRatingsEnabled;
    data['nutrition_visibility'] = this.nutritionVisibility;
    data['id'] = this.id;
    if (this.totalTimeTier != null) {
      data['total_time_tier'] = this.totalTimeTier!.toJson();
    }
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
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    if (this.compilations != null) {
      data['compilations'] = this.compilations!.map((v) => v.toJson()).toList();
    }
    data['updated_at'] = this.updatedAt;
    data['approved_at'] = this.approvedAt;
    data['cook_time_minutes'] = this.cookTimeMinutes;
    data['slug'] = this.slug;
    return data;
  }
}

class Compilations {
  List<Show>? show;
  String? promotion;
  String? thumbnailUrl;
  String? videoUrl;
  int? id;
  String? slug;
  String? aspectRatio;
  bool? isShoppable;
  String? draftStatus;

  int? createdAt;
  int? approvedAt;
  String? thumbnailAltText;
  String? name;
  String? canonicalId;
  int? videoId;
  String? country;
  String? description;
  String? language;

  Compilations(
      {this.show,
      this.promotion,
      this.thumbnailUrl,
      this.videoUrl,
      this.id,
      this.slug,
      this.aspectRatio,
      this.isShoppable,
      this.draftStatus,
      this.createdAt,
      this.approvedAt,
      this.thumbnailAltText,
      this.name,
      this.canonicalId,
      this.videoId,
      this.country,
      this.description,
      this.language});

  Compilations.fromJson(Map<String, dynamic> json) {
    if (json['show'] != null) {
      show = <Show>[];
      json['show'].forEach((v) {
        show!.add(new Show.fromJson(v));
      });
    }
    promotion = json['promotion'];
    thumbnailUrl = json['thumbnail_url'];
    videoUrl = json['video_url'];
    id = json['id'];
    slug = json['slug'];
    aspectRatio = json['aspect_ratio'];
    isShoppable = json['is_shoppable'];
    draftStatus = json['draft_status'];

    createdAt = json['created_at'];
    approvedAt = json['approved_at'];
    thumbnailAltText = json['thumbnail_alt_text'];
    name = json['name'];
    canonicalId = json['canonical_id'];
    videoId = json['video_id'];
    country = json['country'];
    description = json['description'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.show != null) {
      data['show'] = this.show!.map((v) => v.toJson()).toList();
    }
    data['promotion'] = this.promotion;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['video_url'] = this.videoUrl;
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['aspect_ratio'] = this.aspectRatio;
    data['is_shoppable'] = this.isShoppable;
    data['draft_status'] = this.draftStatus;

    data['created_at'] = this.createdAt;
    data['approved_at'] = this.approvedAt;
    data['thumbnail_alt_text'] = this.thumbnailAltText;
    data['name'] = this.name;
    data['canonical_id'] = this.canonicalId;
    data['video_id'] = this.videoId;
    data['country'] = this.country;
    data['description'] = this.description;
    data['language'] = this.language;
    return data;
  }
}
