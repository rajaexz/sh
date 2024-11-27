import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/my_project_model.dart';
import 'package:school_hiring/network/api_path.dart';
import 'package:school_hiring/services/startup_service.dart';

import '../../utility/app_constant.dart';

class EditProjectController extends GetxController {
  RxBool _isLoading = false.obs;

  get isLoading_ => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  List<int> selectMajorSubjectId = [];

  TextEditingController? descriptionController;
    TextEditingController? urlController;
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);
  TextEditingController? nameController;
  TextEditingController? dateStartController;
  TextEditingController? endDateController;
  Datum? model;

  @override
  void onInit() {
    super.onInit();
    model = Get.arguments[0];
    Get.log("EDU Model ::: ${model!.toJson().toString()}");
    initController();
        prefillData();
  }

  void initController() {
    descriptionController = TextEditingController();
    nameController = TextEditingController();
    dateStartController = TextEditingController();
    endDateController = TextEditingController();
urlController  = TextEditingController();
  }

  void disposeController() {
    descriptionController!.dispose();
    nameController!.dispose();
    dateStartController!.dispose();
    endDateController!.dispose();
    urlController!.dispose();
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }

  void prefillData() {
    descriptionController!.text = model!.description;
    nameController!.text = model!.name;
    dateStartController!.text = AppConstant.getDateFormat.format(model!.dateStart);
    endDateController!.text = AppConstant.getDateFormat.format(model!.dateEnd);
    startDate.value = model!.dateStart;
    endDate.value = model!.dateEnd;
    urlController!.text = model!.url;
  }

  dynamic formData() => {
        "id": model!.id,
        "description": descriptionController!.text,
        "name": nameController!.text,
           "url":"https://ems.dextrousinfosolutions.com/dextrouscrm/admin/tasks",
   "date_start": startDate.value?.toIso8601String() ?? "",
        // ignore: unnecessary_null_comparison
     "is_on_going":1,
            "date_end": endDate.value?.toIso8601String() ?? "",
      };
  void fetchInitialData() {
    isLoading = true;
    StartUpService.networkProvider!
        .getCall(ApiPath.getProjcetView)
        .then((value) {
      model = Datum.fromJson(value.body['data']);
      isLoading = false;
    }).catchError((error) {
      isLoading = false;
    });
  }
void addProject() {
  showLoader(isModal: true);
      update();
  print(formData());

  StartUpService.networkProvider!
      .getCommonCall(ApiPath.editProjcet, formData())
      .then((value) {
    if (value.body["status"] == 1) {
      update();
      fetchInitialData(); // Fetch any required data
      Get.back(result: true); // Pass true as the result to indicate success
        Get.forceAppUpdate();
      bakeToast(value.body["message"], type: ToastType.success);
    } else {
      update();
      bakeToast(value.body["message"], type: ToastType.error);
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
