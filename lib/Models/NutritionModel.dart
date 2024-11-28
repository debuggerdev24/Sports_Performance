class NutritionModel {
  String? id;
  String? dayName;
  String? carbs;
  String? protein;
  String? fat;
  String? fiber;
  String? totalCalories;
  String? nutritionDoc;

  NutritionModel({
    this.id,
    this.dayName,
    this.carbs,
    this.protein,
    this.fat,
    this.fiber,
    this.totalCalories,
    this.nutritionDoc,
  });

  NutritionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dayName = json['day_name'];
    carbs = json['carbs'];
    protein = json['protein'];
    fat = json['fat'];
    fiber = json['fiber'];
    totalCalories = json['total_calories'];
    nutritionDoc = json['nutrition_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['day_name'] = dayName;
    data['carbs'] = carbs;
    data['protein'] = protein;
    data['fat'] = fat;
    data['fiber'] = fiber;
    data['total_calories'] = totalCalories;
    data['nutrition_doc'] = nutritionDoc;
    return data;
  }
}
