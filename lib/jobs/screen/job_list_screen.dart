import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_hiring/jobs/controller/job_list_controller.dart';
import 'package:school_hiring/models/job_list_model.dart';
import 'package:school_hiring/pages/pages.dart';
import 'package:school_hiring/utility/utility.dart';

import '../../utility/app_constant.dart';
import '../../utility/custom_widget.dart';
import '../../utility/styles.dart';
import '../../utility/widget_helper.dart';

class JobListScreen extends GetView<JobListController> {
   // ignore: prefer_typing_uninitialized_variables
   var filterData ;
   JobListScreen({super.key , this.filterData});

  @override
  Widget build(BuildContext context) {


 

    Get.put(JobListController());
     if (filterData != null) {
      controller.setFilter(filterData!); // Pass filter data to controller
    }
    return Scaffold(
      appBar: AppBar( 
        title: const Text("Job List"),
      ),
      body: GetBuilder<JobListController>(
        init: controller,
        builder: (controller) => RefreshIndicator(
            onRefresh: () async {
              await controller.getData();
            },
            child: _buildUI()),
      ),
    );
  }

  Widget _buildUI() {
    if (controller.isLoading.value) {
      return Utility.progressIndicator();
    } else {
      return JobListView(
        controller: controller,
      );
    }
  }
}

class JobListView extends StatelessWidget {
  final JobListController? controller;
  const JobListView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: BikeTextField(
                  textEditingController: controller!.searchController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Search by keyword",
                  label: "",
                  isCircular: true,
                  suffixIcon:
                      const Icon(IconData(0xf37d, fontFamily: 'MaterialIcons')),
                  onChanged: (String? value) {
                    if (value.toString().length > 3) {
                      controller!.getDataRefresh();
                    } else {
                      controller!.getDataRefresh();
                    }
                  },
                  actionIcon: const InkWell(
                    child: Icon(Icons.search),
                  ),
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: false,
                  obscureText: false,
                )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Get.theme.colorScheme.secondary,
                      shape: BoxShape.circle
                      //borderRadius: BorderRadius.all(Radius.circular(5.0))
                      ),
                  child: IconButton(
                    onPressed: () async {
                      final filters = await Get.toNamed(Routes.jobFilterScreen);
                      if (filters != null) {
                        controller!.setFilter(filters);
                      }    },
                    icon: Icon(
                      Icons.filter_alt,
                      color: Get.theme.secondaryHeaderColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Obx(() => _showJobList()),
          ),
        ],
      ),
    );
  }

  Widget _showJobList() => ListView.builder(
      itemCount: controller!.jobList!.length,
      controller: controller!.scrollController,
      itemBuilder: (context, index) {
        // physics: NeverScrollableScrollPhysics(),

        return _jobCardAlternate(controller!.jobList!.elementAt(index), index);
      });

  Widget _jobCardAlternate(Datum model, int index) => GestureDetector(
        onTap: () {
          Get.toNamed(Routes.jobDetailScreen, arguments: [model.id]);
        },
        child: Container(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.black : Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(20.0),
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Utility.profileAvatar(
                        model.companyLogo ?? AppConstant.dummyImage,
                        50,
                        50,
                        BoxShape.circle),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.title!.capitalizeFirst!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Get.theme.textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            "${model.city!.capitalizeFirst!}, ${model.state?.capitalizeFirst ?? ""}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Get.theme.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(
                  model.companyName!.capitalizeFirst!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Get.theme.textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Get.isDarkMode ? Colors.grey : Colors.black87,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.briefcase,
                            size: 14.0, color: Colors.grey),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          child: Text(
                            "Experience: ",
                            style: Get.theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 2),
                    Text(
                      model.jobExperience!.capitalizeFirst! ?? "",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'medium',
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.solidClock,
                            size: 14.0, color: Colors.grey),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          child: Text(
                            "Job type: ",
                            style: Get.theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 2),
                    Text(
                      model.jobType!.capitalizeFirst! ?? "",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'medium',
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.userFriends,
                            size: 16.0, color: Colors.grey),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          child: Text(
                            "Num Of Positions: ",
                            style: Get.theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 2),
                    Text(
                      model.numOfPositions!.toString().capitalizeFirst! ?? "",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'medium',
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                    child: SizedBox(
                      height: 30,
                      width: 150,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.jobDetailScreen,
                              arguments: [model.id]);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Get.theme.colorScheme.secondary,
                          // Text color
                          padding: EdgeInsets.zero, // Remove padding
                          minimumSize: const Size(double.infinity,
                              45), // Ensure button has the correct height
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners if needed
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "More Details",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            AppConstant.currencyUnicode,
                            style: Get.theme.textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:
                                  Get.isDarkMode ? Colors.grey : Colors.black87,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                     model.hideSalary == 1    ?  Text(
                                  "Not Disclosed",
                                  style:
                                      Get.theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade600,
                                  ),
                                ) :
                      
                             ["0", null, 0, "null"].contains(model.salaryFrom)
                              ? Text(
                                  "Not Disclosed",
                                  style:
                                      Get.theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade600,
                                  ),
                                )
                              : Text(
                                  "${AppConstant.formattedNumber(model.salaryFrom)} - ${AppConstant.formattedNumber(model.salaryTo)}",
                                  style:
                                      Get.theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Get.isDarkMode
                                        ? Colors.grey
                                        : Colors.black87,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget _jobCardSecondary(Datum model, int index) => GestureDetector(
        onTap: () {
          Get.toNamed(Routes.jobDetailScreen, arguments: [model.id]);
        },
        child: Card(
          elevation: 1.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            padding: const EdgeInsets.all(18.0),
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Utility.profileAvatar(
                            model.companyLogo ?? AppConstant.dummyImage,
                            40,
                            40,
                            BoxShape.circle),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                            child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          model.companyName!.capitalize!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.grey),
                        ))
                      ],
                    )),
                    IconButton(
                      onPressed: () {
                        controller!.addRemoveBookmark(index);
                      },
                      icon: Icon(
                        model.isFav == 0
                            ? Icons.bookmark_border
                            : Icons.bookmark,
                        size: 20,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    model.title!.capitalizeFirst!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                RichText(
                    textScaler: TextScaler.linear(Get.textScaleFactor),
                    text: TextSpan(
                        text: model.jobType,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey))),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.locationDot,
                            size: 16,
                            color: Get.theme.colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                              child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textScaler:
                                      TextScaler.linear(Get.textScaleFactor),
                                  model.city ?? "N/A".capitalizeFirst!,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500))),
                        ],
                      ),
                    )),
                    Expanded(
                        child: Container(
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Icon(FontAwesomeIcons.clock,size: 16,color: Get.theme.colorScheme.secondary,),
                          // const SizedBox(width: 10,),
                          // Flexible(child: Text(
                          //   overflow: TextOverflow.ellipsis,
                          //   maxLines: 1,
                          //   textAlign: TextAlign.end,
                          //   model.jobType ?? "N/A".capitalizeFirst!,style: TextStyle(
                          //     fontSize: 15,color: Colors.grey
                          // ),))
                          const Text(
                            " ${AppConstant.currencyUnicode}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Flexible(
                              child: ["0", null, 0, "null"]
                                      .contains(model.salaryFrom!)
                                  ? Text(
                                      "Not Disclosed",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textScaler: TextScaler.linear(
                                          Get.textScaleFactor),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )
                                  : Text(
                                      "${AppConstant.formattedNumber(model.salaryFrom)}-${AppConstant.formattedNumber(model.salaryTo)}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textScaler: TextScaler.linear(
                                          Get.textScaleFactor),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ))
                        ],
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
