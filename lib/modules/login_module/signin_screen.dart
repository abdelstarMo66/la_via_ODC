import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/cubit/cubit.dart';
import 'package:la_vie/layout/home_layout.dart';
import 'package:la_vie/modules/login_module/cubit/login_cubit.dart';
import 'package:la_vie/modules/login_module/cubit/login_states.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:la_vie/sheared/componant/navigate.dart';
import 'package:la_vie/sheared/componant/toasting.dart';
import 'package:la_vie/sheared/constant/const.dart';
import '../../sheared/componant/divider.dart';
import '../../sheared/componant/text_form_field.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../../sheared/constant/color.dart';
import '../../sheared/network/local/cashe_helper.dart';

class Login_Screen extends StatelessWidget {
  var pass = TextEditingController();
  var pass2 = TextEditingController();
  var email = TextEditingController();
  var fname = TextEditingController();
  var lname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              ShowToast(msg: state.modelData.message, color: Colors.green);
              token = CacheHelper.getData(key: 'token');
              NavigateAndFinish(context, Layout());
              AppCubit.get(context).refreshData();
              print('SUCCESS');
            }
            if (state is RegisterErrorState) {
              ShowToast(msg: state.error, color: Colors.red);
              print('ERROR');
            }
            if (state is LoginSuccessState) {
              ShowToast(msg: state.modelData.message, color: Colors.green);
              token = CacheHelper.getData(key: 'token');
              NavigateAndFinish(context, Layout());
              AppCubit.get(context).refreshData();
              print('SUCCESS');
            }
            if (state is LoginErrorState) {
              ShowToast(msg: state.error, color: Colors.red);
              print('ERROR');
            }
          },
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            return Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    child: const Image(
                      height: 140.0,
                      width: 130.0,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/login/left.png'),
                    ),
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    const Text(
                      'la Via',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Meddon',
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
                        //  fontStyle: FontStyle.normal,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.only(
                          end: 15.0, bottom: 30.0),
                      child: const Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/logo.png'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                cubit.goToSignup();
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: cubit.index == 0
                                      ? mainColor
                                      : Colors.grey,
                                  fontSize: 22.0,
                                ),
                              )),
                          Container(
                            color: cubit.index == 0
                                ? mainColor
                                : Colors.transparent,
                            height: 4.0,
                            width: 80.0,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              cubit.goToLogin();
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: cubit.index == 1
                                      ? mainColor
                                      : Colors.grey,
                                  fontSize: 22.0),
                            ),
                          ),
                          Container(
                            color: cubit.index == 1
                                ? mainColor
                                : Colors.transparent,
                            height: 4.0,
                            width: 80.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (cubit.index == 1)
                  Expanded(
                    child: Login(
                      context,
                      email: email,
                      password: pass,
                    ),
                  ),
                if (cubit.index == 0)
                  Expanded(
                    child: SignUp(context,
                        password: pass,
                        fnamed: fname,
                        lnamed: lname,
                        emaild: email,
                        password2: pass2),
                  ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    child: const Image(
                      height: 140.0,
                      width: 130.0,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/login/right.png'),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget Login(
    context, {
    required TextEditingController? email,
    required TextEditingController? password,
  }) {
    var formkey = GlobalKey<FormState>();
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Form(
        key: formkey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          margin: const EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            children: [
              MyTextFormFields(
                lable: "Email",
                controller: email,
                type: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email must not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              MyTextFormFields(
                lable: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    LoginCubit.get(context).changevisibility();
                  },
                  icon: LoginCubit.get(context).suffix,
                ),
                controller: password,
                showpassword: LoginCubit.get(context).showPassword,
                type: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email must not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 36.0,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: mainColor,
                ),
                child: MaterialButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      LoginCubit.get(context).LoginUser(
                        email: email!.text,
                        password: password!.text,
                      );
                    }
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: MtDiv(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: const Text(
                      'or continue with',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Expanded(
                    child: MtDiv(),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 60.0,
                    onPressed: () {},
                    icon: const Image(
                        image: AssetImage('assets/image/login/Google.png')),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  IconButton(
                    iconSize: 60.0,
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage('assets/image/login/Facebook.png'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget SignUp(
    context, {
    required TextEditingController? password,
    required TextEditingController? fnamed,
    required TextEditingController? lnamed,
    required TextEditingController? emaild,
    TextEditingController? password2,
  }) {
    var formkey = GlobalKey<FormState>();
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Form(
        key: formkey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          margin: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            children: [
              MyTextFormFields(
                lable: "Email",
                controller: emaild,
                type: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email must not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: MyTextFormFields(
                      lable: "First name",
                      controller: fnamed,
                      type: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'first name must not be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: MyTextFormFields(
                      lable: "Last name",
                      controller: lnamed,
                      type: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'last name must not be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextFormFields(
                lable: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    LoginCubit.get(context).changevisibility();
                  },
                  icon: LoginCubit.get(context).suffix,
                ),
                controller: password,
                showpassword: LoginCubit.get(context).showPassword,
                type: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password must not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextFormFields(
                lable: "Password again",
                suffixIcon: IconButton(
                  onPressed: () {
                    LoginCubit.get(context).changevisibility();
                  },
                  icon: LoginCubit.get(context).suffix2,
                ),
                controller: password2,
                showpassword: LoginCubit.get(context).isPass,
                type: TextInputType.visiblePassword,
                validator: (value) {
                  if (value! != pass.text) {
                    return 'password not similar';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 40.0,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: mainColor,
                ),
                child: MaterialButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      LoginCubit.get(context).RegisterUser(
                        fname: fnamed!.text,
                        lname: lnamed!.text,
                        email: emaild!.text,
                        password: password!.text,
                      );
                    }
                  },
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: MtDiv(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: const Text(
                      'or continue with',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Expanded(
                    child: MtDiv(),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      iconSize: 60.0,
                      onPressed: () {},
                      icon: const Image(
                          image: AssetImage('assets/image/login/Google.png'))),
                  const SizedBox(
                    width: 30.0,
                  ),
                  IconButton(
                      iconSize: 60.0,
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage('assets/image/login/Facebook.png'),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
