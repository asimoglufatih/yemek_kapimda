class CartFood {
  String cart_food_id;
  String food_name;
  String food_image_name;
  String food_price;
  String food_order_quantity;
  String user_name;

  CartFood({required this.cart_food_id, required this.food_name, required this.food_image_name,
      required this.food_price, required this.food_order_quantity, required this.user_name});

  factory CartFood.fromJson(Map<String, dynamic> json) {
    return CartFood(cart_food_id: json["sepet_yemek_id"] as String,
        food_name: json["yemek_adi"] as String,
        food_image_name: json["yemek_resim_adi"] as String,
        food_price: json["yemek_fiyat"] as String,
        food_order_quantity: json["yemek_siparis_adet"] as String,
        user_name: json["kullanici_adi"] as String);
  }
}