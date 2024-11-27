

import 'package:get/get.dart';
import 'package:school_hiring/models/apply_job_model.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class AppliedJobController extends GetxController {




  ApplyJobModel? applyJobModel = ApplyJobModel(status: 1,data: []);

  RxBool _isLoading = false.obs;

  RxList<Datum>  _jobList = <Datum>[].obs;

  RxInt _currentPage = 1.obs;

  get currentPage => _currentPage.value;
  set currentPage(index) => _currentPage.value = index;

  get jobList => _jobList.value;
  set jobList(index) => _jobList.value = index;

  get isLoading => _isLoading.value;
  set isLoading(index) => _isLoading.value = index;

  @override
  void onInit() {
    // TODO: implement onInit

    getData();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

   getData(){
    isLoading = true;
    StartUpService.networkProvider!.getCall(ApiPath.applyJobsList,).then((value){
      applyJobModel = ApplyJobModel.fromJson(value.body);
      jobList = applyJobModel!.data;
      isLoading = false;
    }).catchError((error){

      jobList = [];

      isLoading = false;
    });

  }

  void getDataRefresh(){
    StartUpService.networkProvider!.getCall(ApiPath.applyJobsList).then((value){
      applyJobModel = ApplyJobModel.fromJson(value.body);
      jobList = applyJobModel!.data;
    }).catchError((error){
      jobList = [];
    });

  }

}