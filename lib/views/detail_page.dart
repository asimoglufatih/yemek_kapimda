import 'package:flutter/material.dart';
import 'package:yemek_kapimda/entity/food.dart';
import 'package:yemek_kapimda/constants/app_constants.dart' as Constant;

class DetailPage extends StatefulWidget {
  Food food;
  DetailPage({required this.food});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("${Constant.FOOD_IMAGE_URL}/${widget.food.food_image_name}"),
            Text("${widget.food.food_name}", style: TextStyle(fontSize: 30),),
            Text("${widget.food.food_price}₺", style: TextStyle(fontSize: 30),),
            ElevatedButton(onPressed: (){}, child: Text("Sepete Ekle")),
          ],
        ),
      ),
    );
  }
}
