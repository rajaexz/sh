import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ots/ots.dart';
import 'package:school_hiring/models/ProfileSummary.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class AddSummaryController extends GetxController {
  RxBool _isLoading = false.obs;

  get isLoading => _isLoading.value;
  set isLoading(index) => _isLoading.value = index;

  TextEditingController? summaryController;

  ProfileSummary? profileDetailModel;

  void initController() {
    summaryController = TextEditingController();
  }

  void disposeController() {
    summaryController!.dispose();
  }

  void fetchInitialData() {
    isLoading = true;
    StartUpService.networkProvider!
        .getCall(ApiPath.getSummarySplitAPI)
        .then((value) {
      profileDetailModel = ProfileSummary.fromJson(value.body);
      isLoading = false;
      prefillData();
    }).catchError((error) {
      isLoading = false;
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    profileDetailModel = Get.arguments[0];
    initController();
    fetchInitialData();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    disposeController();
    super.dispose();
  }

  void prefillData() {
    summaryController!.text = profileDetailModel!.data!.summary;
    
  }

  dynamic formData() => {
        "summary": summaryController!.text ?? "",
      };

  void updateProfile() {
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!
        .getCommonCall(ApiPath.updateSummary, formData())
        .then((value) {
      if (value.body["status"] == 1) {
        Get.back();
        bakeToast(value.body["message"], type: ToastType.success);
      } else {
        bakeToast(value.body["message"], type: ToastType.error);
      }
      hideLoader();
      update();
    }).catchError((error) {
      hideLoader();
      update();
      throw error;
    });
  }
}
