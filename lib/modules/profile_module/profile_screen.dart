import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/cubit/cubit.dart';
import 'package:la_vie/layout/cubit/states.dart';
import 'package:la_vie/modules/question_module/question_screen.dart';
import 'package:la_vie/sheared/componant/navigate.dart';

class Profile_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("${cubit.myData!.data!.imageUrl}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2,
                    color: Colors.black.withOpacity(0.7),
                  )
                ],
              ),
              SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 70.0,
                    ),
                    CircleAvatar(
                      radius: 65.0,
                      backgroundImage: NetworkImage("${cubit.myData!.data!.imageUrl}"),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "${cubit.myData!.data!.firstName} ${cubit.myData!.data!.lastName}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(
                      height: 55.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: const Color(0xFFF3FEF1),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 51.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 15.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage(
                                      'assets/image/profile/point.png'),
                                  width: 28.0,
                                  height: 28.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'You have 30 points',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                'Edit Prifile',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              Spacer(),
                              IconButton(onPressed: ()
                              {
                                NavigateTo(context, QuestionScreen());
                              }, icon: Icon(Icons.question_mark_outlined),),
                            ],
                          ),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: const Color(0xFFF3FEF1),
                                border:
                                    Border.all(color: Colors.black, width: 0.5),
                              ),
                              margin: const EdgeInsets.only(top: 20.0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 15.0),
                              child: Row(
                                children: const [
                                  Image(
                                    image: AssetImage(
                                        'assets/image/profile/icon.png'),
                                    height: 28.0,
                                    width: 28.0,
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Change Name',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),
                                  )),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 26.0,
                          ),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: const Color(0xFFF3FEF1),
                                border:
                                    Border.all(color: Colors.black, width: 0.5),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 15.0),
                              child: Row(
                                children: const [
                                  Image(
                                    image: AssetImage(
                                        'assets/image/profile/icon.png'),
                                    height: 28.0,
                                    width: 28.0,
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Change Email',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        listener: (context, state) {});
  }
}
