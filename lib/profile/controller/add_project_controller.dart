import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/my_project_model.dart';
import 'package:school_hiring/network/api_path.dart';
import 'package:school_hiring/services/startup_service.dart';
import 'package:share_plus/share_plus.dart';

class AddProjcetController extends GetxController {
  RxBool _isLoading = false.obs;
  MyProjectModel? model;
  get isLoading => _isLoading.value;
  set isLoading(index) => _isLoading.value = index;
Rx<XFile?> imageFile = Rx<XFile?>(null);
  List<int> selectMajorSubjectId = [];

  TextEditingController? descriptionController;

  TextEditingController? titleController;
    TextEditingController? urlController;

  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);
  final DateFormat displayFormatter = DateFormat('MMM dd, yyyy');

  String get formattedStartDate =>
      startDate.value == null ? '' : displayFormatter.format(startDate.value!);

  String get formattedEndDate =>
      endDate.value == null ? '' : displayFormatter.format(endDate.value!);
  void initController() {
    descriptionController = TextEditingController();
  titleController = TextEditingController();
  urlController= TextEditingController();
  }

  void disposeController() {
    descriptionController!.dispose();
    titleController!.dispose();
    urlController!.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
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

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  dynamic formData() => {
       "name":titleController?.text ?? "",
      "description": descriptionController?.text ?? "",
      "date_start": startDate.value?.toIso8601String() ?? "",
      "is_on_going":1,
      "url":urlController!.text.toString(),
      "date_end": endDate.value?.toIso8601String() ?? "",
      
      };


  void fetchInitialData() {
    isLoading = true;
    StartUpService.networkProvider!
        .getCall(ApiPath.getProjcetView)
        .then((value) {
      model = MyProjectModel.fromJson(value.body);
      isLoading = false;
    }).catchError((error) {
      isLoading = false;
    });
  }

  void addProjcet() {
    print(formData());
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!
        .getCommonCall(ApiPath.addProjcet,formData())
        .then((value) {
      if (value.body["status"] == 1) {
        Get.back();
        fetchInitialData();
        bakeToast(value.body["message"], type: ToastType.success);
      } else {
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
