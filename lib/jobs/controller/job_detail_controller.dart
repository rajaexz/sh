



import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/job_detail_model.dart';
import 'package:school_hiring/models/vc_list_model.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';
class JobDetailController extends GetxController {
  RxBool _isLoading = false.obs;
  RxDouble _currentSalary = 10000.00.obs;
  RxDouble _expectedSalary = 30000.00.obs;
  RxInt _selectedCV = 100.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  double get currentSalary => _currentSalary.value;
  set currentSalary(double value) => _currentSalary.value = value;

  double get expectedSalary => _expectedSalary.value;
  set expectedSalary(double value) => _expectedSalary.value = value;

  int get selectedCV => _selectedCV.value;
  set selectedCV(int value) => _selectedCV.value = value;

  JobDetailModel? jobDetailModel;
  CvListModel? cvListModel;
  int? jobId;

  @override
  void onInit() {
    super.onInit();
    jobId = Get.arguments[0] as int?;
    if (jobId != null) {
      getData();
    }
  }

   getData() {
    isLoading = true;
    StartUpService.networkProvider!
        .getCallQuery(ApiPath.jobDetailUrl, {"id": jobId.toString()})
        .then((value) {

      jobDetailModel = JobDetailModel.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.getCVUrl);
    }).then((value) {
      cvListModel = CvListModel.fromJson(value.body);
    }).catchError((error) {
      bakeToast("Error: $error", type: ToastType.error);
    }).whenComplete(() {
      isLoading = false;
    });
  }

  void favouriteJobs({required String id}) async {
    showLoader(isModal: true);
    try {
      final response = await StartUpService.networkProvider!
          .getCommonCallW(ApiPath.addfavoriteJob, {"job_id": id});
      var json = response.body;
      if (json["status"] == 1) {
        bakeToast(json["message"], type: ToastType.success);
        if (jobDetailModel?.data != null) {
          jobDetailModel!.data!.isFav =
          jobDetailModel!.data!.isFav == 1 ? 0 : 1;
          update();
        }
      } else {
        bakeToast(json["message"], type: ToastType.warning);
      }
    } catch (error) {
      bakeToast("Something Went Wrong: $error", type: ToastType.error);
    } finally {
      hideLoader();
    }
  }

  Map<String, dynamic> formData() {
    return {
      "job_id": jobDetailModel?.data?.id ?? '',
      "cv_id": cvListModel?.data?.elementAt(selectedCV)?.id ?? '',
      "current_salary": currentSalary.toString(),
      "expected_salary": expectedSalary.toString(),
    };
  }

  void addRemoveBookmark() {
    StartUpService.networkProvider!
        .getCommonCall(ApiPath.bookMark, {"job_id": jobId})
        .then((value) {
      if (value.body["status"] == 1) {
        if (jobDetailModel?.data != null) {
          jobDetailModel!.data!.isFav =
          jobDetailModel!.data!.isFav == 0 ? 1 : 0;
          update();
        }
        bakeToast(value.body["message"], type: ToastType.success);
      } else {
        bakeToast(value.body["message"], type: ToastType.error);
      }
    }).catchError((error) {
      bakeToast("Error: $error", type: ToastType.error);
    });
  }

  void applyJobs() {
    showLoader(isModal: true);
    StartUpService.networkProvider!
        .getCommonCall(ApiPath.applyJobs, formData())
        .then((value) {
      if (value.body["status"] == 1) {
        if (jobDetailModel?.data != null) {
          jobDetailModel!.data!.isApply = 1;
        }
        Get.back();
        bakeToast(value.body["message"], type: ToastType.success);
      } else {
        bakeToast(value.body["message"], type: ToastType.error);
      }
    }).catchError((error) {
      bakeToast("Error: $error", type: ToastType.error);
    }).whenComplete(() {
      hideLoader();
      update();
    });
  }
}
