import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_kapimda/cubits/main_page_cubit.dart';
import 'package:yemek_kapimda/entity/food.dart';
import 'package:yemek_kapimda/views/detail_page.dart';
import 'package:yemek_kapimda/constants/app_constants.dart' as Constant;
import 'package:yemek_kapimda/colors/colors.dart' as ColorsPage;

class FoodsPage extends StatefulWidget {
  const FoodsPage({Key? key}) : super(key: key);

  @override
  _FoodsPageState createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPage.linen,
      body: BlocBuilder<MainPageCubit, List<Food>>(
        builder: (context, foodList){
          if(foodList.isNotEmpty){
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4/3
                ),
                itemCount: foodList.length,
                itemBuilder: (context, index){
                  var food = foodList[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(food: food)));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.network("${Constant.FOOD_IMAGE_URL}/${food.food_image_name}")),
                          Text("${food.food_name}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          Text("${food.food_price}₺", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
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
