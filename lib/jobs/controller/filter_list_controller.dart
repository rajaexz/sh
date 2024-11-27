import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:school_hiring/jobs/screen/job_list_screen.dart';
import 'package:school_hiring/models/filter_model.dart';
import 'package:school_hiring/network/api_path.dart';
import 'package:school_hiring/services/startup_service.dart';

import '../../utility/naukri_enum.dart';
import '../../utility/static_database.dart';

class FilterListController extends GetxController {
  RxBool _isLoading = false.obs;
  RxInt _selectedRightIndex = 0.obs;
  RxList<int> _selectedExpeLevel = <int>[].obs;

  get isLoading => _isLoading.value;
  set isLoading(index) => _isLoading.value = index;

  get selectedRightIndex => _selectedRightIndex.value;
  set selectedRightIndex(index) => _selectedRightIndex.value = index;

  get selectedExpeLevel => _selectedExpeLevel.value;
  set selectedExpeLevel(index) => _selectedExpeLevel.value = index;

  List<Map<String, String>> experienceIDList = [];

  FilterModel? experienceFilterModel;
  FilterModel? careerFilterModel;
  FilterModel? industryFilterModel;
  FilterModel? functionalAreaFilterModel;
  FilterModel? stateFilterModel;
  FilterModel? resultTypeFilterModel;
  FilterModel? skillFilterModel;
  FilterModel? languageFilterModel;
  FilterModel? languageAreaFilterModel;
  FilterModel? majorSubjectFilterModel;
  FilterModel? degreeLevelFilterModel;

  Rx<FilterModel>? _selectedFilterModel = FilterModel(data: []).obs;

  get selectedFilterModel => _selectedFilterModel!.value;
  set selectedFilterModel(index) => _selectedFilterModel!.value = index;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchInitialData();
    super.onInit();
  }

  void fetchInitialData() {
    isLoading = true;

    StartUpService.networkProvider!.get(ApiPath.filterExperience).then((value) {
      experienceFilterModel = FilterModel.fromJson(value.body);

      return StartUpService.networkProvider!.get(ApiPath.filterCareedLevels);
    }).then((value) {
      careerFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.get(ApiPath.filterIndustries);
    }).then((value) {
      industryFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.get(ApiPath.filterFunctionalArea);
    }).then((value) {
      functionalAreaFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.get(ApiPath.filterState);
    }).then((value) {
      stateFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.get(ApiPath.filterResultTYpe);
    }).then((value) {
      resultTypeFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.get(ApiPath.filterJobSkill);
    }).then((value) {
      skillFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.get(ApiPath.filterLanguage);
    }).then((value) {
      languageFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.get(ApiPath.filterMajorSubject);
    }).then((value) {
      majorSubjectFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.get(ApiPath.filterDegreeLevelUrl);
    }).then((value) {
      degreeLevelFilterModel = FilterModel.fromJson(value.body);
      return StartUpService.networkProvider!.get(ApiPath.filterLanguagelevel);
    }).then((value) {
      languageAreaFilterModel = FilterModel.fromJson(value.body);
      isLoading = false;
    }).catchError((error) {
      isLoading = false;
    });
  }

  FilterModel getFilterModel() {
    if (StaticDatabase.filterList.elementAt(selectedRightIndex).value ==
        filterListEnum.experience) {
      return experienceFilterModel!;
    } else if (StaticDatabase.filterList.elementAt(selectedRightIndex).value ==
        filterListEnum.career) {
      return careerFilterModel!;
    } else if (StaticDatabase.filterList.elementAt(selectedRightIndex).value ==
        filterListEnum.industry) {
      return industryFilterModel!;
    } else if (StaticDatabase.filterList.elementAt(selectedRightIndex).value ==
        filterListEnum.functionalArea) {
      return functionalAreaFilterModel!;
    } else if (StaticDatabase.filterList.elementAt(selectedRightIndex).value ==
        filterListEnum.state) {
      return stateFilterModel!;
    } else if (StaticDatabase.filterList.elementAt(selectedRightIndex).value ==
        filterListEnum.resultType) {
      return resultTypeFilterModel!;
    } else if (StaticDatabase.filterList.elementAt(selectedRightIndex).value ==
        filterListEnum.skill) {
      return skillFilterModel!;
    } else if (StaticDatabase.filterList.elementAt(selectedRightIndex).value ==
        filterListEnum.language) {
      return languageFilterModel!;
    } else if (StaticDatabase.filterList.elementAt(selectedRightIndex).value ==
        filterListEnum.majorSubject) {
      return majorSubjectFilterModel!;
    } else if (StaticDatabase.filterList.elementAt(selectedRightIndex).value ==
        filterListEnum.degreeLevel) {
      return degreeLevelFilterModel!;
    }
    return FilterModel(data: []);
  }

  void applyFilters() {
    final selectedFilters = <String, List<String>>{};

    // Collect selected filter values
    if (experienceFilterModel != null) {
      selectedFilters['job_experience_id'] = experienceFilterModel!.data!
          .where((item) => item.isSelected == true)
          .map((item) => item.id.toString()!)
          .toList();
    }

    if (careerFilterModel != null) {
      selectedFilters['career_level_id'] = careerFilterModel!.data!
          .where((item) => item.isSelected == true)
          .map((item) => item.id.toString()!)
          .toList();
    }
    // Repeat for other filters if needed
    if (industryFilterModel != null) {
      selectedFilters['industry'] = industryFilterModel!.data!
          .where((item) => item.isSelected == true)
          .map((item) => item.id.toString()!)
          .toList();
    }
    if (functionalAreaFilterModel != null) {
      selectedFilters['functional_area_id'] = functionalAreaFilterModel!.data!
          .where((item) => item.isSelected == true)
          .map((item) => item.id.toString()!)
          .toList();
    }
    if (stateFilterModel != null) {
      selectedFilters['state_id'] = stateFilterModel!.data!
          .where((item) => item.isSelected == true)
          .map((item) => item.id.toString())
          .toList();
    }

    if (skillFilterModel != null) {
      selectedFilters['skill_id'] = skillFilterModel!.data!
          .where((item) => item.isSelected == true)
          .map((item) => item.id.toString()!)
          .toList();
    }

    if (resultTypeFilterModel != null) {
      selectedFilters['result_type_id'] = resultTypeFilterModel!.data!
          .where((item) => item.isSelected == true)
          .map((item) => item.id.toString()!)
          .toList();
    }
    if (languageFilterModel != null) {
      selectedFilters['language_id'] = languageFilterModel!.data!
          .where((item) => item.isSelected == true)
          .map((item) => item.id.toString()!)
          .toList();
    }
      if (majorSubjectFilterModel != null) {
      selectedFilters['major_subject_id'] = majorSubjectFilterModel!.data!
          .where((item) => item.isSelected == true)
          .map((item) => item.id.toString()!)
          .toList();
    }

       if (degreeLevelFilterModel != null) {
      selectedFilters['degree_level_id'] = degreeLevelFilterModel!.data!
          .where((item) => item.isSelected == true)
          .map((item) => item.id.toString())
          .toList();
    }
    // Handle the selected filters as needed
    print('Selected Filters: $selectedFilters');

    // Example: navigate to a new screen or update the UI
    Get.off(() => JobListScreen(filterData: selectedFilters));
resetFilters();

  }

  // Method to reset filters
  void resetFilters() {
    // Reset all filters to default or initial state
    // For example:
    experienceFilterModel?.data?.forEach((item) => item.isSelected = false);
    careerFilterModel?.data?.forEach((item) => item.isSelected = false);
degreeLevelFilterModel?.data?.forEach((item) => item.isSelected = false);
majorSubjectFilterModel?.data?.forEach((item) => item.isSelected = false);
languageFilterModel?.data?.forEach((item) => item.isSelected = false);
resultTypeFilterModel?.data?.forEach((item) => item.isSelected = false);
functionalAreaFilterModel?.data?.forEach((item) => item.isSelected = false);
industryFilterModel?.data?.forEach((item) => item.isSelected = false);
skillFilterModel!.data?.forEach((item) => item.isSelected = false);
stateFilterModel?.data?.forEach((item) => item.isSelected = false);
    // Repeat for other filters if needed
    update(); // Notify listeners
  }
}
