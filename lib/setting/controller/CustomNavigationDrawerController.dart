

import 'package:get/get.dart';
import 'package:school_hiring/services/startup_service.dart';

import 'package:school_hiring/models/job_list_model.dart';
import 'package:school_hiring/models/profile_detail_model.dart';
import 'package:school_hiring/utility/utility.dart';
 
import '../../network/api_path.dart';
import '../../network/storage_repository.dart';
import '../../utility/app_constant.dart';
class CustomNavigationDrawerController extends GetxController {
  ProfileDetailModel? profileDetailModel;
  RxBool _isLoading = true.obs;
  JobListModel? jobListModel;

  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;
  RxBool isDrakmood = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    isLoading = true;

    // Fetch the saved theme mode from storage
    bool? isDark = await StorageRepository.getOfflineKey(AppConstant.toggleTheme);
    isDrakmood.value = isDark ?? false; // Use .value to update the RxBool

    StartUpService.networkProvider!.getCall(ApiPath.getProfileUrl).then((value) {
      profileDetailModel = ProfileDetailModel.fromJson(value.body);
      isLoading = false;
      update();
    }).catchError((error) {
      update();
      isLoading = false;
    });
  }

  void setIsDark(bool value) {
    isDrakmood.value = value; // Update the RxBool value
    StorageRepository.saveOffline(AppConstant.toggleTheme, value);
    update();
  }

  void logout() async {
    Utility.showLogoutDialog();
    // StorageRepository.destroyOfflineStorage();
    // bakeToast("Successfully Logged Out", type: ToastType.success);
    // await Future.delayed(const Duration(seconds: 3));
  }
}
