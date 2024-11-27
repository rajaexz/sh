



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_hiring/models/job_list_model.dart';
import 'package:school_hiring/models/job_list_model.dart' as jobListModelSubmit;
import 'package:school_hiring/models/profile_detail_model.dart';
import 'package:school_hiring/models/school_list_model.dart';
import 'package:school_hiring/models/school_list_model.dart' as schoolListModelSubmit;

import 'package:school_hiring/network/api_path.dart';
import 'package:school_hiring/network/storage_repository.dart';
import 'package:school_hiring/services/startup_service.dart';

import '../../models/filter_model.dart';
import '../../utility/app_constant.dart';

class HomeController extends GetxController{


  TextEditingController? searchController;


  FilterModel? filterModel;
  dynamic jobListModel;

  SchoolListModel? schoolListModel;

  ProfileDetailModel? profileDetailModel;



  RxBool _isLoading = true.obs;
 RxList<dynamic>  _jobList = <dynamic>[].obs;
 String ?  userId ;
  get jobList => _jobList.value;
  set jobList(index) => _jobList.value = index;



  get isLoading => _isLoading.value;
  set isLoading(index) => _isLoading.value = index;

  


  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    searchController = TextEditingController();
   await getData();
    super.onInit();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    searchController!.dispose();
    super.dispose();
  }



   getData() async {
    isLoading = true;
  
     userId  =  await StorageRepository.getOfflineKey(AppConstant.offlineUserIdKey);
    StartUpService.networkProvider!.getCommonCall(ApiPath.filterCareedLevels ,
 
  {"UserId" : userId, "Category" : "", "Brand" : "", "City" : "", "State" : ""}
    ).then((value){


       jobListModel = value.body;
       jobList =jobListModel["data"];
           print("-----------------------------login Data ${jobList} ");

isLoading = false;
      return StartUpService.networkProvider!.getCall(ApiPath.jobListUrl);
    }).catchError((error){
      filterModel = FilterModel(status: 1,message: "",data: []);
      jobList = [];

      isLoading = false;
    });
  
  // .then((value){
  //     jobListModel = JobListModel.fromJson(value.body);
  //     jobList = jobListModel!.data!.data!;

  //     return StartUpService.networkProvider!.getCall(ApiPath.schoolListUrl);
  //   }).then((value){
  //     schoolListModel = SchoolListModel.fromJson(value.body);
  //     schoolList = schoolListModel!.data!.data!;

  //     return StartUpService.networkProvider!.getCall(ApiPath.getProfileUrl);
  //   }).then((value){
  //     profileDetailModel = ProfileDetailModel.fromJson(value.body);
  //     isLoading = false;
  //   })
  // 
  // .catchError((error){
  //     filterModel = FilterModel(status: 1,message: "",data: []);
  //     jobList = [];
  //     schoolList = [];
  //     isLoading = false;
  //   });
 }
}