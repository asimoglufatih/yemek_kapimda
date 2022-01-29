import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_kapimda/cubits/cart_cubit.dart';
import 'package:yemek_kapimda/entity/cart_food.dart';
import 'package:yemek_kapimda/constants/app_constants.dart' as Constant;
import 'package:yemek_kapimda/colors/colors.dart' as ColorPage;

class Cart extends StatefulWidget {

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  int totalAmount = 0;

  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getAllCartFood();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPage.linen,
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
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network("${Constant.FOOD_IMAGE_URL}/${food.food_image_name}")),
                        Spacer(),
                        Text("${food.food_name}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Spacer(),
                        Text("Adet: ${food.food_order_quantity}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Text("Tutar: ${int.parse(food.food_price) * int.parse(food.food_order_quantity)}", style: TextStyle(fontWeight: FontWeight.bold),),
                        Spacer(),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${food.food_name} Silinsin mi?"),
                                action: SnackBarAction(
                                  label: "Evet",
                                  onPressed: (){
                                    context.read<CartCubit>().deleteFood(int.parse(food.cart_food_id), Constant.USER_NAME);
                                  },
                                ),
                          ));
                        }, icon: Icon(Icons.delete)),
                      ],
                    ),

                  );
                });

          }else{
            return Center(
              child: Text("Bir şey bulunamadı."),
            );
          }
        },
      ),
    );
  }
}
