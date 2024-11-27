


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/filter_model.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class AddExperienceController extends GetxController {

  TextEditingController? titleController;
  TextEditingController? companyController;
  TextEditingController? dateStartController;
  TextEditingController? endDateController;
  TextEditingController? stateController;
  TextEditingController? cityController;
  TextEditingController? descriptionController;

  RxBool _isLoading = false.obs;
  RxBool _isCurrentlyWorking = false.obs;
  RxBool _isDegreeCityLoading = false.obs;


  DateTime? startDate = DateTime.now();
  DateTime? endDate =  null;


  get isLoading => _isLoading.value;
  set isLoading(index) => _isLoading.value = index;

  get isCurrentlyWorking => _isCurrentlyWorking.value;
  set isCurrentlyWorking(index) => _isCurrentlyWorking.value = index;

  get isDegreeCityLoading => _isDegreeCityLoading.value;
  set isDegreeCityLoading(index) => _isDegreeCityLoading.value = index;


  FilterModel? stateModel;
  FilterModel? cityModel;


  FilterDatum? selectedState;
  FilterDatum? selectedCity;

  void initController(){
    titleController = TextEditingController();
    companyController = TextEditingController();
    dateStartController = TextEditingController();
    endDateController = TextEditingController();
    stateController = TextEditingController();
    cityController = TextEditingController();
    descriptionController = TextEditingController();
  }


  void disposeController(){
    titleController!.dispose();
    companyController!.dispose();
    dateStartController!.dispose();
    endDateController!.dispose();
    stateController!.dispose();
    cityController!.dispose();
    descriptionController!.dispose();
  }


  @override
  void onInit() {
    // TODO: implement onInit
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

  void fetchInitialData(){
    isLoading = true;
    StartUpService.networkProvider!.getCall(ApiPath.filterState).then((value){
      stateModel = FilterModel.fromJson(value.body);
      isLoading = false;
    }).catchError((error){
      isLoading = false;
    });
  }

  void fetchCityData(){
    isDegreeCityLoading = true;
    StartUpService.networkProvider!.getCallQuery(ApiPath.filterCity,{"state":selectedState!.id.toString()}).then((value){
      cityModel = FilterModel.fromJson(value.body);
      isDegreeCityLoading = false;
    }).catchError((error){
      isDegreeCityLoading = false;
    });
  }

  dynamic formData() => {
    "title":titleController!.text,
    "company":companyController!.text,
    "date_start":dateStartController!.text,
    "date_end":endDateController!.text,
    "state_id":selectedState!.id,
    "city_id":selectedCity!.id,
    "is_currently_working": isCurrentlyWorking ? 1 : 0,
    "description":descriptionController!.text ?? "",
  };

  void addExperience() {
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!
        .getCommonCall(ApiPath.addExperience, formData())
        .then((value) {
      if(value.body["status"] == 1){
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
}