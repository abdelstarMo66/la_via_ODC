import 'package:flutter/material.dart';
import 'package:la_vie/sheared/constant/color.dart';

import '../../sheared/style/icon/icon_broken.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconBroken.Arrow___Left_2,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(20.0),
        child: SizedBox(
          // height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Items(),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20.0,
                  ),
                  itemCount: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '100,100 EGP',
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {},
                      color: mainColor,
                      height: 45.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
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
  }

  Widget Items() => SizedBox(
        height: 170.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Card(
            elevation: 50.0,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: const Image(
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/single-green-tree-clear-sky_181624-46695.jpg?w=740&t=st=1661427587~exp=1661428187~hmac=5fde9a2c33e0fb644a43c1d2aec9bebaacafd6ddf3c686d73fdb5a98704c134e'),
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Name Product',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      '200 EGP',
                      style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 17.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: EdgeInsets.zero,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.remove,
                              size: 20.0,
                              color: mainColor,
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: const Size(1.0, 1.0),
                            ),
                          ),
                          const Text(
                            '1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              minimumSize: const Size(1.0, 1.0),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20.0,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage('assets/image/bin.png'),
                      width: 25.0,
                      height: 205.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
