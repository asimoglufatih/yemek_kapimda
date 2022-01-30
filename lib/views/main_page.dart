import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_kapimda/constants/profile.dart';
import 'package:yemek_kapimda/cubits/cart_cubit.dart';
import 'package:yemek_kapimda/cubits/main_page_cubit.dart';
import 'package:yemek_kapimda/constants/app_constants.dart' as Constant;
import 'package:yemek_kapimda/navigation/navigation_cubit.dart';
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
    context.read<CartCubit>().getAllCartFood(Profile.currentUser);
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
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state){
          if(state.navbarItem == Constant.NavbarItem.profile_page){
            return ProfilePage();
          }else if (state.navbarItem == Constant.NavbarItem.foods_page){
            return FoodsPage();
          }else if (state.navbarItem == Constant.NavbarItem.cart){
            return Cart();
          }
          return Center();
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profil"),
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "Yemekler"),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Sepetim"),
              ],
            onTap: (index) {
                if(index == 0){
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(Constant.NavbarItem.profile_page);
                }else if(index == 1){
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(Constant.NavbarItem.foods_page);
                }else if (index == 2){
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(Constant.NavbarItem.cart);
                }
            },
            backgroundColor: ColorPage.green_light,
            selectedItemColor: ColorPage.red_light,
          );
        },
      )
    );
  }
}


/*
*
* BottomNavigationBar(
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
* */