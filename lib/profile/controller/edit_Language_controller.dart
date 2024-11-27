

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/filter_model.dart';


import '../../models/my_Language_model.dart';
import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class EditLanguageController extends GetxController {


  TextEditingController? LanguageController;
  // TextEditingController? expController;


  RxBool _isLoading = false.obs;

  get isLoading => _isLoading.value;
  set isLoading(index) => _isLoading.value = index;


  FilterModel? LanguageFilterModel = FilterModel(data: [],status: 1);
  FilterModel? jobExpModel  = FilterModel(data: [],status: 1);


  FilterDatum? selectedLanguage;


  Datum? model;



  void initController(){
    LanguageController = TextEditingController();
    // expController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    LanguageController!.dispose();
    // expController!.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    model = Get.arguments[0];
    initController();
    fetchInitialData();
    super.onInit();
  }

  void fetchInitialData(){
    isLoading = true;
    StartUpService.networkProvider!.getCall(ApiPath.filterLanguage).then((value){
      LanguageFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.filterExperience);
    }).then((value){
      jobExpModel = FilterModel.fromJson(value.body);
      prefillData();
      isLoading = false;

    }).catchError((error){
      isLoading = false;
    });
  }

  dynamic formData() => {
    "language_id":model!.id,
    "language_level_id":2,


  };

  void addLanguage(bool isReset) {
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!
        .getCommonCall(ApiPath.editLanguage, formData())
        .then((value) {
      if(value.body["status"] == 1){
        resetMode();
        Get.back();
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



  void resetMode(){
    LanguageController!.clear();
    // expController!.clear();

    selectedLanguage = null;
  }



  void prefillData(){
    selectedLanguage = FilterDatum(
      isSelected: false,
      id: model!.languageId,
      value: model!.languageLevelName
    );
 

    LanguageController!.text = model!.languageName!;
    // expController!.text = model!.asJobExperienceName!;

  }
}