import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:path/path.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class AddResumeController extends GetxController {
  TextEditingController? resumeTitle;
  RxBool _isDefault = false.obs;

  get isDefault => _isDefault.value;
  set isDefault(index) => _isDefault.value = index;

  FilePickerResult? filePickerResult;
  Rx<File> _selectedResume = File("").obs;
  String? fileName;

  get selectedResume => _selectedResume.value;
  set selectedResume(index) => _selectedResume.value = index;

  @override
  void onInit() {
    resumeTitle = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    resumeTitle!.dispose();
    hideLoader();
    super.dispose();
  }

  @override
  void onClose() {
    hideLoader();
    super.onClose();
  }

  // File picker for selecting a resume file
  void pickFile() {
    FilePicker.platform.pickFiles(
      allowMultiple: false,
    ).then((value) {
      if (value != null) {
        selectedResume = File(value.files.single.path!);
        fileName = basename(selectedResume.path);
        Get.log("Selected Resume ::: ${selectedResume.path}");
      } else {
        bakeToast("No file selected", type: ToastType.error);
      }
    });
  }

  // Form data preparation
  dynamic formData() => {
        "title": resumeTitle!.text.isNotEmpty ? resumeTitle!.text : fileName,
        "is_default": 1,
        "cv_file": selectedResume.path.isNotEmpty
            ? MultipartFile(selectedResume, filename: fileName!, contentType: 'multipart/form-data')
            : "",
      };

  // Validate form fields before submitting
  bool validateFields() {
    if (resumeTitle!.text.isEmpty) {
      bakeToast("Resume title cannot be empty", type: ToastType.error);
      return false;
    }
    if (selectedResume.path.isEmpty) {
      bakeToast("Please select a resume file", type: ToastType.error);
      return false;
    }
    return true;
  }

  // Add resume function with validation
  void addResume() {
    if (validateFields()) {
      showLoader(isModal: true);
      update();

      StartUpService.networkProvider!
          .getCommonCallMultiPart(ApiPath.addResume, formData())
          .then((value) {
        hideLoader();
        update();
        if (value.body["status"] == 1) {
          Get.back();
          bakeToast(value.body["message"], type: ToastType.success);
        } else {
          bakeToast(value.body["message"], type: ToastType.error);
        }
      }).catchError((error) {
        hideLoader();
        update();
        bakeToast("Error occurred: $error", type: ToastType.error);
      });
    }
  }
}
