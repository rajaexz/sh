
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/filter_model.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class AddSkillController extends GetxController {


  TextEditingController? skillController;
  TextEditingController? expController;


  RxBool _isLoading = false.obs;

  get isLoading => _isLoading.value;
  set isLoading(index) => _isLoading.value = index;


  FilterModel? skillFilterModel = FilterModel(data: [],status: 1);
  FilterModel? jobExpModel  = FilterModel(data: [],status: 1);


  FilterDatum? selectedSkill;




  void initController(){
    skillController = TextEditingController();
    expController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    skillController!.dispose();
    expController!.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initController();
    fetchInitialData();
    super.onInit();
  }

  void fetchInitialData(){
    isLoading = true;
    StartUpService.networkProvider!.getCall(ApiPath.filterJobSkill).then((value){
      skillFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.filterExperience);
    }).then((value){
      jobExpModel = FilterModel.fromJson(value.body);
      isLoading = false;
      return StartUpService.networkProvider!.getCall(ApiPath.filterMajorSubject);
    }).catchError((error){
      isLoading = false;
    });
  }

  dynamic formData() => {
    "job_skill_id":selectedSkill!.id,
    "job_experience_id":12

  };

  void addSkill(bool isReset) {
        if (validateFields()) {
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!
        .getCommonCall(ApiPath.addJobSkill, formData())
        .then((value) {
      if(value.body["status"] == 1){
        resetMode();
        if(isReset)Get.back();
        bakeToast(value.body["message"],type: ToastType.success);
      }else{
        bakeToast(value.body["message"],type: ToastType.error);
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

  bool validateFields() {
    if (skillController!.text.isEmpty) {
      bakeToast("Skill cannot be empty", type: ToastType.error);
      return false;
    }
 
    return true;
  }
  void resetMode(){
    skillController!.clear();
    expController!.clear();

    selectedSkill = null;

  }
}