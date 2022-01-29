import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_kapimda/cubits/main_page_cubit.dart';
import 'package:yemek_kapimda/entity/food.dart';
import 'package:yemek_kapimda/constants/app_constants.dart' as Constant;
import 'package:yemek_kapimda/views/cart.dart';
import 'package:yemek_kapimda/views/foods_page.dart';
import 'package:yemek_kapimda/views/profile_page.dart';
import 'package:yemek_kapimda/colors/colors.dart' as ColorPage;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  var pageList = [ProfilePage(),FoodsPage(),Cart()];

  @override
  void initState() {
    super.initState();
    context.read<MainPageCubit>().loadAllFood();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPage.green_light,
        title: Text("Yemek Kapımda",
          style: TextStyle(
              fontFamily: 'Caveat',
              fontWeight: FontWeight.w600,
              fontSize: 30,
              color: ColorPage.red_light,
          ),
        ),
      ),
      body: pageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Yemekler"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Sepetim"),
        ],
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: ColorPage.green_light,
        selectedItemColor: ColorPage.red_light,
      ),
    );
  }
}
