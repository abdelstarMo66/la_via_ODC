import 'package:la_vie/models/user_model/user_model.dart';

abstract class LoginStates{}

class InitialLoginState extends LoginStates{}

class LoginChangeIconVisibility extends LoginStates{}

class GotoLoginState extends LoginStates{}

class GoToSignUpState extends LoginStates{}

class ChangeColorState extends LoginStates{}

class RegisterLoadingState extends LoginStates {}

class RegisterSuccessState extends LoginStates {
  final UserModel modelData;

  RegisterSuccessState(this.modelData);
}

class RegisterErrorState extends LoginStates {
  final String error;

  RegisterErrorState(this.error);
}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final UserModel modelData;

  LoginSuccessState(this.modelData);
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}