import 'package:dmapp/models/newsmodel.dart';
import 'package:dmapp/utilities/APIS.dart';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TechNewsController extends GetxController {
  // list for all general news
  final techNewsList = <Articles>[].obs;

  // A reactive boolean variable to check if data is still being loaded
  final stillFetching = false.obs;

  // GetConnect from getX
  final _getConnect = GetConnect();

  @override
  void onReady() {
    fetchAllNewsData();
    super.onReady();
  }

  Future<void> fetchAllNewsData() async {
    await fetchGeneralNewsData();
  }

  Future<void> fetchGeneralNewsData() async {
    try {
      // isfetching set to true
      stillFetching.value = true;

      // fetching the data and saving it a Response object variable
      Response response = await _getConnect.get(techNewsAPI);

      update();

      // status 200 means successful fetch
      if (response.statusCode == 200) {
        final newsList = (response.body['articles'] as List)
            .map((e) => Articles.fromJson(e))
            .toList();

        if (techNewsList.length <= 7) {
          techNewsList.assignAll(newsList);
        }

        // for testing
        print(techNewsList);

        // when data is done fetching and is saved we set stillfetching bool to false
        stillFetching.value = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
