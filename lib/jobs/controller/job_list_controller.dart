import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';

import '../../models/job_list_model.dart';
import '../../network/api_path.dart';
import '../../services/startup_service.dart';import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';

import '../../models/job_list_model.dart';
import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class JobListController extends GetxController {
  RxInt totalPage = 0.obs;
  ScrollController? scrollController;
  TextEditingController? searchController;

  var filterParams = {}.obs;
  JobListModel? jobListModel;

  RxBool isLoading = false.obs;

  RxList<Datum> _jobList = <Datum>[].obs;

  int currentPage = 1;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController!.addListener(pagination);
    searchController = TextEditingController();
    getData(); // Initial data fetch
  }

  @override
  void dispose() {
    scrollController?.dispose();
    searchController?.dispose();
    super.dispose();
  }

  void pagination() {
    if (scrollController != null &&
        scrollController!.position.pixels == scrollController!.position.maxScrollExtent &&
        currentPage < totalPage.value &&
        !isLoading.value) {
     
      currentPage++;
      getData(); // Fetch data for the next page
    }
  }

  // Getter for jobList
  List<Datum> get jobList => _jobList.toList();

  // Setter for jobList
  set jobList(List<Datum> value) => _jobList.value = value;

  void setFilter(Map<String, dynamic> filters) {
    filterParams.value = filters;
    currentPage = 1; // Reset page number on filter change
    getData(); 

  Get.forceAppUpdate();
          filterParams.value = {"":""};
  }

String buildQueryParams( filters) {
  return filters.entries
      .where((entry) => entry.value != null) // Exclude null values
      .map((entry) {
        String key = Uri.encodeQueryComponent(entry.key);
        var value = entry.value;

        // Handle list values
        if (value is List) {
          if (value.isEmpty) {
            return '$key=';
          }
          // Join list items with a comma
          return '$key=${value.map((item) => Uri.encodeQueryComponent(item.toString())).join(',')}';
        } else {
          return '$key=${Uri.encodeQueryComponent(value.toString())}';
        }
      })
      .join('&');
}

   getData() {
    if (isLoading.value) return; // Prevent duplicate requests
    isLoading.value = true;

    final queryParams = buildQueryParams(filterParams.value);

    // Construct the final URL
    final url = "${ApiPath.jobListUrl}?page=$currentPage&$queryParams";
    print("Fetching data from URL: $url");

    StartUpService.networkProvider!
        .getCall(url)
        .then((value) {
          jobListModel = JobListModel.fromJson(value.body);
          if (currentPage == 1) {
            // If it's the first page, replace the list
            jobList = jobListModel!.data!.data!;
          } else {
            _jobList.addAll(jobListModel!.data!.data!);
          }
          totalPage.value = jobListModel!.data!.total!;
          isLoading.value = false;
          update(); // Notify listeners of changes
        })
        .catchError((error) {
          isLoading.value = false;
          print("Error fetching data: $error");
        });
  }

  void getDataRefresh() {
    if (isLoading.value) return; // Prevent duplicate requests
    isLoading.value = true;

    StartUpService.networkProvider!.getCallQuery(ApiPath.jobListUrl, {"query": searchController?.text ?? ""})
        .then((value) {
          jobListModel = JobListModel.fromJson(value.body);
          jobList = jobListModel!.data!.data!;
          isLoading.value = false;
        })
        .catchError((error) {
          jobList = [];
          isLoading.value = false;
          print("Error refreshing data: $error");
        });
  }

  void addRemoveBookmark(int index) {
    if (isLoading.value) return; // Prevent duplicate requests
    Get.log("Job ID: ${jobList[index].id}");
    StartUpService.networkProvider!.getCommonCall(ApiPath.bookMark, {"job_id": jobList[index].id})
        .then((value) {
          if (value.body["status"] == 1) {
            jobList[index].isFav = jobList[index].isFav == 0 ? 1 : 0;
            update(); // Notify listeners of changes
            bakeToast(value.body["message"], type: ToastType.success);
          } else {
            bakeToast(value.body["message"], type: ToastType.error);
          }
        })
        .catchError((error) {
          print("Error adding/removing bookmark: $error");
        });
  }
}
