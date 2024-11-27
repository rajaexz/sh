
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/filter_model.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class AddLanguageController extends GetxController {


  TextEditingController? LanguageController;
  TextEditingController? levellanController;


  RxBool _isLoading = false.obs;

  get isLoading => _isLoading.value;
  set isLoading(index) => _isLoading.value = index;


  FilterModel? LanguageFilterModel = FilterModel(data: [],status: 1);
  FilterModel?  levelLanguageFilterModel  = FilterModel(data: [],status: 1);


  FilterDatum? selectedLanguage;


  FilterDatum? selectedlavelLanguage;




  void initController(){
    LanguageController = TextEditingController();
    levellanController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    LanguageController!.dispose();
    levellanController!.dispose();
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
    StartUpService.networkProvider!.getCall(ApiPath.filterLanguage).then((value){
      LanguageFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.filterLanguagelevel);
    }).then((value){
      levelLanguageFilterModel = FilterModel.fromJson(value.body);
      isLoading = false;
      return StartUpService.networkProvider!.getCall(ApiPath.filterMajorSubject);
    }).catchError((error){
      isLoading = false;
    });
  }

  dynamic formData() => {
    "language_id":selectedLanguage!.id,
    "language_level_id":selectedlavelLanguage!.id

  };

  void addLanguage(bool isReset) {

    if (validateFields()) {
    
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!
        .getCommonCall(ApiPath.addLanguage, formData())

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
    if (LanguageController!.text.isEmpty) {
      bakeToast("Language cannot be empty", type: ToastType.error);
      return false;
    }
 
    return true;
  }

  void resetMode(){
    LanguageController!.clear();
    levellanController!.clear();

    selectedLanguage = null;

  }
}