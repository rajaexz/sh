import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:school_hiring/pages/pages.dart';
import 'package:school_hiring/profile/controller/profile_detail_controller.dart';
import 'package:school_hiring/utility/app_constant.dart';
import 'package:school_hiring/utility/utility.dart';

class ProfileDetailScreen extends GetView<ProfileDetailController> {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileDetailController());
    return GetBuilder<ProfileDetailController>(
        init: controller, builder: (controller) => _buildUI());
  }

  Widget _buildUI() => Obx(() {
        if (controller.isLoading) {
          return Utility.progressIndicator();
        } else {
          return ProfileDetailViewTwo(
            controller: controller,
          );
        }
      });
}

class ProfileDetailViewTwo extends StatelessWidget {
  final ProfileDetailController? controller;
  const ProfileDetailViewTwo({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await controller!.getData();
      },
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10.0,
              ),
            Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AppConstant
                                  .dummyImage // Default image if genderName is null

                              ),
                          fit: BoxFit.cover,
                        )),
                  ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.00),
                child: Text(
                  "${controller!.profileDetailModel!.data!.firstName ?? "N/A"} ${controller!.profileDetailModel!.data!.middleName ?? ""} ${controller!.profileDetailModel!.data!.lastName}",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  textScaler: TextScaler.linear(Get.textScaleFactor),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 0.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.00),
                child: Text(
                  "${controller!.profileDetailModel!.data!.email ?? "N/A"}",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  textScaler: TextScaler.linear(Get.textScaleFactor),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              controller!.profileDetailModel!.data!.isImmediateAvailable == 1
                  ? _showActiveLookign()
                  : SizedBox.shrink(),
              BasicDetailView(
                controller: controller,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _showActiveLookign() => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Get.isDarkMode ? Colors.white : Colors.black54),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.eye,
              size: 15,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              "Actively Searching Jobs",
              textScaler: TextScaler.linear(Get.textScaleFactor),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )
          ],
        ),
      );
}

class ProfileDetailView extends StatelessWidget {
  final ProfileDetailController? controller;
  const ProfileDetailView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            //Get.log("OkOK ${innerBoxIsScrolled}");
            return [
              SliverAppBar(
                  pinned: true,
                  floating: true,
                  expandedHeight: 250,
                  elevation: 0.0,
                  automaticallyImplyLeading: false,
                  flexibleSpace: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(AppConstant
                                      .dummyImage // Default image if genderName is null

                                  ),
                              fit: BoxFit.cover,
                            )),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.00),
                        child: Text(
                          "${controller!.profileDetailModel!.data!.name ?? "N/A"}",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 0.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.00),
                        child: Text(
                          "${controller!.profileDetailModel!.data!.email ?? "N/A"}",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  bottom: ScrollTabBar(
                    tabs: [
                      Tab(
                        text: "Profile",
                      ),
                      Tab(text: "Summary"),
                      Tab(text: "Resume"),
                      Tab(text: "Projects")
                    ],
                  ))
            ];
          },
          body: TabBarView(children: [
            BasicDetailView(
              controller: controller,
            ),
            Container(),
            Container(),
            Container(),
          ]),
        ),
      ),
    );
  }

  SliverAppBar buildAppBar() => SliverAppBar(
        elevation: 0.0,
        pinned: true,
        leading: Container(),
        title: TabBar(tabs: [
          TextButton(onPressed: () {}, child: Text("Sub Task")),
          Icon(Icons.home),
          Icon(Icons.home),
        ]),
      );
}

class ScrollTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? tabs;
  const ScrollTabBar({Key? key, this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.isDarkMode ? Colors.black : Colors.white,
      width: Get.width,
      height: kToolbarHeight,
      child: TabBar(
        isScrollable: false,
        labelStyle: Get.theme.textTheme.titleMedium!
            .copyWith(fontWeight: FontWeight.w600),
        //tabAlignment: TabAlignment.fill,
        tabAlignment: TabAlignment.fill,
        tabs: tabs!,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class BasicDetailView extends StatelessWidget {
  final ProfileDetailController? controller;
  const BasicDetailView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Personal Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.editBasicDetailScreen,
                              arguments: [controller!.profileDetailModel])!
                          .then((value) => controller!.getData());
                    },
                    child: Text(
                      "Edit",
                      style: Get.theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
            _showFirstBasicDetails(),
            const SizedBox(
              height: 10.0,
            ),
            if (controller!.profileDetailModel!.data!.jobExperienceName !=
                    null &&
                controller!.profileDetailModel!.data!.careerLevelName != null &&
                controller!.profileDetailModel!.data!.functionalAreaName !=
                    null)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Professional Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            if (controller!.profileDetailModel!.data!.jobExperienceName !=
                    null &&
                controller!.profileDetailModel!.data!.careerLevelName != null &&
                controller!.profileDetailModel!.data!.functionalAreaName !=
                    null)
              _showContactDetails(),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Income Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            _showIncomeDetails(),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Summary",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.editSummary,
                              arguments: [controller!.profileSummaryModel])!
                          .then((value) => controller!.getData());
                    },
                    child: Text(
                      "Edit",
                      style: Get.theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
            _showSummary(),
            CvListSection(
              controller: controller,
            ),
            JobSkillListSection(
              controller: controller,
            ),
            MyLanguageSection(
              controller: controller,
            ),
            JobExperienceSection(
              controller: controller,
            ),
            MyEducationSection(
              controller: controller,
            ),
            MyProjcetSection(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }

  Widget _showRow(String title, String value) => Container(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 12,
                  textAlign: TextAlign.start,
                  textScaler: TextScaler.linear(Get.textScaleFactor),
                  title ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey),
                ),
              ),
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                  textAlign: TextAlign.end,
                  textScaler: TextScaler.linear(Get.textScaleFactor),
                  value ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _showFirstBasicDetails() => Container(
        child: Card(
          elevation: 1.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text("Basic Details",style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.w600
                // ),),
                if (controller!.profileDetailModel!.data!.firstName != null)
                  _showRow(
                      "First Name:",
                      controller!.profileDetailModel!.data!.firstName! ??
                          "N/A"),

                if (controller!.profileDetailModel!.data!.middleName != null)
                  _showRow(
                      "Middle Name:",
                      controller!.profileDetailModel!.data!.middleName
                              ?.toString() ??
                          "N/A"),

                if (controller!.profileDetailModel!.data!.lastName != null)
                  _showRow("Last Name:",
                      controller!.profileDetailModel!.data!.lastName! ?? ""),

                if (controller!.profileDetailModel!.data?.email != null)
                  _showRow(
                      "E-mail:",
                      controller!.profileDetailModel!.data?.email.toString() ??
                          "N/A"),
                if (controller!.profileDetailModel!.data?.phone != null)
                  _showRow(
                      "Mobile Number:",
                      controller!.profileDetailModel!.data?.phone.toString() ??
                          "N/A"),

                if (controller!.profileDetailModel!.data?.mobileNum != null)
                  _showRow(
                      "Alternate Number:",
                      controller!.profileDetailModel!.data?.mobileNum
                              .toString() ??
                          "N/A"),

                if (controller!.profileDetailModel!.data?.dateOfBirth != null)
                  _showRow(
                      "Date of Birth:",
                      AppConstant.getDateFormat.format(
                          controller!.profileDetailModel!.data?.dateOfBirth ??
                              DateTime.now())),

                if (controller!.profileDetailModel!.data!.genderId != null)
                  _showRow(
                      "Gender:",
                      controller!.profileDetailModel!.data!.genderId == 2
                          ? "Male"
                          : "Female"),

                // _showRow("Father Name",
                //     controller!.profileDetailModel!.data!.fatherName!),
                // const SizedBox(
                //   height: 10.0,
                // ),
                if (controller!.profileDetailModel!.data!.maritalStatusId !=
                    null)
                  _showRow(
                      "Marital Status:",
                      controller!.profileDetailModel!.data!.maritalStatusId == 2
                          ? "Single"
                          : "Married"),

                if (controller!.profileDetailModel!.data?.cityName != null)
                  _showRow("City:",
                      controller!.profileDetailModel!.data?.cityName ?? "N/A"),
                if (controller!.profileDetailModel!.data?.stateName != null)
                  _showRow("State:",
                      controller!.profileDetailModel!.data?.stateName ?? "N/A"),
SizedBox(height: 10,),
                if (controller!.profileDetailModel!.data?.streetAddress != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          "Address:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          textAlign: TextAlign.end,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          controller!.profileDetailModel!.data?.streetAddress ??
                              'N/A',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );

  Widget _showContactDetails() => Container(
        child: Card(
          elevation: 1.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text("Contact Details",style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.w600
                // ),),
                const SizedBox(
                  height: 10.0,
                ),
                _showRow("Job Experience:",
                    controller!.profileDetailModel!.data!.jobExperienceName!),
                const SizedBox(
                  height: 10.0,
                ),
                _showRow("Career Level:",
                    controller!.profileDetailModel!.data!.careerLevelName!),
                const SizedBox(
                  height: 10.0,
                ),

                _showRow(
                    "Functional Area:",
                    controller!.profileDetailModel!.data!.functionalAreaName ??
                        "N/A"),
                const SizedBox(
                  height: 10.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        "Industry:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 20,
                        textAlign: TextAlign.end,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        controller!.profileDetailModel!.data!.industryName!,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  // Widget _showAddressDetails() => Container(
  //       child: Card(
  //         elevation: 1.0,
  //         child: Container(
  //           padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               // Text("Contact Details",style: TextStyle(
  //               //     fontSize: 18,
  //               //     fontWeight: FontWeight.w600
  //               // ),),
  //               const SizedBox(
  //                 height: 10.0,
  //               ),
  //               _showRow("State", controller!.profileDetailModel!.data!.stateName!),
  //               const SizedBox(
  //                 height: 10.0,
  //               ),
  //               _showRow("City",
  //                   controller!.profileDetailModel!.data!.cityName ?? "N/A"),
  //               const SizedBox(
  //                 height: 10.0,
  //               ),
  //               _showRow("Address",
  //                   controller!.profileDetailModel!.data!.streetAddress ?? "N/A"),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );

  Widget _showIncomeDetails() => Container(
        child: Card(
          elevation: 1.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  decoration: BoxDecoration(
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            "Current Salary",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            "${AppConstant.currencyUnicode}${controller!.profileDetailModel!.data?.currentSalary ?? 'N/A'}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            "Expected Salary",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            "${AppConstant.currencyUnicode}${controller!.profileDetailModel!.data?.expectedSalary ?? 'N/A'}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  _showSummary() {
    return Card(
      elevation: 1.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                  //border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          controller!.profileSummaryModel?.data.summary ??
                              'N/A',
                          maxLines: 20, // Limit the text to 20 lines
                          overflow: TextOverflow
                              .ellipsis, // Add ellipsis at the end of the text
                          textAlign: TextAlign.left, // Align text to the left
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CvListSection extends StatelessWidget {
  final ProfileDetailController? controller;
  const CvListSection({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "My Resume",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.addResumeScreen);
                      },
                      icon: Icon(Icons.add))
                ],
              ),
            ),
            controller!.cvListModel!.data!.isNotEmpty
                ? _showCVList()
                : _showNoCVList()
          ],
        ),
      ),
    );
  }

  Widget _showCVList() => Container(
        child: Card(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller!.cvListModel!.data!.length,
                itemBuilder: (context, index) => ListTile(
                      dense: true,
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
                      trailing: InkWell(
                          onTap: () {
                            Get.bottomSheet(ResumeActionBottomSheet(
                              controller: controller,
                              index: index,
                            ));
                          },
                          child: Icon(Icons.more_horiz)),
                    )),
          ),
        ),
      );

  Widget _showNoCVList() => Container(
        width: Get.width,
        child: Card(
          elevation: 1.0,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon(FontAwesomeIcons.plus),
                // const SizedBox(height: 10.0,),
                Text(
                  "No Resume Available",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      );
}

class JobSkillListSection extends StatelessWidget {
  final ProfileDetailController? controller;
  const JobSkillListSection({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "My Skills",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.addSkillScreen);
                      },
                      icon: Icon(Icons.add))
                ],
              ),
            ),
            controller!.jobSkillModel!.data!.isNotEmpty
                ? _showSkillList()
                : _showNoSkillList()
          ],
        ),
      ),
    );
  }

  Widget _showSkillList() => Container(
        child: Card(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 5.0, vertical: 5.0), // Adjusted padding
            child: Wrap(
              spacing: 5.0, // Horizontal spacing between chips
              runSpacing: 5.0, // Vertical spacing between lines of chips
              children: List<Widget>.generate(
                controller!.jobSkillModel!.data!.length,
                (index) => InkWell(
                  onTap: () {
                    Get.bottomSheet(SkillActionBottomSheet(
                      controller: controller,
                      index: index,
                    ));
                  },
                  child: Chip(
                    label: Text(
                      "${controller!.jobSkillModel!.data!.elementAt(index).jobSkillName}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textScaler: TextScaler.linear(Get.textScaleFactor),
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor:
                        Colors.grey[200], // Background color of the chip
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

Widget _showNoSkillList() => Container(
      width: Get.width,
      child: Card(
        elevation: 1.0,
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
                "No Skills Available",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );

class JobExperienceSection extends StatelessWidget {
  final ProfileDetailController? controller;
  const JobExperienceSection({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "My Experience",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.addExpenseScreen);
                        //Get.toNamed(Routes.editBasicDetailScreen,arguments: [controller!.profileDetailModel]);
                      },
                      icon: Icon(
                        FontAwesomeIcons.plus,
                        size: 20,
                      ))
                ],
              ),
            ),
            controller!.userExperienceModel!.data!.isNotEmpty
                ? _showExpList()
                : _showNoExpList()
          ],
        ),
      ),
    );
  }

  Widget _showExpList() => Container(
        child: Card(
          elevation: 1.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller!.userExperienceModel!.data!.length,
                itemBuilder: (context, index) => ListTile(
                      dense: true,
                      onTap: () {
                        // Get.log(
                        //     "${controller!.cvListModel!.data!.elementAt(index).cvFile!.split(".")}");
                      },
                      leading: Icon(FontAwesomeIcons.building),
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        "${controller!.userExperienceModel!.data!.elementAt(index).company!.capitalize}",
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
                            "Position: ${[
                              "",
                              null,
                              "null",
                              "Exp",
                              "exp"
                            ].contains(controller!.userExperienceModel!.data!.elementAt(index).title!) ? "Sr.Software Engineer" : controller!.userExperienceModel!.data!.elementAt(index).title!.capitalize}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          // const SizedBox(height: 5.0,),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            "${DateFormat().add_yMMM().format(controller!.userExperienceModel!.data!.elementAt(index).dateStart!)} - ${controller!.userExperienceModel!.data!.elementAt(index).isCurrentlyWorking == 1 ? "Present" : DateFormat().add_yMMM().format(controller!.userExperienceModel!.data!.elementAt(index).dateEnd!)}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            "${controller!.userExperienceModel!.data!.elementAt(index).cityName}, ${controller!.userExperienceModel!.data!.elementAt(index).stateName}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          ReadMoreText(
                            "${controller!.userExperienceModel!.data!.elementAt(index).description}",
                            trimMode: TrimMode.Line,
                            trimLines: 1,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                            colorClickableText: Colors.pink,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: ' Show less',
                          ),
                        ],
                      ),
                      trailing: InkWell(
                          onTap: () {
                            Get.bottomSheet(MyExperienceActionBottomSheet(
                              controller: controller,
                              index: index,
                            ));
                          },
                          child: Icon(Icons.more_horiz)),
                    )),
          ),
        ),
      );

  Widget _showNoExpList() => Container(
        width: Get.width,
        child: Card(
          elevation: 1.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Icon(FontAwesomeIcons.plus),
                //const SizedBox(height: 10.0,),
                Text(
                  "No Experience Available",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      );
}

class MyEducationSection extends StatelessWidget {
  final ProfileDetailController? controller;
  const MyEducationSection({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "My Education",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.addEducationScreen);
                    },
                    icon: Icon(
                      FontAwesomeIcons.plus,
                      size: 20,
                    ))
              ],
            ),
          ),
          controller!.myEducationModel!.data!.isNotEmpty
              ? _showEduList()
              : _showNoEduList()
        ],
      ),
    );
  }

  Widget _showEduList() => Container(
        child: Card(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller!.myEducationModel!.data!.length,
                itemBuilder: (context, index) => ListTile(
                      dense: true,
                      onTap: () {
                        // Get.log(
                        //     "${controller!.cvListModel!.data!.elementAt(index).cvFile!.split(".")}");
                      },
                      leading: Icon(FontAwesomeIcons.building),
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        "${controller!.myEducationModel!.data!.elementAt(index).degreeTitle!.capitalize} (${controller!.myEducationModel!.data!.elementAt(index).degreeTypeName})",
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
                            "Degree: ${[
                              "",
                              null,
                              "null",
                              "Exp",
                              "exp",
                              "title"
                            ].contains(controller!.myEducationModel!.data!.elementAt(index).degreeTypeName!) ? "B.Tech" : controller!.myEducationModel!.data!.elementAt(index).degreeTypeName!.capitalize}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          // const SizedBox(height: 5.0,),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            "Completion Date: ${controller!.myEducationModel!.data!.elementAt(index).dateCompletion}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            "${controller!.myEducationModel!.data!.elementAt(index).cityName}, ${controller!.myEducationModel!.data!.elementAt(index).stateName}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            "${controller!.myEducationModel!.data!.elementAt(index).countryName}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: InkWell(
                          onTap: () {
                            Get.bottomSheet(MyEducationActionBottomSheet(
                              controller: controller,
                              index: index,
                            ));
                          },
                          child: Icon(Icons.more_horiz)),
                    )),
          ),
        ),
      );

  Widget _showNoEduList() => Container(
        width: Get.width,
        child: Card(
          elevation: 1.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon(FontAwesomeIcons.plus),
                // const SizedBox(height: 10.0,),
                Text(
                  "No Education Available",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      );
}

class MyProjcetSection extends StatelessWidget {
  final ProfileDetailController? controller;
  const MyProjcetSection({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10.0,
          ),

          ///================================
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "My Projects",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: () { 
                      Get.toNamed(Routes.addProjectScreen);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.plus,
                      size: 20,
                    ))
              ],
            ),
          ),

          controller!.myProjcetModel?.data?.isNotEmpty == true
              ? _showProList()
              : _showNoProjcet(),
        ],
      ),
    );
  }

  Widget _showProList() => Container(
        child: Card(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller!.myProjcetModel!.data!.length,
                itemBuilder: (context, index) => ListTile(
                      dense: true,
                      onTap: () {
                        // Get.log(
                        //     "${controller!.cvListModel!.data!.elementAt(index).cvFile!.split(".")}");
                      },
                      leading: const Icon(FontAwesomeIcons.building),
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        "${controller!.myProjcetModel!.data!.elementAt(index).name!.capitalize} ",
                        style: const TextStyle(
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
                            "Start/End Date: ${DateFormat().add_yMMM().format(controller!.myProjcetModel!.data!.elementAt(index).dateStart)}/${DateFormat().add_yMMM().format(controller!.myProjcetModel!.data!.elementAt(index).dateEnd)}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            controller!.myProjcetModel!.data
                                .elementAt(index)
                                .description,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: InkWell(
                          onTap: () {
                            Get.bottomSheet(MyProjectActionBottomSheet(
                              controller: controller,
                              index: index,
                            ));
                          },
                          child: Icon(Icons.more_horiz)),
                    )),
          ),
        ),
      );

  Widget _showNoProjcet() => Container(
        width: Get.width,
        child: Card(
          elevation: 1.0,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon(FontAwesomeIcons.plus),
                // const SizedBox(height: 10.0,),
                Text(
                  "No Projcet Available",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      );
}

class MyLanguageSection extends StatelessWidget {
  final ProfileDetailController? controller;
  const MyLanguageSection({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "My Language",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.addLauguege);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.plus,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          // Check if controller and myLanguageModel are not null and have data
          controller != null &&
                  controller!.myLanguageModel?.data?.isNotEmpty == true
              ? _showProList()
              : _showNoProjcet(),
        ],
      ),
    );
  }

  Widget _showProList() => Card(
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 5.0, vertical: 5.0), // Adjusted padding
          child: Wrap(
            spacing: 5.0, // Horizontal spacing between chips
            runSpacing: 5.0, // Vertical spacing between lines of chips
            children: List<Widget>.generate(
              controller!.myLanguageModel!.data!.length,
              (index) => InkWell(
                onTap: () {
                  Get.bottomSheet(MyLanguegeActionBottomSheet(
                    controller: controller,
                    index: index,
                  ));
                },
                child: Chip(
                  label: Text(
                    "${controller!.myLanguageModel!.data!.elementAt(index).languageName}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textScaler: TextScaler.linear(Get.textScaleFactor),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  backgroundColor:
                      Colors.grey[200], // Background color of the chip
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _showNoProjcet() => SizedBox(
        width: Get.width,
        child: Card(
          elevation: 1.0,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "No Language Available",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      );
}

class ResumeActionBottomSheet extends StatelessWidget {
  final ProfileDetailController? controller;
  final int? index;
  const ResumeActionBottomSheet({Key? key, this.controller, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          color: Get.theme.colorScheme.secondaryContainer,
          child: Container(
            child: Column(
              children: [
                AppBar(
                  title: Text("Select Action"),
                ),
                ListTile(
                  onTap: () {
                    Get.back();
                    1.delay().then((v) => Utility.showDialog(
                            "Delete Confirmation",
                            "Are you sure you want to delete selected CV?",
                            () {
                          controller!.removeCV(index!);
                        }));
                  },
                  leading: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Delete",
                    style: Get.theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SkillActionBottomSheet extends StatelessWidget {
  final ProfileDetailController? controller;
  final int? index;
  const SkillActionBottomSheet({Key? key, this.controller, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          color: Get.theme.colorScheme.secondaryContainer,
          child: Container(
            child: Column(
              children: [
                AppBar(
                  title: Text("Select Action"),
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.editSkillView, arguments: [
                      controller!.jobSkillModel!.data!.elementAt(index!)
                    ])!
                        .then((value) => controller!.getDataRefresh());
                  },
                  leading: Icon(FontAwesomeIcons.penToSquare),
                  title: Text(
                    "Edit",
                    style: Get.theme.textTheme.titleMedium,
                  ),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Get.back();
                    1.delay().then((v) => Utility.showDialog(
                            "Delete Confirmation",
                            "Are you sure you want to delete selected Skill?",
                            () {
                          controller!.removeSkill(index!);
                        }));
                  },
                  leading: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Delete",
                    style: Get.theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MyExperienceActionBottomSheet extends StatelessWidget {
  final ProfileDetailController? controller;
  final int? index;
  const MyExperienceActionBottomSheet({Key? key, this.controller, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          color: Get.theme.colorScheme.secondaryContainer,
          child: Container(
            child: Column(
              children: [
                AppBar(
                  title: Text("Select Action"),
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.editExpView, arguments: [
                      controller!.userExperienceModel!.data!.elementAt(index!)
                    ])!
                        .then((value) => controller!.getDataRefresh());
                  },
                  leading: Icon(FontAwesomeIcons.penToSquare),
                  title: Text(
                    "Edit",
                    style: Get.theme.textTheme.titleMedium,
                  ),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  onTap: () {
                    Get.back();
                    1.delay().then((v) => Utility.showDialog(
                            "Delete Confirmation",
                            "Are you sure you want to delete selected Experience?",
                            () {
                          controller!.removeExperience(index!);
                        }));
                  },
                  leading: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Delete",
                    style: Get.theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MyEducationActionBottomSheet extends StatelessWidget {
  final ProfileDetailController? controller;
  final int? index;
  const MyEducationActionBottomSheet({Key? key, this.controller, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          color: Get.theme.colorScheme.secondaryContainer,
          child: Container(
            child: Column(
              children: [
                AppBar(
                  title: Text("Select Action"),
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.editEduView, arguments: [
                      controller!.myEducationModel!.data!.elementAt(index!)
                    ])!
                        .then((value) => controller!.getDataRefresh());
                  },
                  leading: Icon(FontAwesomeIcons.penToSquare),
                  title: Text(
                    "Edit",
                    style: Get.theme.textTheme.titleMedium,
                  ),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  onTap: () {
                    Get.back();
                    1.delay().then((v) => Utility.showDialog(
                            "Delete Confirmation",
                            "Are you sure you want to delete selected Education",
                            () {
                          controller!.removeEducation(index!);
                        }));
                  },
                  leading: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Delete",
                    style: Get.theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MyProjectActionBottomSheet extends StatelessWidget {
  final ProfileDetailController? controller;
  final int? index;
  const MyProjectActionBottomSheet({Key? key, this.controller, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          color: Get.theme.colorScheme.secondaryContainer,
          child: Container(
            child: Column(
              children: [
                AppBar(
                  title: Text("Select Action"),
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    Get.back();
                    1.delay().then((v) => Utility.showDialog(
                            "Delete Confirmation",
                            "Are you sure you want to delete selected Projcet",
                            () {
                          controller!.removeProjcet(index!);
                        }));
                  },
                  leading: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Delete",
                    style: Get.theme.textTheme.titleMedium,
                  ),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.editProView, arguments: [
                      controller!.myProjcetModel!.data!.elementAt(index!)
                    ])!
                        .then((value) => controller!.getDataRefresh());
                  },
                  leading: Icon(FontAwesomeIcons.penToSquare),
                  title: Text(
                    "Edit",
                    style: Get.theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MyLanguegeActionBottomSheet extends StatelessWidget {
  final ProfileDetailController? controller;
  final int? index;
  const MyLanguegeActionBottomSheet({Key? key, this.controller, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          color: Get.theme.colorScheme.secondaryContainer,
          child: Container(
            child: Column(
              children: [
                AppBar(
                  title: Text("Select Action"),
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    Get.back();
                    1.delay().then((v) => Utility.showDialog(
                            "Delete Confirmation",
                            "Are you sure you want to delete selected Language",
                            () {
                          controller!.removelauguage(index!);
                        }));
                  },
                  leading: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Delete",
                    style: Get.theme.textTheme.titleMedium,
                  ),
                ),

                // ListTile(
                //   dense: true,
                //   onTap: () {
                //     Get.back();
                //     Get.toNamed(Routes.editLanguageView, arguments: [
                //       controller!.myLanguageModel!.data!.elementAt(index!)
                //     ])!
                //         .then((value) => controller!.getDataRefresh());
                //   },
                //   leading: const Icon(FontAwesomeIcons.penToSquare),
                //   title: Text(
                //     "ln Edit",
                //     style: Get.theme.textTheme.titleMedium,
                //   ),
                // ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
