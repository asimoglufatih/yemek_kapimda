import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yemek_kapimda/entity/cart_food.dart';
import 'package:yemek_kapimda/entity/cart_food_response.dart';


class CartDaoRepository {

  List<CartFood> parseCartFoodResponse(String response){
    return CartFoodResponse.fromJson(json.decode(response)).cartFoodList;
  }



  Future<void> addFood(String food_name, String food_image_name,
    String food_price, String food_order_quantity, String user_name) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php");
    var body = {
      "yemek_adi": food_name,
      "yemek_resim_adi": food_image_name,
      "yemek_fiyat": food_price,
      "yemek_siparis_adet": food_order_quantity,
      "kullanici_adi": user_name
    };
    var response = await http.post(url, body: body);

  }

  Future<List<CartFood>> getAllCartFood(String user_name) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
    var data = {"kullanici_adi": user_name};

    var response = await http.post(url, body: data);
    print(response.body);

    return parseCartFoodResponse(response.body);
  }

  // Future<List<CartFood>> getAllFood(String user_name) async {
  //   var uri = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
  //   var requestUrl = uri.replace(queryParameters: {
  //     "kullanici_adi": user_name
  //   });
  //   var response = await http.get(requestUrl);
  //
  //   return parseCartFoodResponse(response.body);
  // }

  Future<void> deleteFood(int cart_food_id, String user_name) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php");
    var body =  {
      "sepet_yemek_id": cart_food_id.toString(),
      "kullanici_adi": user_name
    };
    var response = await http.post(url, body: body);
    print("deleteFood ${response.body}");
  }


}