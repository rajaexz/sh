

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/verify_otp_model.dart';

import '../../models/auth_model.dart';
import '../../network/api_path.dart';
import '../../network/storage_repository.dart';
import '../../pages/pages.dart';
import '../../services/startup_service.dart';
import '../../utility/app_constant.dart';
import '../../utility/utility.dart';

class VerifyOtpController extends GetxController {

  TextEditingController? otpController;

  VerifyOtpModel? verifyOtpModel;


  bool isEmailMode = false;
  AuthModel? authModel;
  // VerifyOtpModel? verifyOtpModel;
  String? mobile;

  //Token? token;


  @override
  void onInit() {
    // TODO: implement onInit
    otpController = TextEditingController();
    authModel = Get.arguments[0];
    //signInModel = Get.arguments[0];
    //isEmailMode = Get.arguments[1];
    otpController!.text = authModel!.data!.otp.toString();
    mobile = Get.arguments[1];
    // email = Get.arguments[2];
    // token = Get.arguments[3];
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    otpController!.dispose();
    super.dispose();
  }


  void checkOtp(){
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.verifyOtp, {
      //"accessToken":signInModel!.data!.accessToken,
      "otp":otpController!.text,
      "id":authModel!.data!.user,
    }).then((value) {

      if(value.body["status"] == AppConstant.responseSuccessStatusCode){
        Get.log(jsonEncode(value.body));
        verifyOtpModel = VerifyOtpModel.fromJson(value.body);

        //Utility.showSuccess(value.body["message"]);
        saveOfflineRepo();
      }else{
        Utility.showError(value.body["message"]);

      }
      hideLoader();
      update();
    }).catchError((error){
      hideLoader();
      update();
      bakeToast("Something went wrong",type: ToastType.error);
      throw error;
    });
  }

  void resendOtp(){
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.resendOtp, {
      //"username":signInModel!.data!.username,
      "mobile":isEmailMode ? false : true,
      "email": isEmailMode ? true : false,
      //"accessToken":signInModel!.data!.accessToken,

    }).then((value) {

      if(value.body["status"]){
        Get.log("${jsonEncode(value.body)}");
        //signInModel = SignInModel.fromJson(value.body);
        //otpController!.text = signInModel!.data!.otp!.toString();
        Utility.showSuccess(value.body["message"]);
        //Get.toNamed(Routes.verifyOtpScreen,arguments: [signInModel]);
      }else{
        Utility.showError(value.body["message"]);
        //bakeToast(value.body["message"],type: ToastType.error);
      }
      hideLoader();
      update();
    }).catchError((error){
      hideLoader();
      update();
      bakeToast("Something went wrong",type: ToastType.error);
      throw error;
    });
  }

  void saveOfflineRepo() async{
    await StorageRepository.saveOffline(AppConstant.isLoggedInKey, true);
    await StorageRepository.saveOffline(AppConstant.tokenKey, verifyOtpModel!.data!.token);
    await StorageRepository.saveOffline(AppConstant.offlineUserIdKey, verifyOtpModel!.data!.user);
    await Get.putAsync(() => StartUpService().init()).then((value) => Get.offAllNamed(Routes.dashboardScreen));
  }

}