import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/auth_model.dart';
import 'package:school_hiring/pages/pages.dart';
import 'package:school_hiring/utility/app_constant.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class AuthenticationSignupController extends GetxController {
  TextEditingController? firstController;
  TextEditingController? lastController;

  TextEditingController? mobileController;

  AuthModel2? authModel;

  @override
  void onInit() {
    // TODO: implement onInit

    firstController = TextEditingController();
    lastController = TextEditingController();

    mobileController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    mobileController!.dispose();
    firstController!.dispose();
    lastController!.dispose();

    super.dispose();
  }

  void initVerification() {
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.signupUrl, {
      "first_name": firstController!.text,
      "last_name": lastController!.text,
      "number": mobileController!.text,
    }).then((value) {
      hideLoader();
      update();
      if (value.body["status"] == AppConstant.responseSuccessStatusCode) {
        authModel = AuthModel2.fromJson(value.body);
        Get.toNamed(
          Routes.verifyOtpSignup,
          arguments: [authModel, mobileController!.text],
        );
      } else {
        bakeToast(value.body["message"], type: ToastType.error);
      }
    }).catchError((error) {
      hideLoader();
      update();
      bakeToast("Something went wrong", type: ToastType.error);
      throw error;
    });
  }
}
