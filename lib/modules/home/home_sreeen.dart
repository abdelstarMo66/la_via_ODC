import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/cubit/cubit.dart';
import 'package:la_vie/layout/cubit/states.dart';
import 'package:la_vie/models/product_model/product_model.dart';
import 'package:la_vie/modules/cart_module/cart_screen.dart';
import 'package:la_vie/sheared/componant/navigate.dart';
import 'package:la_vie/sheared/componant/text_form_field.dart';
import 'package:la_vie/sheared/constant/color.dart';
import 'package:la_vie/sheared/style/icon/icon_broken.dart';

import '../search_module/search_screen.dart';

class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: ConditionalBuilder(
            condition: cubit.productData != null,
            builder: (context) => SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15.0,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          const Text(
                            'La Via',
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
                              end: 10.0,
                              bottom: 20.0,
                            ),
                            child: const Image(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/image/logo.png'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                NavigateTo(context, SearchScreen());
                              },
                              child: Container(
                                height: 60.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.0),
                                  color: const Color(0xFFF8F8F8),
                                ),
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 27.0,
                                    ),
                                    Icon(
                                      IconBroken.Search,
                                      color: Color(0xFF979797),
                                      size: 22.0,
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      'Search',
                                      style: TextStyle(
                                          color: Color(0xFF979797),
                                          fontSize: 20.0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          MaterialButton(
                            onPressed: ()
                            {
                              NavigateTo(context, CartScreen());
                            },
                            color: mainColor,
                            minWidth: 60.0,
                            height: 55.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Icon(
                              IconBroken.Buy,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 26.0,
                      ),
                      catBuilder(context),
                      const SizedBox(
                        height: 30.0,
                      ),
                      if (cubit.selected == 0)
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 2.0,
                          //crossAxisSpacing: 2.0,
                          childAspectRatio: 1 / 1.58,
                          children: List.generate(
                            cubit.productData!.data!.length,
                            (index) => productItems(
                              context,
                              index,
                              data: cubit.productData!.data![index],
                              /*minusFunc: (){cubit.minusCount();},
                              plusFunc: (){cubit.addCount();},*/

                              counter: cubit.count,
                            ),
                          ),
                        ),
                      /*if (cubit.selected == 1)
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 2.0,
                          //crossAxisSpacing: 2.0,
                          childAspectRatio: 1 / 1.58,
                          children: List.generate(
                            cubit.Plants.length,
                                (index) => productItems(
                                context,
                                data: cubit.Plants[index],
                                minusFunc: (){cubit.minusCount();},
                                plusFunc: (){cubit.addCount();},
                                count: "${cubit.count}"
                            ),
                          ),
                        ),
                      if (cubit.selected == 2)
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 2.0,
                          //crossAxisSpacing: 2.0,
                          childAspectRatio: 1 / 1.58,
                          children: List.generate(
                            cubit.Seeds.length,
                                (index) => productItems(
                                context,
                                data: cubit.Seeds[index],
                                minusFunc: (){cubit.minusCount();},
                                plusFunc: (){cubit.addCount();},
                                count: "${cubit.count}"
                            ),
                          ),
                        ),
                      if (cubit.selected == 3)
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 2.0,
                          //crossAxisSpacing: 2.0,
                          childAspectRatio: 1 / 1.58,
                          children: List.generate(
                            cubit.Tools.length,
                                (index) => productItems(
                                context,
                                data: cubit.Tools[index],
                                minusFunc: (){cubit.minusCount();},
                                plusFunc: (){cubit.addCount();},
                                count: "${cubit.count}"
                            ),
                          ),
                        ),*/
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget productItems(
    context, index,{
    required DataProduct data,
        int counter = 0,
/*    required VoidCallback? plusFunc,
    required VoidCallback? minusFunc,*/
        /*required String count,*/
  }) =>
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: .5,
        child: Container(
          padding: const EdgeInsetsDirectional.only(start: 13.0),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://lavie.orangedigitalcenteregypt.com${data.imageUrl}'),
                    width: 55.0,
                    height: 110.0,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                    onPressed: (){AppCubit.get(context).minusCount(index);},
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.remove,
                      size: 17.0,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "$counter",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15.0),
                    ),
                  ),
                  IconButton(
                    onPressed: (){AppCubit.get(context).addCount(index);},
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.add,
                      size: 17.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '${data.name}',
                style: const TextStyle(
                    fontSize: 19.0, fontWeight: FontWeight.w600),
              ),
              Text(
                '${data.price} EGP',
                style: const TextStyle(
                    fontSize: 14.0, fontWeight: FontWeight.w600),
              ),
              Align(
                alignment: Alignment.center,
                child: MaterialButton(
                  onPressed: () {},
                  color: mainColor,
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    'Add To Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget catBuilder(context) {
    List<String> categoryName = [
      'All',
      'Plants',
      'Seeds',
      'Tools',
    ];
    Widget category(int index) => InkWell(
          onTap: () {
            AppCubit.get(context).changeCatSelect(index);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 30),
            height: 42.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                  color: AppCubit.get(context).selected == index
                      ? mainColor
                      : Colors.transparent,
                  width: 2.5),
            ),
            child: Center(
                child: Text(
              categoryName[index],
              style: TextStyle(
                color: AppCubit.get(context).selected == index
                    ? mainColor
                    : Colors.grey,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            )),
          ),
        );

    return SizedBox(
      height: 42.0,
      child: ListView.separated(
        itemBuilder: (context, index) => category(index),
        separatorBuilder: (context, index) => const SizedBox(
          width: 5.0,
        ),
        itemCount: categoryName.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
