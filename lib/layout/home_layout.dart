import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/cubit/cubit.dart';
import 'package:la_vie/sheared/constant/color.dart';

import 'cubit/states.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is ErrorGetProductState) {
          print('Error');
        }
        if(state is LoadingGetProductState) {
          print('Loading');
        }
        if(state is SuccessGetProductState) {
          print('Success');
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: CurvedNavigationBar(
            items: cubit.ItemsNavBar,
            onTap: (index)=>cubit.changeNavBar(index),
            index: cubit.current_index,
            buttonBackgroundColor: mainColor,
            color: Colors.black.withOpacity(0.100),
            backgroundColor: Colors.white,
            height: 60.0,
            animationCurve: Curves.fastOutSlowIn,
          ),
          body: cubit.screens[cubit.current_index],
        );
      },
    );
  }
}
