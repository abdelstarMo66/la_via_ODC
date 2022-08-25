import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_vie/layout/cubit/states.dart';
import 'package:la_vie/models/user_model/user_model.dart';
import 'package:la_vie/modules/discussion_module/discussion_screen.dart';
import 'package:la_vie/modules/home/home_sreeen.dart';
import 'package:la_vie/modules/profile_module/profile_screen.dart';
import 'package:la_vie/modules/scan_module/scan_screen.dart';
import 'package:la_vie/sheared/network/end_point.dart';
import 'package:la_vie/sheared/network/local/cashe_helper.dart';
import 'package:la_vie/sheared/network/remote/dio_helper.dart';

import '../../models/forums_model/forums_model.dart';
import '../../models/product_model/product_model.dart';
import '../../modules/natification_module/natification_screen.dart';
import '../../sheared/constant/const.dart';
import '../../sheared/style/icon/icon_broken.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int current_index = 2;

  List<String> recentSearchs = [];

  void addToSearchList(value) {
    recentSearchs.add(value);
    emit(AddToSearchListState());
  }

  void changeNavBar(int index) {
    if (index == 1) {
      Scan();
    }
    current_index = index;
    emit(ChangeNavBarState());
  }

  int count = 0;

  void addCount(index) {
    count++;
    emit(AddCountState());
  }

  void minusCount(index) {
    if (count <= 0) {
      count = 0;
    } else {
      count--;
    }
    emit(MinusCountState());
  }

  List<Widget> ItemsNavBar = const [
    ImageIcon(
      AssetImage('assets/image/navbar/leave.png'),
      color: Colors.black,
    ),
    ImageIcon(
      AssetImage('assets/image/navbar/qr.png'),
      color: Colors.black,
    ),
    ImageIcon(
      AssetImage('assets/image/navbar/home.png'),
      color: Colors.black,
    ),
    ImageIcon(
      AssetImage('assets/image/navbar/natification.png'),
      color: Colors.black,
    ),
    ImageIcon(
      AssetImage('assets/image/navbar/profile.png'),
      color: Colors.black,
    ),
  ];

  List<Widget> screens = [
    Discussion_Screen(),
    Scan_Screen(),
    Home_Screen(),
    Natification_Screen(),
    Profile_Screen(),
  ];

  int selected = 0;

  void changeCatSelect(int index) {
    selected = index;
    emit(ChangeCategoryState());
  }

  int selectForums = 0;

  void changeForumsSelect(int index) {
    selectForums = index;
    emit(ChangeforumsState());
  }

  ProductModel? productData;

  List<DataProduct> Plants = [];
  List<DataProduct> Seeds = [];
  List<DataProduct> Tools = [];

  Future getProduct() async {
    emit(LoadingGetProductState());
    return await DioHelper.getData(url: product, token: '$token').then((value) {
      print('Done');
      productData = ProductModel.fromJson(value.data);

      Plants = [];
      Seeds = [];
      Tools = [];
      productData!.data!.forEach((element) {
        if (element.type == 'PLANT') {
          Plants.add(element);
        }
        if (element.type == 'SEED') {
          Seeds.add(element);
        }
        if (element.type == 'TOOL') {
          Tools.add(element);
        }
      });

      emit(SuccessGetProductState());
    }).catchError((error) {
      print(error);
      emit(ErrorGetProductState(error.toString()));
    });
  }

  ForumsModel? forumsData;

  Future getForums() async{
    emit(LoadingGetForumsState());

return await DioHelper.getData(url: forums, token: '$token').then((value) {
      forumsData = ForumsModel.fromJson(value.data);
      print(forumsData!.data![0].imageUrl);
      print(forumsData!.data!.length);
      emit(SuccessGetForumsState());
    }).catchError((onError) {
      emit(ErrorGetForumsState(onError.toString()));
    });
  }

  ForumsModel? myForumsData;

  void getMyForums() {
    emit(LoadingGetMyForumsState());
    DioHelper.getData(url: my_forums, token: '$token').then((value) {
      myForumsData = ForumsModel.fromJson(value.data);
      emit(SuccessGetMyForumsState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorGetMyForumsState(onError.toString()));
    });
  }

  final imagepicker = ImagePicker();

  File? PostImage;

  Future GetPostImage() async {
    var pickedImage = await imagepicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      PostImage = File(pickedImage.path);
      emit(PostImageSuccessState());
    } else {
      print('No Image Selected');
      emit(PostImageErrorState());
    }
  }

  void removePostImage() {
    PostImage = null;
    emit(RemovePostImageState());
  }

  void addPost({
    required String title,
    required String description,
    required String image,
  }) {
    emit(LoadingAddPostState());
    DioHelper.postData(url: forums, Data: {
      'title': title,
      'description': description,
      'imageBase64': image,
    },token: token).then((value) {
      print('Done');
      emit(SuccessAddPostState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorAddPostState());
    });
  }

  CurrentUser? myData;

  void currentUser() {
    emit(LoadingGetUserState());
    DioHelper.getData(url: dataUser, token: '$token').then((value) {
      myData = CurrentUser.fromJson(value.data);
      emit(SuccessGetUserState());
    }).catchError((error) {
      emit(ErrorGetUserState(error.toString()));
    });
  }

  void refreshData() {
    getProduct();
    getForums();
    getMyForums();
    currentUser();
  }
}
