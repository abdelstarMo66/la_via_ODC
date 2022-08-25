import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/cubit/cubit.dart';
import 'package:la_vie/sheared/constant/const.dart';
import 'package:la_vie/sheared/network/local/cashe_helper.dart';
import 'package:la_vie/sheared/network/remote/dio_helper.dart';
import 'package:la_vie/test.dart';

import 'layout/home_layout.dart';
import 'modules/discussion_module/discussion_screen.dart';
import 'modules/login_module/signin_screen.dart';
import 'modules/splash/splash_screen.dart';
import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  token = await CacheHelper.getData(key: 'token');
  Widget Started;

  if (token != null) {
    Started = Layout();
  } else {
    Started = Login_Screen();
  }
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(Started));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp(this.startWidget);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..getProduct()
        ..currentUser()..getForums()
        ,
      child: MaterialApp(
        home: startWidget,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
