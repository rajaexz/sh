
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_hiring/splash/controller/splash_controller.dart';
import 'package:school_hiring/utility/app_constant.dart';


class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: controller,
        builder: (controller) => Container(
          height: Get.height,
          width: Get.width,
          child: Center(
            child: Image.asset(
              
              AppConstant.appLogoSemiSVG),
          ),
        ),
      ),
    );
  }
}
