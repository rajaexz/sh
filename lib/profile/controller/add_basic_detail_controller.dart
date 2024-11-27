

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/profile_detail_model.dart';
import 'package:school_hiring/utility/app_config.dart';
import 'package:school_hiring/utility/app_constant.dart';

import '../../models/filter_model.dart';
import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class AddBasicDetailController extends GetxController {

  RxBool _isLoading = false.obs;
  RxBool _isImmidiateAvailable = false.obs;
  RxBool _isDegreeCityLoading = false.obs;


  DateTime? dobDate;

  get isLoading => _isLoading.value;
  set isLoading(index) => _isLoading.value = index;

  get isImmidiateAvailable => _isImmidiateAvailable.value;
  set isImmidiateAvailable(index) => _isImmidiateAvailable.value = index;

  get isDegreeCityLoading => _isDegreeCityLoading.value;
  set isDegreeCityLoading(index) => _isDegreeCityLoading.value = index;

  RxDouble? _currentSalary = 000.00.obs;
  RxDouble? _expectedSalary = 30000.00.obs;

  RxInt? _selectedGender = AppConfig.genderMaleValue.obs;


  RxInt? _selectedMarital = AppConfig.maritalValue.obs;


  set currentSalary(value) => _currentSalary!.value =  value;
  get currentSalary => _currentSalary!.value;

  set expectedSalary(value) => _expectedSalary!.value =  value;
  get expectedSalary => _expectedSalary!.value;

  set selectedGender(value) => _selectedGender!.value =  value;
  get selectedGender => _selectedGender!.value;


  set selectedMarital(value) => _selectedMarital!.value =  value;
  get selectedMarital => _selectedMarital!.value;

  TextEditingController? firstNameController;
  TextEditingController? middleNameController;
  TextEditingController? lastNameController;
  TextEditingController? fatherNameController;
  TextEditingController? dobController;
  TextEditingController? maritalStatusController;
  TextEditingController? nationalIdController;
  TextEditingController? stateController;
  TextEditingController? cityController;
  TextEditingController? phoneController;
  TextEditingController? alternateContactController;
  TextEditingController? addresseController;
  TextEditingController? jobExperienceController;
  TextEditingController? careerLevelController;
  TextEditingController? industryController;
  TextEditingController? functionalAreaController;
 TextEditingController? emailController;

  FilterDatum? selectedState;
  FilterDatum? selectedCity;
  FilterDatum? selectedJobExperience;
  FilterDatum? selectedCareerLevel;
  FilterDatum? selectedIndustries;
  FilterDatum? selectedFunctionalArea;

  ProfileDetailModel? profileDetailModel;


  FilterModel? experienceModel;
  FilterModel? careerFilterModel;
  FilterModel? industriesFilterModel;
  FilterModel? functionalAreaFilterModel;
  FilterModel? stateFilterModel;
  FilterModel? cityFilterModel;


  void initController(){
    firstNameController = TextEditingController();
    middleNameController = TextEditingController();
    lastNameController = TextEditingController();
    fatherNameController = TextEditingController();
    dobController = TextEditingController();
    maritalStatusController = TextEditingController();
    nationalIdController = TextEditingController();
    stateController = TextEditingController();
    cityController = TextEditingController();
    phoneController = TextEditingController();
    addresseController = TextEditingController();
    jobExperienceController = TextEditingController();
    careerLevelController = TextEditingController();
    industryController = TextEditingController();
    functionalAreaController = TextEditingController();
    alternateContactController = TextEditingController();
    emailController = TextEditingController();
  }


  void disposeController(){
    firstNameController!.dispose();
    middleNameController!.dispose();
    lastNameController!.dispose();
    fatherNameController!.dispose();
    dobController!.dispose();
    maritalStatusController!.dispose();
    nationalIdController!.dispose();
    stateController!.dispose();
    cityController!.dispose();
    phoneController!.dispose();
    addresseController!.dispose();
    jobExperienceController!.dispose();
    careerLevelController!.dispose();
    industryController!.dispose();
    functionalAreaController!.dispose();
    alternateContactController!.dispose();
    emailController!.dispose();
  }



  void fetchInitialData(){
    isLoading = true;
    StartUpService.networkProvider!.getCall(ApiPath.filterExperience).then((value){
      experienceModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.filterCareerLevel);
    }).then((value){
      careerFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.filterIndustries);
    }).then((value){
      industriesFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.filterFunctionalArea);
    }).then((value){
      functionalAreaFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.filterState);
    }).then((value){
      stateFilterModel = FilterModel.fromJson(value.body);
      isLoading = false;
      prefillData();
    }).catchError((error){
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
  phoneController?.text = profileDetailModel?.data?.phone ?? "";
  firstNameController?.text = profileDetailModel?.data?.firstName ?? "";
  middleNameController?.text = profileDetailModel?.data?.middleName ?? "";
  lastNameController?.text = profileDetailModel?.data?.lastName ?? "";
  fatherNameController?.text = profileDetailModel?.data?.fatherName ?? "";
  emailController?.text = profileDetailModel?.data?.email ?? "";

  // Safely assign selectedGender and selectedMarital with null safety
  selectedGender = profileDetailModel?.data?.genderId ?? AppConfig.genderMaleValue;
  selectedMarital = profileDetailModel?.data?.maritalStatusId ?? AppConfig.maritalValue;

  // Safely format the date of birth if available
  dobController?.text = profileDetailModel?.data?.dateOfBirth == null
      ? ""
      : AppConstant.getDateFormat.format(profileDetailModel!.data!.dateOfBirth!);

  alternateContactController?.text = profileDetailModel?.data?.mobileNum ?? "";
  addresseController?.text = profileDetailModel?.data?.streetAddress ?? "";

  // Safely clamp salary values using null safety and fallbacks
  currentSalary = double.tryParse(profileDetailModel?.data?.currentSalary ?? "0.0")
          ?.clamp(AppConfig.minSalaryValue, AppConfig.maxSalaryValue) ?? AppConfig.minSalaryValue;
  expectedSalary = double.tryParse(profileDetailModel?.data?.expectedSalary ?? "0.0")
          ?.clamp(AppConfig.minSalaryValue, AppConfig.maxSalaryValue) ?? AppConfig.minSalaryValue;

  // Safely check immediate availability
  isImmidiateAvailable = (profileDetailModel?.data?.isImmediateAvailable ?? 0) == 1;

  // Safely handle state filtering with null safety checks
  if (profileDetailModel?.data?.stateId != null && profileDetailModel?.data?.stateId != "null") {
    stateFilterModel?.data?.forEach((element) {
      if (profileDetailModel?.data?.stateId.toString() == element.id.toString()) {
        selectedState = element;
        stateController?.text = element.value ?? "";
      }
    });
  }

  // Safely handle job experience filtering
  if (profileDetailModel?.data?.jobExperienceId != null && profileDetailModel?.data?.jobExperienceId != "null") {
    experienceModel?.data?.forEach((element) {
      if (profileDetailModel?.data?.jobExperienceId.toString() == element.id.toString()) {
        selectedJobExperience = element;
        jobExperienceController?.text = element.value ?? "";
      }
    });
  }

  // Safely handle career level filtering
  if (profileDetailModel?.data?.careerLevelId != null && profileDetailModel?.data?.careerLevelId != "null") {
    careerFilterModel?.data?.forEach((element) {
      if (profileDetailModel?.data?.careerLevelId.toString() == element.id.toString()) {
        selectedCareerLevel = element;
        careerLevelController?.text = element.value ?? "";
      }
    });
  }

  // Safely handle industries filtering
  if (profileDetailModel?.data?.industryId != null && profileDetailModel?.data?.industryId != "null") {
    industriesFilterModel?.data?.forEach((element) {
      if (profileDetailModel?.data?.industryId.toString() == element.id.toString()) {
        selectedIndustries = element;
        industryController?.text = element.value ?? "";
      }
    });
  }

  // Safely handle functional area filtering
  if (profileDetailModel?.data?.functionalAreaId != null && profileDetailModel?.data?.functionalAreaId != "null") {
    functionalAreaFilterModel?.data?.forEach((element) {
      if (profileDetailModel?.data?.functionalAreaId.toString() == element.id.toString()) {
        selectedFunctionalArea = element;
        functionalAreaController?.text = element.value ?? "";
      }
    });
  }

  // Fetch city data if state is selected
  if (selectedState != null) {
    fetchCityData();
  }
}
  void fetchCityData(){
    isDegreeCityLoading = true;
    StartUpService.networkProvider!.getCallQuery(ApiPath.filterCity,{"state":selectedState!.id.toString()}).then((value){
      cityFilterModel = FilterModel.fromJson(value.body);
      fillCity();
      isDegreeCityLoading = false;
    }).catchError((error){
      isDegreeCityLoading = false;
    });
  }


  void fillCity(){
    try{
      if(["",null,"null"].contains(profileDetailModel!.data!.cityId) == false){
        cityFilterModel!.data!.forEach((element){
          if(profileDetailModel!.data!.cityId.toString() == element.id.toString()){
            selectedCity = element;
            cityController!.text = element.value!;
          }
        });
      }
    }catch(e){

    }
  }


  dynamic formData() => {
    "first_name": firstNameController!.text ?? "",
    "email":emailController!.text ??"",
    "middle_name": middleNameController!.text ?? "",
    "last_name": lastNameController!.text ?? "",
    "father_name": fatherNameController!.text ?? "",
    "date_of_birth": dobController!.text ?? "",
    "gender_id": selectedGender,
    "marital_status_id": selectedMarital,
    "national_id_card_number": "",
    "state_id": selectedState!.id,
    "city_id": selectedCity!.id,
    "phone": phoneController!.text ?? "",
    "mobile_num": alternateContactController!.text ?? "",
    "job_experience_id": selectedJobExperience!.id,
    "career_level_id": selectedCareerLevel!.id,
    "industry_id": selectedIndustries!.id,
    "functional_area_id": selectedFunctionalArea!.id,
    "current_salary":int.parse(currentSalary.toStringAsFixed(0).toString()),
    "expected_salary":int.parse(expectedSalary.toStringAsFixed(0).toString()),
    "street_address": addresseController!.text ?? "",
    "is_immediate_available": isImmidiateAvailable ? 1 : 0
  };


  void updateProfile() {
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!
        .getCommonCall(ApiPath.updateInfo, formData())
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