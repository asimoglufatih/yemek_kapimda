import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_kapimda/cubits/main_page_cubit.dart';
import 'package:yemek_kapimda/entity/food.dart';
import 'package:yemek_kapimda/constants/app_constants.dart' as Constant;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
    context.read<MainPageCubit>().loadAllFood();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemek Kapımda"),
      ),
      body: BlocBuilder<MainPageCubit, List<Food>>(
        builder: (context, foodList){
          if(foodList.length > 0){
            return ListView.builder(
              itemCount: foodList.length,
              itemBuilder: (context, index){
                var food = foodList[index];
                return Card(
                  child: Column(
                    children: [
                      Image.network("${Constant.FOOD_IMAGE_URL}/${food.food_image_name}"),
                      Text("${food.food_name}"),
                      Text(food.food_price),
                    ],
                  ),
                );

              });
          }else{
            return Center(
              child: Text("Bir sey bulunamadi"),
            );
          }
        },
      ),
    );
  }
}
