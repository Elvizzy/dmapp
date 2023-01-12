import 'package:dmapp/controllers/artnewscontrollers.dart';
import 'package:dmapp/controllers/economynewscontrollers.dart';
import 'package:dmapp/controllers/funnewscontrollers.dart';
import 'package:dmapp/controllers/healthnewscontrollers.dart';
import 'package:dmapp/controllers/musicnewscontrollers.dart';
import 'package:dmapp/controllers/sciencenewscontrollers.dart';
import 'package:dmapp/controllers/sportnewscontrollers.dart';
import 'package:dmapp/controllers/technewscontrollers.dart';
import 'package:get/get.dart';

import 'controllers/authcontrolers.dart';
import 'controllers/generalnewscontrollers.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Authcontroller(), permanent: true);
    Get.put(GeneralNewsController());
    Get.put(TechNewsController());
    Get.put(SportNewsController());
    Get.put(ScienceNewsController());
    Get.put(MusicNewsController());
    Get.put(HealthNewsController());
    Get.put(FunNewsController());
    Get.put(EconomyNewsController());
    Get.put(ArtNewsController());
  }
}
