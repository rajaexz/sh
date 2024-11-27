import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/jobs/controller/job_detail_controller.dart';
import 'package:school_hiring/utility/widget_helper.dart';

import '../../utility/app_config.dart';
import '../../utility/app_constant.dart';
import '../../utility/utility.dart';
import 'package:timeago/timeago.dart' as timeago;

class JobDetailScreen extends GetView<JobDetailController> {
  const JobDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(JobDetailController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Details"),
      ),
      body: GetBuilder<JobDetailController>(
        init: controller,
        builder: (controller) => Obx(() => RefreshIndicator(
      onRefresh: () async {
        await controller!.getData();
      },child: _buildUI())),
      ),
    );
  }

  Widget _buildUI() {
    if (controller.isLoading) {
      return Utility.progressIndicator();
    } else {
      return JobDetailView(
        controller: controller,
      );
    }
  }
}class JobDetailView extends StatelessWidget {
  final JobDetailController? controller;
  const JobDetailView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border:
                        Border.all(color: Colors.grey.shade300, width: 1.0),
                        borderRadius: BorderRadius.circular(5.0),
                        color: Get.isDarkMode
                            ? Colors.black87
                            : Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Utility.profileAvatar(
                            controller?.jobDetailModel?.data?.companyLogo ??
                                AppConstant.dummyImage,
                            60,
                            60,
                            BoxShape.circle,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            controller?.jobDetailModel?.data?.title
                                ?.capitalize ??
                                "No Title Available",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            controller?.jobDetailModel?.data?.companyName
                                ?.capitalize ??
                                "No Company Name",
                                textAlign: TextAlign.center,
                            style: const TextStyle(
                              
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            "Posted ${timeago.format(controller?.jobDetailModel?.data?.createdAt ?? DateTime.now())}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    _showRequirementSection(),
                    const SizedBox(height: 10.0),
                    if (controller?.jobDetailModel?.data?.description!.isNotEmpty ?? false)
                    _buildInfoSection("Job Responsibilities", controller?.jobDetailModel?.data?.description ?? ""),
                    const SizedBox(height: 10.0),
                    if (controller?.jobDetailModel?.data?.benefits!.isNotEmpty ?? false)
                      _buildInfoSection("Benefits", controller?.jobDetailModel?.data?.benefits ?? ""),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              width: Get.width,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.black87 : Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              height: Get.height * 0.10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: IconButton(
                      onPressed: () {
                        controller?.addRemoveBookmark();
                      },
                      icon: Icon(
                        controller?.jobDetailModel?.data?.isFav == 0
                            ? Icons.bookmark_border
                            : Icons.bookmark,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    flex: 3,
                    child: AppThemeButton(
                      color: Get.theme.colorScheme.secondary,
                      textColor: Colors.white,
                      label: controller?.jobDetailModel?.data?.isApply == 0
                          ? "Apply"
                          : "Applied",
                      onClick: () {
                        if (controller?.jobDetailModel?.data?.isApply == 0) {
                          Get.bottomSheet(
                            ApplyJobSheet(controller: controller),
                            isScrollControlled: true,
                            ignoreSafeArea: false,
                          );
                        } else {
                          bakeToast("You have already applied for this job",
                              type: ToastType.warning);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _showRequirementSection() => Container(
    margin: EdgeInsets.symmetric(vertical: 8.0),
    child: Card(
      elevation: 1.0,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            if (controller?.jobDetailModel?.data?.numOfPositions != null)
              _showRow(Icons.format_list_numbered, "Number of Positions",
                controller?.jobDetailModel?.data?.numOfPositions?.toString() ?? "N/A"),

            if (controller?.jobDetailModel?.data?.jobExperience?.isNotEmpty ?? false)
              _showRow(Icons.work, "Job Experience",
                  controller?.jobDetailModel?.data?.jobExperience?.toString() ?? "N/A"),

            if (controller?.jobDetailModel?.data?.skills?.isNotEmpty ?? false)
              _showRow(Icons.lightbulb, "Skills",
                  '${controller?.jobDetailModel?.data?.skills?.join(', ') ?? "N/A"}'),

            if (controller?.jobDetailModel?.data?.interviewMode?.isNotEmpty ?? false)
              _showRow(Icons.video_call, "Interview Mode",
                  controller?.jobDetailModel?.data?.interviewMode?.toString() ?? "N/A"),

            if (controller?.jobDetailModel?.data?.degreeLevel?.isNotEmpty ?? false)
              _showRow(Icons.school, "Required Degree Level",
                  controller?.jobDetailModel?.data?.degreeLevel?.toString() ?? "N/A"),

            if (controller?.jobDetailModel?.data?.organizationCategory?.isNotEmpty ?? false)
              _showRow(Icons.business, "Organization Category",
                  controller?.jobDetailModel?.data?.organizationCategory?.capitalize ?? "N/A"),

            if (controller?.jobDetailModel?.data?.englishLevelRequired?.isNotEmpty ?? false)
              _showRow(Icons.language, "English Level Required",
                  controller?.jobDetailModel?.data?.englishLevelRequired?.toString() ?? "N/A"),

            if (controller?.jobDetailModel?.data?.jobType?.isNotEmpty ?? false)
              _showRow(Icons.schedule, "Job Type",
                  controller?.jobDetailModel?.data?.jobType?.toString() ?? "N/A"),

            if (controller?.jobDetailModel?.data?.careerLevel?.isNotEmpty ?? false)
              _showRow(Icons.stairs, "Career Type",
                  controller?.jobDetailModel?.data?.careerLevel?.toString() ?? "N/A"),

            if (controller?.jobDetailModel?.data?.salaryPeriod?.isNotEmpty ?? false)
              _showRow(Icons.calendar_today, "Salary Period",
                  controller?.jobDetailModel?.data?.salaryPeriod?.toString() ?? "N/A"),

            if (controller?.jobDetailModel?.data?.jobShift?.isNotEmpty ?? false)
              _showRow(Icons.access_time, "Job Shift",
                  controller?.jobDetailModel?.data?.jobShift?.toString() ?? "N/A"),

            if (controller?.jobDetailModel?.data?.gender?.isNotEmpty ?? false)
              _showRow(Icons.person, "Gender Preference",
                  controller?.jobDetailModel?.data?.gender?.toString() ?? "N/A"),

            if (controller?.jobDetailModel?.data?.state?.isNotEmpty ?? false)
              _showRow(Icons.map, "State",
                  controller?.jobDetailModel?.data?.state?.toString() ?? "N/A"),

            if (controller?.jobDetailModel?.data?.city?.isNotEmpty ?? false)
              _showRow(Icons.location_city, "City",
                  controller?.jobDetailModel?.data?.city?.toString() ?? "N/A"),

            if (controller?.jobDetailModel?.data?.functionalArea?.isNotEmpty ?? false)
              _showRow(Icons.workspaces, "Functional Area",
                  controller?.jobDetailModel?.data?.functionalArea?.toString() ?? "N/A"),

            if (controller?.jobDetailModel?.data?.address?.isNotEmpty ?? false)
              _showRow(Icons.home, "Address",
                  controller?.jobDetailModel?.data?.address?.toString() ?? "N/A"),

            if (controller?.jobDetailModel?.data?.salaryFrom != null &&
                controller?.jobDetailModel?.data?.salaryTo != null)
              controller?.jobDetailModel?.data?.hideSalary == 0
                  ? _showRow(
                      Icons.attach_money,
                      "Salary Range",
                      ["0", null, 0, "null"].contains(controller?.jobDetailModel?.data?.salaryFrom)
                          ? "Not Disclosed"
                          : "${AppConstant.formattedNumber(controller!.jobDetailModel!.data!.salaryFrom)} - ${AppConstant.formattedNumber(controller!.jobDetailModel!.data!.salaryTo)}")
                  : _showRow(Icons.money_off, "Salary Range", "Not Disclosed"),
          ],
        ),
      ),
    ),
  );

  Widget _buildInfoSection(String title, String content) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
        borderRadius: BorderRadius.circular(5.0),
       color: Get.isDarkMode ? Colors.black : Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(title),
          const SizedBox(height: 5.0),
          HtmlWidget(content),
        ],
      ),
    );
  }

  Widget _showRow(IconData icon, String title, String value) => Container(
    margin: EdgeInsets.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14.0, color: Colors.grey),
            const SizedBox(width: 10.0),
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.start,
              textScaler: TextScaler.linear(Get.textScaleFactor),
              "$title:",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold , color: Colors.grey),
            ),
          ],
        ),
        Expanded(
          child: Text(
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            textScaler: TextScaler.linear(Get.textScaleFactor),
            value ?? "N/A",
            style: TextStyle(
              fontSize: 16, color: Colors.grey
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildSectionTitle(String title) {
    return Text(
      title.capitalizeFirst ?? "",
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ApplyJobSheet extends StatelessWidget {
  final JobDetailController? controller;
  const ApplyJobSheet({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.isDarkMode ? Colors.black : Colors.white,
      child: Column(
        children: [
          AppBar(
            title: Text("Apply"),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _showAgeRange(),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Select Resume",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                controller!.cvListModel!.data!.isNotEmpty
                    ? Expanded(child: _showCVList())
                    : _showNoCVList(),
                Obx(() => Visibility(
                    visible: controller!.selectedCV != 100,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AppThemeButton(
                        onClick: () {
                          controller!.applyJobs();
                        },
                        color: Get.theme.colorScheme.secondary,
                        label: "Apply",
                        textColor: Colors.white,
                      ),
                    )))
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _showAgeRange() => Obx(() => Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Get.theme.colorScheme.secondary.withOpacity(0.2)),
        child: Column(
          children: [
            Container(
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Utility.profileAvatar(
                      controller!.jobDetailModel!.data!.companyLogo ??
                          AppConstant.dummyImage,
                      60,
                      60,
                      BoxShape.circle),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textScaler: TextScaler.linear(Get.textScaleFactor),
                    controller!.jobDetailModel!.data!.title!.capitalize!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textScaler: TextScaler.linear(Get.textScaleFactor),
                    controller!.jobDetailModel!.data!.companyName!.capitalize!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textScaler: TextScaler.linear(Get.textScaleFactor),
                    "Posted ${timeago.format(controller!.jobDetailModel!.data!.createdAt!)}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Salary Range",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    AnimatedFlipCounter(
                      value: controller!.currentSalary!,
                      fractionDigits: 0, // decimal precision
                      prefix: "${AppConstant.currencyUnicode}",
                      suffix: "-",
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    AnimatedFlipCounter(
                      value: controller!.expectedSalary!,
                      fractionDigits: 0, // decimal precision

                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            RangeSlider(
                values: RangeValues(controller!.currentSalary!.toDouble(),
                    controller!.expectedSalary!.toDouble()),
                max: AppConfig.maxSalaryValue,
                min: AppConfig.minSalaryValue,
                activeColor: const Color(0xff331A01),
                inactiveColor: const Color(0xff331A01),
                onChanged: (value) {
                  controller!.currentSalary = value.start;
                  controller!.expectedSalary = value.end;
                  //controller!.update();
                }),
          ],
        ),
      ));

  Widget _showCVList() => Container(
        child: Card(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                // shrinkWrap: true,
                padding: EdgeInsets.zero,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: controller!.cvListModel!.data!.length,
                itemBuilder: (context, index) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      onTap: () {},
                      leading: Image.asset(
                        Utility.getCVImageType(["", null, "null"].contains(
                                controller!.cvListModel!.data!
                                    .elementAt(index)
                                    .cvFile)
                            ? ""
                            : controller!.cvListModel!.data!
                                .elementAt(index)
                                .cvFile!
                                .split(".")
                                .last),
                        height: 40,
                        width: 40,
                      ),
                      title: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        "${controller!.cvListModel!.data!.elementAt(index).title!.capitalize}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            "${[
                              "",
                              null,
                              "null"
                            ].contains(controller!.cvListModel!.data!.elementAt(index).cvFile) ? "N/A" : controller!.cvListModel!.data!.elementAt(index).cvFile!.capitalize}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            "Added On: ${AppConstant.getDateFormat.format(controller!.cvListModel!.data!.elementAt(index).createdAt!)}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey),
                          )
                        ],
                      ),
                      trailing: Obx(() => IconButton(
                            onPressed: () {
                              controller!.selectedCV = index;
                            },
                            icon: Icon(
                              size: 30,
                              controller!.selectedCV == index
                                  ? Icons.check_circle
                                  : Icons.check_circle_outline_outlined,
                              color: Get.theme.primaryColor,
                            ),
                          )),
                    )),
          ),
        ),
      );

  Widget _showNoCVList() => Container(
        width: Get.width,
        child: Card(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.plus),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Please Upload Resume",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      );
}