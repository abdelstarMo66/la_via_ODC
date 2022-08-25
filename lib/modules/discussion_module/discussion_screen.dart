import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/cubit/cubit.dart';
import 'package:la_vie/layout/cubit/states.dart';
import '../../models/forums_model/forums_model.dart';
import '../../sheared/componant/navigate.dart';
import '../../sheared/constant/color.dart';
import '../../sheared/style/icon/icon_broken.dart';
import '../addpost_module/add_screen.dart';

class Discussion_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: const Text(
              'Discussion Forums',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              NavigateTo(context, AddScreen());
            },
            backgroundColor: mainColor,
            child: const Icon(
              Icons.add,
            ),
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50.0,
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
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          Text(
                            'Search',
                            style: TextStyle(
                                color: Color(0xFF979797), fontSize: 18.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  selectedForums(context),
                  if (cubit.selectForums == 0)
                    ConditionalBuilder(
                      condition: cubit.forumsData != null,
                      builder: (context) => ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => postItem(
                            data: cubit.forumsData!.data![index],),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10.0,
                        ),
                        itemCount: cubit.forumsData!.data!.length,
                      ),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  if (cubit.selectForums == 1)
                    ConditionalBuilder(
                      condition: cubit.myForumsData != null,
                      builder: (context) => ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => postItem(
                            data: cubit.myForumsData!.data![index],),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10.0,
                        ),
                        itemCount: cubit.myForumsData!.data!.length,
                      ),
                      fallback: (context) => SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Center(child: CircularProgressIndicator()),
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

  Widget selectedForums(context) {
    List<String> selectName = [
      'All Forums',
      'My Forums',
    ];
    Widget select(int index) => InkWell(
          onTap: () {
            AppCubit.get(context).changeForumsSelect(index);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 30),
            height: 42.0,
            decoration: BoxDecoration(
              color: AppCubit.get(context).selectForums == index
                  ? mainColor
                  : const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                  color: AppCubit.get(context).selectForums == index
                      ? mainColor
                      : Colors.transparent,
                  width: 2.5),
            ),
            child: Center(
                child: Text(
              selectName[index],
              style: TextStyle(
                color: AppCubit.get(context).selectForums == index
                    ? Colors.white
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
        itemBuilder: (context, index) => select(index),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10.0,
        ),
        itemCount: selectName.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget postItem({required ForumsData data}) =>
      SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: 15.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.3, color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage('${data.user!.imageUrl}'),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 220,
                                  child: Text(
                                    '${data.user!.firstName} ${data.user!.lastName}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Text(
                                  'date',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '${data.title}',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '${data.description}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // FadeInImage.assetNetwork(
                  //   placeholder: 'assets/image/gif_loading.gif',
                  //   image:
                  //       'https://lavie.orangedigitalcenteregypt.com${data.imageUrl}',
                  // ),
                  Image.network('${data.imageUrl}'),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 8.0),
              child: Row(
                children: [
                  InkWell(
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/image/like.png'),
                          fit: BoxFit.cover,
                          width: 22.0,
                          height: 22.0,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '${data.forumLikes!.length} Likes',
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 16.0),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 40.0,
                  ),
                  InkWell(
                    child: Text(
                      '${data.forumComments!.length} Replies',
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
