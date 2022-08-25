import 'dart:convert';
import 'dart:io' as Io;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/cubit/cubit.dart';
import 'package:la_vie/layout/cubit/states.dart';
import 'package:la_vie/sheared/constant/color.dart';
import 'package:la_vie/sheared/style/icon/icon_broken.dart';
import 'package:http/http.dart' as http;

class AddScreen extends StatelessWidget {
  var titleControl = TextEditingController();
  var discControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                IconBroken.Arrow___Left_2,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: const Text(
              'Create New Post',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  if (cubit.PostImage == null)
                    InkWell(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 120.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: mainColor, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: mainColor,
                                size: 25.0,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                'Add Photo',
                                style: TextStyle(
                                  color: mainColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        cubit.GetPostImage();
                      },
                    ),
                  if (cubit.PostImage != null)
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image(
                            image: FileImage(cubit.PostImage!),
                            width: 120.0,
                            height: 120.0,
                          ),
                          IconButton(
                            onPressed: ()
                            {
                              cubit.removePostImage();
                            },
                            icon: const Icon(
                              IconBroken.Close_Square,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Text(
                    'Title',
                    style: TextStyle(color: Colors.black54, fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    controller: titleControl,
                    maxLines: null,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(color: Colors.black54, fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    controller: discControl,
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () async
                        {
                          final bytes = Io.File(cubit.PostImage!.path).readAsBytesSync();
                          String img64 = base64Encode(bytes);
                          print(img64);
                          cubit.addPost(title: titleControl.text, description: discControl.text, image: img64);
                        },
                        color: mainColor,
                        height: 45.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
