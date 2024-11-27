


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/auth_model.dart';
import 'package:school_hiring/network/storage_repository.dart';
import 'package:school_hiring/pages/pages.dart';
import 'package:school_hiring/utility/app_constant.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class AuthenticationController  extends GetxController {


  TextEditingController? mobileController;
 TextEditingController? passwordController;

  AuthModel? authModel;


  @override
  void onInit() {
    // TODO: implement onInit
    mobileController = TextEditingController();
 passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    mobileController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  void initVerification(){
    Get.log(mobileController!.text);
    showLoader(isModal: true);
    update();
      print("-----------------------------login Data ");
    StartUpService.networkProvider!.getCommonCall("login", {
     
      "username": mobileController!.text, "password": passwordController!.text

    }).then((value) async {
      hideLoader();
      update();

      print("-----------------------------login Data ${value.body}");
      if(value.body["success"] == AppConstant.responseSuccessStatusCode){

         await StorageRepository.saveOffline(AppConstant.isLoggedInKey, true);
    await StorageRepository.saveOffline(AppConstant.tokenKey, value.body["token"]);
                    //  await StorageRepository.saveOffline(AppConstant.offlineUserIdKey, int.parse(value.body["user"]["UserID"].));
    await Get.putAsync(() => StartUpService().init()).then((value) => Get.offAllNamed(Routes.dashboardScreen));
        // authModel = AuthModel.fromJson(value.body);
        // Get.toNamed(Routes.verifyOtpScreen,arguments: [authModel,mobileController!.text],);
      }else{
        bakeToast(value.body["message"],type: ToastType.error);
      }
    }).catchError((error){
      hideLoader();
      update();
      bakeToast("Something went wrong",type: ToastType.error);
      throw error;
    });
  }

}