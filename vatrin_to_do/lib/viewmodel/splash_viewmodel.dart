import 'dart:async';

import 'package:get/get.dart';
import 'package:vatrin_to_do/view/home_page_view.dart';

class SplashViewModel {
  static void splashRouting(){
     Timer(const Duration(seconds: 3), () => Get.offAll(()=> const HomePageView()));
  }
}