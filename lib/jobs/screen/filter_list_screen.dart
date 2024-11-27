import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_hiring/jobs/controller/filter_list_controller.dart';
import 'package:school_hiring/utility/naukri_enum.dart';
import 'package:school_hiring/utility/static_database.dart';

import '../../utility/styles.dart';
import '../../utility/utility.dart';
import '../../utility/widget_helper.dart';

class FilterListScreen extends GetView<FilterListController> {
  const FilterListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FilterListController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Filter"),
      ),
      body: GetBuilder<FilterListController>(
        init: controller,
        builder: (controller) => Obx(() => _buildUI()),
      ),
    );
  }

  Widget _buildUI() {
    if (controller.isLoading) {
      return Utility.progressIndicator();
    } else {
      return JobFilterView(
        controller: controller,
      );
    }
  }
}

class JobFilterView extends StatelessWidget {
  final FilterListController? controller;
  const JobFilterView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: Get.height,
              width: Get.width,
              //color: Colors.blue,

              child: Row(
                children: [
                  _keyRow(),
                  Container(
                    width: 0.5,
                    height: Get.height,
                    color: Colors.white,
                  ),
                  _keyValues()
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            width: Get.width,
            child: Row(
              children: [
                Expanded(
                    child: AppThemeButton(
                  onClick: () {
                    controller!.resetFilters();
                  },
                  textColor: Colors.white,
                  color: Colors.red.withOpacity(0.80),
                  label: "Reset",
                )),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: AppThemeButton(
                  onClick: () {
                    controller!.applyFilters();
                  },
                  textColor: Colors.white,
                  color: Get.theme.primaryColor,
                  label: "Apply",
                )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _keyRow() => Container(
        height: Get.height,
        width: Get.width * 0.35,
        color: Colors.grey.withOpacity(0.1),
        child: ListView.separated(
            separatorBuilder: (context, index) => Container(
                  color: Get.theme.primaryColor,
                  width: 0.5,
                  height: 1,
                ),
            padding: EdgeInsets.zero,
            itemCount: StaticDatabase.filterList.length,
            itemBuilder: (context, index) => ColoredBox(
                  color: controller!.selectedRightIndex == index
                      ? Get.theme.primaryColor
                      : Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      controller!.selectedRightIndex = index;
                      selElement(index);
                    },
                    dense: true,
                    title: Text(
                      StaticDatabase.filterList.elementAt(index).title!,
                      maxLines: 2,
                      textScaler: TextScaler.linear(Get.textScaleFactor),
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    //trailing: Obx(() => controller!.selectedRightIndex == index ? Icon(Icons.check_circle,color: Colors.green,) : Icon(Icons.check,color: Colors.grey,)),
                  ),
                )),
      );

  Widget _keyValues() => Expanded(
          child: Container(
        height: Get.height,
        width: Get.width,
        child: controller!.getFilterModel().data!.isEmpty
            ? _keyValuesNo()
            : ListView.separated(
                separatorBuilder: (context, index) => Container(
                      color: Get.theme.primaryColor,
                      width: 0.5,
                      height: 1,
                    ),
                padding: EdgeInsets.zero,
                itemCount: controller!.getFilterModel().data!.length,
                itemBuilder: (context, index) => ColoredBox(
                      color: Colors.transparent,
                      child: ListTile(
                        dense: true,
                        onTap: () {
                          Get.log("sss");
                          //controller!.getFilterModel().data!.elementAt(index).isSelected = true;
                          // controller!.filterListModel!.data!.elementAt(controller!.selectedIndex!).data!.elementAt(index).isChecked = !controller!.filterListModel!.data!.elementAt(controller!.selectedIndex!).data!.elementAt(index).isChecked!;
                          // controller!.filterListModel!.data!.elementAt(controller!.selectedIndex!).filterValue = controller!.getBrand(controller!.selectedIndex!);
                          // controller!.update();
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        title: Text(
                          controller!
                              .getFilterModel()
                              .data!
                              .elementAt(index)
                              .value!,
                          style: TextStyle(
                              color: Get.theme.colorScheme.secondary,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                        trailing: Obx(() => IconButton(
                              onPressed: () {
                                controller!
                                        .getFilterModel()
                                        .data!
                                        .elementAt(index)
                                        .isSelected =
                                    !controller!
                                        .getFilterModel()
                                        .data!
                                        .elementAt(index)
                                        .isSelected!;
                                controller!.update();
                                print(controller!
                                    .getFilterModel()
                                    .data!
                                    .elementAt(index)
                                    .isSelected);
                              },
                              icon: controller!
                                      .getFilterModel()
                                      .data!
                                      .elementAt(index)
                                      .isSelected!
                                  ? const Icon(
                                      Icons.check_box,
                                      color: Colors.green,
                                    )
                                  : Icon(
                                      Icons.check_box_outline_blank_outlined,
                                      color: Colors.grey,
                                    ),
                            )),
                        //trailing: Obx(() => controller!.selectedFilterModel!.data!.elementAt(index).isSelected! ? Icon(Icons.check_circle,color: Colors.green,) : Icon(Icons.check,color: Colors.grey,)),
                      ),
                    )),
      ));

  Widget _keyValuesNo() => Expanded(
          child: Container(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Text("No Filter Selected"),
        ),
      ));

  void selElement(index) {
    if (StaticDatabase.filterList.elementAt(index).value ==
        filterListEnum.experience) {
      controller!.selectedFilterModel = controller!.experienceFilterModel;
    } else if (StaticDatabase.filterList.elementAt(index).value ==
        filterListEnum.career) {
      controller!.selectedFilterModel = controller!.careerFilterModel;
    } else if (StaticDatabase.filterList.elementAt(index).value ==
        filterListEnum.industry) {
      controller!.selectedFilterModel = controller!.industryFilterModel;
    } else if (StaticDatabase.filterList.elementAt(index).value ==
        filterListEnum.functionalArea) {
      controller!.selectedFilterModel = controller!.functionalAreaFilterModel;
    } else if (StaticDatabase.filterList.elementAt(index).value ==
        filterListEnum.state) {
      controller!.selectedFilterModel = controller!.stateFilterModel;
    } else if (StaticDatabase.filterList.elementAt(index).value ==
        filterListEnum.resultType) {
      controller!.selectedFilterModel = controller!.resultTypeFilterModel;
    } else if (StaticDatabase.filterList.elementAt(index).value ==
        filterListEnum.skill) {
      controller!.selectedFilterModel = controller!.skillFilterModel;
    } else if (StaticDatabase.filterList.elementAt(index).value ==
        filterListEnum.language) {
      controller!.selectedFilterModel = controller!.languageFilterModel;
    } else if (StaticDatabase.filterList.elementAt(index).value ==
        filterListEnum.majorSubject) {
      controller!.selectedFilterModel = controller!.majorSubjectFilterModel;
    } else if (StaticDatabase.filterList.elementAt(index).value ==
        filterListEnum.degreeLevel) {
      controller!.selectedFilterModel = controller!.degreeLevelFilterModel;
    }
    controller!.update();
  }
}
