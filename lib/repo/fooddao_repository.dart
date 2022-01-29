import 'package:flutter/material.dart';
import 'package:yemek_kapimda/entity/food.dart';
import 'package:http/http.dart' as http;
import 'package:yemek_kapimda/entity/food_response.dart';
import 'dart:convert';

class FoodDaoRepository {

  List<Food> parseFoodResponse(String response){
    return FoodResponse.fromJson(json.decode(response)).foodList;
  }

  Future<List<Food>> getAllFoods() async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");
    var response = await http.get(url);
    return parseFoodResponse(response.body);
  }


}