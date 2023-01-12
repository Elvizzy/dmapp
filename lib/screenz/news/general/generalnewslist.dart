import 'package:dmapp/screenz/news/general/Generaldetail.dart';

import 'package:dmapp/utilities/myappcolor.dart';
import 'package:dmapp/widget/Newlistwidget.dart';
import 'package:dmapp/widget/our_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dmapp/widget/Newlistwidget.dart';
import 'package:dmapp/controllers/generalnewscontrollers.dart';
import 'package:get/get.dart';

class Generalnewslistscreen extends StatelessWidget {
  Generalnewslistscreen({Key? key}) : super(key: key);
  GeneralNewsController generalnewsController =
      Get.find<GeneralNewsController>();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    return Scaffold(
      backgroundColor: MyAppColors.appwhite,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('GENERAL NEWS'),
        centerTitle: true,
      ),
      body: Obx(() {
        return generalnewsController.stillFetching.value
            ? const Center(child: CircularProgressIndicator())
            : NewsListWidget(
                color: Colors.black,
                appBarTitleText: 'General News',
                titleText: generalnewsController.generalNewsList[0].title!,
                headerImage:
                    generalnewsController.generalNewsList[0].urlToImage!,
                sliverDelegate: SliverChildBuilderDelegate(
                  ((context, index) {
                    var generalnews =
                        generalnewsController.generalNewsList[index];
                    return Column(
                      children: [
                        Material(
                          elevation: 4,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: h * 0.01),
                              child: InkWell(
                                onTap: () {
                                  Get.to(GeneralNewsDetailScreen(
                                      newsArticle: generalnews));
                                },
                                child: Row(
                                  children: [
                                    // Image: first item in the outer Row
                                    Container(
                                      margin: EdgeInsets.only(left: h * 0.01),
                                      height: h * 0.14,
                                      width: h * 0.12,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(generalnews
                                                .urlToImage!), //AssetImage(screenData[index]['image']),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(h * 0.02)),
                                    ),
                                    // Second Item in our Row. Beside the Image
                                    Container(
                                      margin: EdgeInsets.only(left: h * 0.01),
                                      width: w * 0.7,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            generalnews.description!,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                // color: Colors.bl,
                                                ),
                                          ),
                                          SizedBox(height: h * 0.01),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: h * 0.001),
                                            child: Row(
                                              children: [
                                                OurButton(
                                                  color: Colors.black,
                                                  text: 'GENERAL',
                                                  height: h * 0.047,
                                                  width: w * 0.3,
                                                  radius: h * 0.009,
                                                  fontSize: h * 0.016,
                                                ),
                                                SizedBox(
                                                  width: h * 0.006,
                                                ),
                                                Text(
                                                  generalnews.publishedAt!,
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Giving space between the list items
                        SizedBox(height: h * 0.02),
                      ],
                    );
                  }),
                  childCount: generalnewsController.generalNewsList.length,
                ),
              );
      }),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: h * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_circle_outline),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.palette_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
