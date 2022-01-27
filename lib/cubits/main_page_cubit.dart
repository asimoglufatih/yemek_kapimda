import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_kapimda/entity/food.dart';
import 'package:yemek_kapimda/repo/fooddao_repository.dart';

class MainPageCubit extends Cubit<List<Food>> {
  MainPageCubit():super(<Food>[]);

  var frepo = FoodDaoRepository();

  Future<void> loadAllFood() async {
    var list = await frepo.getAllFoods();
    print(list);
    emit(list);
  }
}