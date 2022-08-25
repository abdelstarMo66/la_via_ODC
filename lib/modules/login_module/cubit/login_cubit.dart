import 'package:flutter/material.dart';
import 'package:la_vie/models/user_model/user_model.dart';
import 'package:la_vie/modules/login_module/cubit/login_states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/sheared/constant/const.dart';
import 'package:la_vie/sheared/network/end_point.dart';
import 'package:la_vie/sheared/network/remote/dio_helper.dart';

import '../../../sheared/network/local/cashe_helper.dart';



class LoginCubit extends Cubit <LoginStates>
{
  LoginCubit() :super(InitialLoginState());

  static LoginCubit get(context) =>BlocProvider.of(context);

  int index = 1;

  void goToLogin()
  {
    index=1;
    emit(GotoLoginState());
  }

  void goToSignup()
  {
    index=0;
    emit(GoToSignUpState());
  }

  bool showPassword = true;
  bool isPass=true;
  Icon suffix = Icon(Icons.visibility_outlined);
  Icon suffix2 = Icon(Icons.visibility_outlined);

  void changevisibility() {
    showPassword = !showPassword;
    suffix = showPassword
        ? Icon(Icons.visibility_outlined)
        : Icon(Icons.visibility_off_outlined);
    emit(LoginChangeIconVisibility());
  }

  void changenonvisibility() {
    isPass = !isPass;
    suffix2 = isPass
        ? Icon(Icons.visibility_outlined)
        : Icon(Icons.visibility_off_outlined);
    emit(LoginChangeIconVisibility());
  }


  UserModel? Datamodel;

  void RegisterUser({
 required String? fname,
 required String? lname,
 required String? email,
 required String? password,
})
  {
    emit(RegisterLoadingState());
    DioHelper.postData(url: Register, Data:
    {
      'firstName':'$fname',
      'lastName':'$lname',
      'email':'$email',
      'password':'$password',
    })
        .then((value)
    {
      Datamodel= UserModel.fromJson(value.data);
      CacheHelper.saveData(key: 'token', value: Datamodel!.data!.accessToken);
      emit(RegisterSuccessState(Datamodel!));
    })
        .catchError((error)
    {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void LoginUser({
    required String? email,
    required String? password,
  })
  {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: Login, Data:
    {
      'email':'$email',
      'password':'$password',
    })
        .then((value)
    {
      Datamodel= UserModel.fromJson(value.data);
      CacheHelper.saveData(key: 'token', value: Datamodel!.data!.accessToken);
      emit(LoginSuccessState(Datamodel!));
    })
        .catchError((error)
    {
      emit(LoginErrorState(error.toString()));
    });
  }

}