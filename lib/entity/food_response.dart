import 'package:yemek_kapimda/entity/food.dart';

class FoodResponse {
  List<Food> foodList;
  int success;

  FoodResponse({required this.foodList, required this.success});

  factory FoodResponse.fromJson(Map<String, dynamic> json){
    var jsonArray = json["yemekler"] as List;
    List<Food> foodList = jsonArray.map((jsonArrayObject) => Food.fromJson(jsonArrayObject)).toList();

    return FoodResponse(foodList: foodList, success: json["success"] as int);
  }
}