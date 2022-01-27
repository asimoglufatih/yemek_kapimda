import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_kapimda/cubits/cart_cubit.dart';
import 'package:yemek_kapimda/entity/cart_food.dart';
import 'package:yemek_kapimda/constants/app_constants.dart' as Constant;

class Cart extends StatefulWidget {

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getAllCartFood();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepetim"),
      ),
      body: BlocBuilder<CartCubit, List<CartFood>>(
        builder: (context, foodList){
          if(foodList.isNotEmpty){
            return ListView.builder(
                itemCount: foodList.length,
                itemBuilder: (context, index){
                  var food = foodList[index];
                  return Card(
                    child: Row(
                      children: [
                        Image.network("${Constant.FOOD_IMAGE_URL}/${food.food_image_name}"),
                        Column(
                          children: [
                            Text("${food.food_name}", style: TextStyle(fontSize: 15),),
                            Text("${food.food_price}", style: TextStyle(fontSize: 15),),
                          ],
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                      ],
                    ),
                  );
                });
          }else{
            return Center();
          }
        },
      ),
    );
  }
}
