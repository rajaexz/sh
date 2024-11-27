import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/school_list_model.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class SchoolListController extends GetxController {
  RxInt? totalPage = 0.obs;
  ScrollController? scrollController;
  TextEditingController? searchController;
  Map<String, dynamic> filterParams = {};
  SchoolListModel? schoolListModel;

  bool isError = false;

  RxBool isLoading = true.obs;

  RxList<Datum> _schoolList = <Datum>[].obs;

  get schoolList => _schoolList.value;
  set schoolList(index) => _schoolList.value = index;

  int currentPage = 1;

  void pagination() {
    if ((scrollController!.position.pixels >=
            scrollController!.position.maxScrollExtent -
                100) && // Adding a small buffer
        (currentPage < totalPage!.value)) {
      print("Pagination Triggered");
      currentPage++;
      getData();
    }
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController!.addListener(pagination);
    searchController = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController
        ?.dispose(); // Dispose the ScrollController to prevent memory leaks
    super.dispose();
  }

  void getDataRefresh() {
    StartUpService.networkProvider!.getCallQuery(ApiPath.schoolListUrl,
        {"query": searchController!.text ?? ""}).then((value) {
      schoolListModel = SchoolListModel.fromJson(value.body);
      _schoolList.value =
          schoolListModel!.data!.data!; // Use the RxList to update the UI
      update();
    }).catchError((error) {
      _schoolList.value = [];
      update();
      throw error;
    });
  }

   getData() {
    isLoading.value = true;
    try {
      StartUpService.networkProvider!
          .getCall("${ApiPath.schoolListUrl}?page=$currentPage")
          .then((value) {
        schoolListModel = SchoolListModel.fromJson(value.body);
        schoolList.addAll(schoolListModel!
            .data!.data!); // Append new data to the existing list
        totalPage!.value = schoolListModel!.data!.total!;
        isLoading.value = false;
        isError = false;
        update();
      }).catchError((error) {
        isError = true;
        isLoading.value = false;
        update();
      });
    } catch (e) {
      print(e);
    }
  }

  void favouritejobs({required String id}) async {
    showLoader(isModal: true);
    try {
      final response = await StartUpService.networkProvider!
          .getCommonCallW(ApiPath.addfavoritecompany, {"company_id": id});

      var json = response.body;
      print(json);
      if (json["status"] == 1) {
        bakeToast(json["message"], type: ToastType.success);
        for (var school in schoolList) {
          if (school.id.toString() == id) {
            school.isFavouritesCompany = school.isFavouritesCompany == 1
                ? 0
                : 1; // Toggle the favorite status

            break;
          }
        }
        update();

        schoolList.refresh(); // Refresh the jobList to update the UI
        // Optionally refresh the entire list
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
