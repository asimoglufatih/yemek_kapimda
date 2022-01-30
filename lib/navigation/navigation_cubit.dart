import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_kapimda/constants/app_constants.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.profile_page, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem){
      case NavbarItem.profile_page:
        emit(NavigationState(NavbarItem.profile_page, 0));
        break;
      case NavbarItem.foods_page:
        emit(NavigationState(NavbarItem.foods_page, 1));
        break;
      case NavbarItem.cart:
        emit(NavigationState(NavbarItem.cart, 2));
        break;
    }
  }
}