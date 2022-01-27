import 'package:flutter/material.dart';
import 'package:yemek_kapimda/cubits/detail_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_kapimda/entity/food.dart';
import 'package:yemek_kapimda/constants/app_constants.dart' as Constant;

class DetailPage extends StatefulWidget {
  Food food;
  DetailPage({required this.food});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


  int food_quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("${Constant.FOOD_IMAGE_URL}/${widget.food.food_image_name}"),
            Text("${widget.food.food_name}", style: TextStyle(fontSize: 30),),
            Text("${int.parse(widget.food.food_price) * food_quantity}₺", style: TextStyle(fontSize: 30),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  if(food_quantity > 0){
                    setState(() {
                      food_quantity--;
                    });
                  }
                }, icon: Icon(Icons.remove)),
                Text("$food_quantity"),
                IconButton(onPressed: (){
                  if(food_quantity >= 0){
                    setState(() {
                      food_quantity++;
                    });
                  }
                }, icon: Icon(Icons.add)),
              ],
            ),
            ElevatedButton(onPressed: (){
              context.read<DetailPageCubit>().addFood(widget.food.food_name, widget.food.food_image_name, widget.food.food_price, food_quantity.toString(), Constant.USER_NAME);
            }, child: Text("Sepete Ekle")),
          ],
        ),
      ),
    );
  }
}
