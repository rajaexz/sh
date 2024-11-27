import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:school_hiring/models/school_list_model.dart';
import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class FavoriteSchoolController extends GetxController {
  SchoolListModel? schoolListModel;

  bool isError = false;

  RxBool isLoading = true.obs;

  RxList<Datum> _schoolList = <Datum>[].obs;

  get schoolList => _schoolList.value;
  set schoolList(index) => _schoolList.value = index;

  int currentPage = 1;

  @override
  void onInit() {
    getData();
    super.onInit();
  }
@override
  void onReady() {
    getDataRefresh();
    print("===================================1");
    super.onReady();
  }
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
 getData() async {
  print("Fetching data...");
  isLoading.value = true;

  try {
    final response = await StartUpService.networkProvider!.getCall(ApiPath.addmyFavouriteCompany);

    print("Response received: ${response.body}");

    if (response.statusCode == 200) {
      schoolListModel = SchoolListModel.fromJson(response.body);
print("School list updated with ${schoolList.length} items.");
      if (schoolListModel != null && schoolListModel!.data != null) {
        schoolList = schoolListModel!.data!.data!;
        print("School list updated with ${schoolList.length} items.");
      } else {
        schoolList = [];
        print("No data available in the response.");
      }

      isError = false;
    } else {
      isError = true;
      print("Error: Status code ${response.statusCode}");
    }
  } catch (error) {
    schoolListModel = SchoolListModel(status: 1, message: "", data: Data(data: []));
    schoolList = [];
    isError = true;
    print("Error occurred: $error");
  } finally {
    isLoading.value = false;
    update();
  }
}



void getDataRefresh() async {
  try {
    final response = await StartUpService.networkProvider!.getCall(ApiPath.addmyFavouriteCompany);

    if (response.statusCode == 200) {
      schoolListModel = SchoolListModel.fromJson(response.body);

      if (schoolListModel != null && schoolListModel!.data != null) {
        _schoolList.value = schoolListModel!.data!.data!; // Use the RxList to update the UI
      } else {
        _schoolList.value = []; // Handle empty data case
      }
    } else {
      _schoolList.value = []; // Handle unsuccessful response
      print("Error: Status code ${response.statusCode}");
    }
  } catch (error) {
    _schoolList.value = []; // Handle network or parsing errors
    print("Error occurred: $error");
  } finally {
    update(); // Ensure the UI is updated
  }
}


}
