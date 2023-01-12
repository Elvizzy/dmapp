import 'package:dmapp/controllers/healthnewscontrollers.dart';
import 'package:dmapp/screenz/news/Health/healthdetail.dart';
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

class Healthnewslistscreen extends StatelessWidget {
  Healthnewslistscreen({Key? key}) : super(key: key);
  HealthNewsController healthnewsController = Get.find<HealthNewsController>();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    return Scaffold(
      backgroundColor: MyAppColors.appwhite,
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text('HEALTH NEWS'),
        centerTitle: true,
      ),
      body: Obx(() {
        return healthnewsController.stillFetching.value
            ? const Center(child: CircularProgressIndicator())
            : NewsListWidget(
                color: Colors.lightGreenAccent,
                appBarTitleText: 'Health News',
                titleText: healthnewsController.healthNewsList[0].title!,
                headerImage: healthnewsController.healthNewsList[0].urlToImage!,
                sliverDelegate: SliverChildBuilderDelegate(
                  ((context, index) {
                    var healthnews = healthnewsController.healthNewsList[index];
                    return Column(
                      children: [
                        Material(
                          elevation: 4,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: h * 0.01),
                              child: InkWell(
                                onTap: () {
                                  Get.to(HealthNewsDetailScreen(
                                      newsArticle: healthnews));
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
                                            image: NetworkImage(healthnews
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
                                            healthnews.description!,
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
                                                  color:
                                                      Colors.lightGreenAccent,
                                                  text: 'HEALTH',
                                                  height: h * 0.047,
                                                  width: w * 0.3,
                                                  radius: h * 0.009,
                                                  fontSize: h * 0.016,
                                                ),
                                                SizedBox(
                                                  width: h * 0.006,
                                                ),
                                                Text(
                                                  healthnews.publishedAt!,
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
                  childCount: healthnewsController.healthNewsList.length,
                ),
              );
      }),
      bottomNavigationBar: Container(
        color: Colors.lightGreenAccent,
        height: h * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                color: Colors.black,
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
