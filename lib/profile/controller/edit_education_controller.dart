


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/filter_model.dart';
import 'package:school_hiring/models/my_education_model.dart';
import 'package:school_hiring/network/api_path.dart';
import 'package:school_hiring/services/startup_service.dart';

class EditEducationController extends GetxController {




  RxBool _isLoading = false.obs;
  RxBool _isDegreeLevelTypeLoading = false.obs;
  RxBool _isDegreeCityLoading = false.obs;
  Rx<FilterModel> _degreeLevelFilterModel = FilterModel(data: [],status: 1).obs;
  Rx<FilterModel> _degreeTypeFilterModel = FilterModel(data: [],status: 1).obs;
  Rx<FilterModel> _stateFilterModel = FilterModel(data: [],status: 1).obs;
  Rx<FilterModel> _cityFilterModel = FilterModel(data: [],status: 1).obs;
  Rx<FilterModel> _majorSubjectFilterModel = FilterModel(data: [],status: 1).obs;
  Rx<FilterModel> _resultTypeFilterModel = FilterModel(data: [],status: 1).obs;


  FilterDatum? selectedDegreeLevel;
  FilterDatum? selectedDegreeLevelType;
  FilterDatum? selectedState;
  FilterDatum? selectedCity;
  FilterDatum? selectedResultType;

  get isLoading => _isLoading.value;
  set isLoading(index) => _isLoading.value = index;

  get isDegreeLevelTypeLoading => _isDegreeLevelTypeLoading.value;
  set isDegreeLevelTypeLoading(index) => _isDegreeLevelTypeLoading.value = index;

  get isDegreeCityLoading => _isDegreeCityLoading.value;
  set isDegreeCityLoading(index) => _isDegreeCityLoading.value = index;

  get degreeLevelFilterModel => _degreeLevelFilterModel.value;
  set degreeLevelFilterModel(index) => _degreeLevelFilterModel.value = index;

  get degreeTypeFilterModel => _degreeTypeFilterModel.value;
  set degreeTypeFilterModel(index) => _degreeTypeFilterModel.value = index;

  get stateFilterModel => _stateFilterModel.value;
  set stateFilterModel(index) => _stateFilterModel.value = index;

  get cityFilterModel => _cityFilterModel.value;
  set cityFilterModel(index) => _cityFilterModel.value = index;

  get majorSubjectFilterModel => _majorSubjectFilterModel.value;
  set majorSubjectFilterModel(index) => _majorSubjectFilterModel.value = index;

  get resultTypeFilterModel => _resultTypeFilterModel.value;
  set resultTypeFilterModel(index) => _resultTypeFilterModel.value = index;


  List<int> selectMajorSubjectId = [];

  TextEditingController? degreeLevelController;
  TextEditingController? degreeTypeController;
  TextEditingController? degreeTitleController;
  TextEditingController? majorSubjectController;
  TextEditingController? stateController;
  TextEditingController? cityController;
  TextEditingController? institutionController;
  TextEditingController? dateCompletionController;
  TextEditingController? degreeResultController;
  TextEditingController? resultTypeController;

  Datum? model;


  void initController(){
    degreeLevelController = TextEditingController();
    degreeTypeController = TextEditingController();
    degreeTitleController = TextEditingController();
    majorSubjectController = TextEditingController();
    stateController = TextEditingController();
    cityController = TextEditingController();
    institutionController = TextEditingController();
    dateCompletionController = TextEditingController();
    degreeResultController = TextEditingController();
    resultTypeController = TextEditingController();
  }


  void disposeController(){
    degreeLevelController!.dispose();
    degreeTypeController!.dispose();
    degreeTitleController!.dispose();
    majorSubjectController!.dispose();
    stateController!.dispose();
    cityController!.dispose();
    institutionController!.dispose();
    dateCompletionController!.dispose();
    degreeResultController!.dispose();
    resultTypeController!.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    model = Get.arguments[0];
    Get.log("EDU Model ::: ${model!.toJson().toString()}");
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

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }



  void fetchInitialData(){
    isLoading = true;
    StartUpService.networkProvider!.getCall(ApiPath.filterDegreeLevelUrl).then((value){
      degreeLevelFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.filterState);
    }).then((value){
      stateFilterModel = FilterModel.fromJson(value.body);

      return StartUpService.networkProvider!.getCall(ApiPath.filterMajorSubject);
    }).then((value){
      majorSubjectFilterModel = FilterModel.fromJson(value.body);
      isLoading = false;
      return StartUpService.networkProvider!.getCall(ApiPath.filterResultTYpe);
    }).then((value){
      resultTypeFilterModel = FilterModel.fromJson(value.body);
      prefillData();
      isLoading = false;
    }).catchError((error){
      isLoading = false;
    });
  }

  void fetchDegreeTypeData(){
    isDegreeLevelTypeLoading = true;
    StartUpService.networkProvider!.getCallQuery(ApiPath.filterDegreeLevelType,{"degree_level_id":selectedDegreeLevel!.id.toString()}).then((value){
      degreeTypeFilterModel = FilterModel.fromJson(value.body);
      isDegreeLevelTypeLoading = false;
    }).catchError((error){
      isDegreeLevelTypeLoading = false;
    });
  }

  void fetchCityData(){
    isDegreeCityLoading = true;
    StartUpService.networkProvider!.getCallQuery(ApiPath.filterCity,{"state":selectedState!.id.toString()}).then((value){
      cityFilterModel = FilterModel.fromJson(value.body);
      isDegreeCityLoading = false;
    }).catchError((error){
      isDegreeCityLoading = false;
    });
  }


  List<String> getMajorSubjectStringName(){
    List<String> data = [];
    FilterModel m = majorSubjectFilterModel;
    m.data!.forEach((element){
      if(element.isSelected!){
        selectMajorSubjectId.add(element.id!);
        data.add(element.value!);
      }
    });
    return data;
  }


  dynamic formData() => {
    "id":model!.id,
    "degree_level_id":selectedDegreeLevel!.id,
    "degree_type_id":selectedDegreeLevelType!.id,
    "degree_title":degreeTitleController!.text ?? "",
    "major_subjects[]":selectMajorSubjectId ?? [],
    "state_id":selectedState!.id,
    "city_id":selectedCity!.id,
    "institution": institutionController!.text ?? "",
    "date_completion":dateCompletionController!.text,
    "degree_result":degreeResultController!.text ?? "",
    "result_type_id":selectedResultType!.id,
  };

  void addEducation() {
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!
        .getCommonCall(ApiPath.addEducation, formData())
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


  void prefillData(){
    selectedDegreeLevel = FilterDatum(
      id: model!.degreeLevelId,
      value: model!.degreeLevelName
    );
    selectedDegreeLevelType = FilterDatum(
        id: model!.degreeTypeId,
        value: model!.degreeTypeName
    );
    selectedState = FilterDatum(
        id: model!.stateId,
        value: model!.stateName
    );
    selectedCity = FilterDatum(
        id: model!.cityId,
        value: model!.cityName
    );
    degreeLevelController!.text = model!.degreeLevelName ?? "";
    degreeTypeController!.text = model!.degreeTypeName ?? "";
    degreeTitleController!.text = model!.degreeTitle ?? "";
    institutionController!.text = model!.institution ?? "";
    dateCompletionController!.text = model!.dateCompletion ?? "";
    stateController!.text = model!.stateName ?? "";
    cityController!.text = model!.cityName ?? "";
    degreeResultController!.text = model!.degreeResult ?? "";
    resultTypeFilterModel!.data!.forEach((element){
      if(model!.resultTypeId == element.id){
        selectedResultType = element;
        resultTypeController!.text = element.value;
      }
    });
    if(selectedDegreeLevel != null){
      fetchDegreeTypeData();
    }

  }


}