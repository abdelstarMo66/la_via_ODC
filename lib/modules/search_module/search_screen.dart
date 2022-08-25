import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/cubit/cubit.dart';
import 'package:la_vie/layout/cubit/states.dart';

import '../../sheared/componant/text_form_field.dart';
import '../../sheared/style/icon/icon_broken.dart';

class SearchScreen extends StatelessWidget {
  var searchControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          /*appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: IconButton(onPressed: (){}, icon: Icon(IconBroken.Arrow___Left_2,color: Colors.black,)),
          ),*/
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0,),
                  MyTextFormFields(
                      lable: 'Search',
                      fillColor: Color(0xFFF8F8F8),
                      type: TextInputType.text,
                      controller: searchControler,
                      prefixIcon: const Icon(IconBroken.Search),
                      onSubmet: (value) {
                        searchControler.text='';
                        AppCubit.get(context).addToSearchList(value);
                      }),
                  SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recent Searchs',
                          style: TextStyle(color: Colors.grey, fontSize: 17.0),
                        ),
                        InkWell(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context,index)=>RecentSearch(text: AppCubit.get(context).recentSearchs[index]),
                            separatorBuilder: (context,index)=>const SizedBox(height: 0.0,),
                            itemCount: AppCubit.get(context).recentSearchs.length,
                          ),
                        ),
                      ],
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

  Widget RecentSearch({required String text} ) => Row(
        children: [
          Icon(
            Icons.access_time,
            color: Colors.grey,
            size: 26.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.grey, fontSize: 18.0),
            ),
          ),
          IconButton(
            onPressed: () {
            },
            icon: Icon(
              Icons.close,
              color: Colors.grey,
            ),
          ),
        ],
      );
}
