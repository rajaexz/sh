import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/job_skill_model.dart';
import 'package:school_hiring/models/my_education_model.dart';
import 'package:school_hiring/models/profile_detail_model.dart';
import 'package:school_hiring/models/user_experience_model.dart';
import 'package:school_hiring/models/vc_list_model.dart';

import '../../models/ProfileSummary.dart';
import '../../models/my_Language_model.dart';
import '../../models/my_project_model.dart';
import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class ProfileDetailController extends GetxController {
  RxBool _isLoading = false.obs;

  get isLoading => _isLoading.value;
  set isLoading(index) => _isLoading.value = index;

  ProfileDetailModel? profileDetailModel;
  CvListModel? cvListModel;
  JobSkillModel? jobSkillModel;
  UserExperienceModel? userExperienceModel;
  MyEducationModel? myEducationModel;

  MyProjectModel? myProjcetModel;
  MyLanguageModel? myLanguageModel;
  ProfileSummary? profileSummaryModel;

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  getData() {
    isLoading = true;
    StartUpService.networkProvider!
        .getCall(ApiPath.getProfileUrl)
        .then((value) {
      profileDetailModel = ProfileDetailModel.fromJson(value.body);

      return StartUpService.networkProvider!.getCall(ApiPath.getCVUrl);
    }).then((value) {
      cvListModel = CvListModel.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.getJobSkill);
    }).then((value) {
      jobSkillModel = JobSkillModel.fromJson(value.body);

      return StartUpService.networkProvider!.getCall(ApiPath.getJobExperience);
    }).then((value) {
      userExperienceModel = UserExperienceModel.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.getMyEducation);
    }).then((value) {
      myEducationModel = MyEducationModel.fromJson(value.body);

      return StartUpService.networkProvider!
          .getCall(ApiPath.getSummarySplitAPI);
    }).then((value) {
      profileSummaryModel = ProfileSummary.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.getProjcetView);
    }).then((value) {
      myProjcetModel = MyProjectModel.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.getLanguageView);
    }).then((value) {
      myLanguageModel = MyLanguageModel.fromJson(value.body);
      isLoading = false;
    }).catchError((error) {
      isLoading = false;
      throw error;
    });
  }

  void getDataRefresh() {
    StartUpService.networkProvider!
        .getCall(ApiPath.getProfileUrl)
        .then((value) {
      profileDetailModel = ProfileDetailModel.fromJson(value.body);

      return StartUpService.networkProvider!.getCall(ApiPath.getCVUrl);
    }).then((value) {
      cvListModel = CvListModel.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.getJobSkill);
    }).then((value) {
      jobSkillModel = JobSkillModel.fromJson(value.body);

      return StartUpService.networkProvider!.getCall(ApiPath.getJobExperience);
    }).then((value) {
      userExperienceModel = UserExperienceModel.fromJson(value.body);
      return StartUpService.networkProvider!.getCall(ApiPath.getMyEducation);
    }).then((value) {
      myEducationModel = MyEducationModel.fromJson(value.body);
   return StartUpService.networkProvider!.getCall(ApiPath.getLanguageView);
    }).then((value) {
      myLanguageModel = MyLanguageModel.fromJson(value!.body);
      update();
    }).catchError((error) {
      throw error;
    });
  }

  void removeCV(int index) {
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.deleteCVs,
        {"id": cvListModel!.data!.elementAt(index).id}).then((value) {
      if (value.body["status"] == 1) {
        cvListModel!.data!.removeAt(index);

        Get.back();
        bakeToast(value.body["message"], type: ToastType.success);
      } else {
        bakeToast(value.body["message"], type: ToastType.error);
      }
      hideLoader();
      update();
    }).catchError((error) {
      hideLoader();
      update();
    });
  }

  void removeSkill(int index) {
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.deleteSkill,
        {"id": jobSkillModel!.data!.elementAt(index).id}).then((value) {
      if (value.body["status"] == 1) {
        jobSkillModel!.data!.removeAt(index);
        Get.back();
        bakeToast(value.body["message"], type: ToastType.success);
      } else {
        bakeToast(value.body["message"], type: ToastType.error);
      }
      hideLoader();
      update();
    }).catchError((error) {
      hideLoader();
      update();
    });
  }

  void removeEducation(int index) {
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.deleteEducation,
        {"id": myEducationModel!.data!.elementAt(index).id}).then((value) {
      if (value.body["status"] == 1) {
        myEducationModel!.data!.removeAt(index);
        Get.back();
        bakeToast(value.body["message"], type: ToastType.success);
      } else {
        bakeToast(value.body["message"], type: ToastType.error);
      }
      hideLoader();
      update();
    }).catchError((error) {
      hideLoader();
      update();
    });
  }

  void removeProjcet(int index) {
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.deleteProject,
        {"id": myProjcetModel!.data!.elementAt(index).id}).then((value) {
      if (value.body["status"] == 1) {
        myProjcetModel!.data!.removeAt(index);
        Get.back();
        bakeToast(value.body["message"], type: ToastType.success);
      } else {
        bakeToast(value.body["message"], type: ToastType.error);
      }
      hideLoader();
      update();
    }).catchError((error) {
      hideLoader();
      update();
    });
  }
  void removelauguage(int index) {
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.deletelauguage,
        {"id": myLanguageModel!.data!.elementAt(index).id}).then((value) {
      if (value.body["status"] == 1) {
        myLanguageModel!.data!.removeAt(index);
        Get.back();
        bakeToast(value.body["message"], type: ToastType.success);
      } else {
        bakeToast(value.body["message"], type: ToastType.error);
      }
      hideLoader();
      update();
    }).catchError((error) {
      hideLoader();
      update();
    });
  }

  void removeExperience(int index) {
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.deleteExperience,
        {"id": userExperienceModel!.data!.elementAt(index).id}).then((value) {
      if (value.body["status"] == 1) {
        userExperienceModel!.data!.removeAt(index);
        Get.back();
        bakeToast(value.body["message"], type: ToastType.success);
      } else {
        bakeToast(value.body["message"], type: ToastType.error);
      }
      hideLoader();
      update();
    }).catchError((error) {
      hideLoader();
      update();
    });
  }
}
