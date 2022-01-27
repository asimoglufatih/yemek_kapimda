import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_kapimda/repo/cartdao_repository.dart';

class DetailPageCubit extends Cubit<void> {

  DetailPageCubit():super(0);

  var frepo = CartDaoRepository();

  Future<void> addFood(String food_name, String food_image_name,
      String food_price, String food_order_quantity, String user_name) async{

    await frepo.addFood(food_name, food_image_name, food_price, food_order_quantity, user_name);

  }

}