import 'package:yemek_kapimda/entity/cart_food.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_kapimda/repo/cartdao_repository.dart';
import 'package:yemek_kapimda/constants/app_constants.dart' as Constant;

class CartCubit extends Cubit<List<CartFood>> {
  CartCubit():super(<CartFood>[]);

  var crepo = CartDaoRepository();

  Future<void> getAllCartFood() async{
    var list = await crepo.getAllCartFood(Constant.USER_NAME);

    emit(list);
  }

  Future <void> deleteFood(int cart_food_id, String user_name) async {
    await crepo.deleteFood(cart_food_id, user_name);
    await getAllCartFood();
  }
}