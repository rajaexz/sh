

import 'package:get/get.dart';
import 'package:ots/ots.dart';

import '../../models/favorite_job_model.dart';
import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class FavoriteJobController extends GetxController {
  FavoriteJobModel? favoriteJobModel;

  RxBool isLoading = false.obs;
  RxList<Datum> jobList = <Datum>[].obs;
  RxInt currentPage = 1.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

   getData() async {
    isLoading.value = true;
    try {
      final response = await StartUpService.networkProvider!.getCall(ApiPath.favoriteJobList);
      favoriteJobModel = FavoriteJobModel.fromJson(response.body);
      jobList.assignAll(favoriteJobModel?.data ?? []);
    } catch (error) {
      jobList.clear();
    } finally {
      isLoading.value = false;
    }
  }

  void getDataRefresh() async {
    try {
      final response = await StartUpService.networkProvider!.getCall(ApiPath.favoriteJobList);
      favoriteJobModel = FavoriteJobModel.fromJson(response.body);
      jobList.assignAll(favoriteJobModel?.data ?? []);
    } catch (error) {
      jobList.clear();
    }
  }

  void favouritejobs({required String id}) async {
    showLoader(isModal: true);
    try {
      final response = await StartUpService.networkProvider!
          .getCommonCallW(ApiPath.addfavoriteJob, {"job_id": id});

      var json = response.body;
      if (json["status"] == 1) {
        bakeToast(json["message"], type: ToastType.success);

        // Update the job's favorite status locally
        for (var job in jobList) {
          if (job.id.toString() == id) {
            job.isFav = job.isFav == 1 ? 0 : 1; // Toggle the favorite status
            break; // Exit the loop once the job is found and updated
          }
        }

        // Refresh the UI by notifying listeners
        jobList.refresh();
        update(); // This may be redundant if using Obx in the UI
      } else {
        bakeToast(json["message"], type: ToastType.warning);
      }
    } catch (error) {
      bakeToast("Something Went Wrong", type: ToastType.error);
    } finally {
      hideLoader();
    }
  }
}


















