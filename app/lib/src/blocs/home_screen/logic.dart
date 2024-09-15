import 'package:app/src/blocs/home_screen/state.dart';
import 'package:app/src/screens/home_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class HomeScreenLogic extends Cubit<HomeScreenState> {
  Widget currentScreen = const HomeScreen();

  // HomeScreenLogic
  HomeScreenLogic() : super(HomeScreenInitState());

  // Logic
  void getWidget() {}
}
