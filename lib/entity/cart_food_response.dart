import 'package:yemek_kapimda/entity/cart_food.dart';

class CartFoodResponse {
  List<CartFood> cartFoodList;
  int success;

  CartFoodResponse({required this.cartFoodList, required this.success});

  factory CartFoodResponse.fromJson(Map<String, dynamic> json){
    var jsonArray = json["sepet_yemekler"] as List;
    List<CartFood> cartFoodList = jsonArray.map((obj) => CartFood.fromJson(obj)).toList();

    return CartFoodResponse(cartFoodList: cartFoodList, success: json["success"] as int);
  }
}