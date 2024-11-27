import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_hiring/daashboard/controller/home_controller.dart';
import 'package:school_hiring/pages/pages.dart';
import 'package:school_hiring/theme/theme_controller.dart';
import 'package:school_hiring/utility/app_constant.dart';
import 'package:school_hiring/utility/custom_widget.dart';

import 'package:school_hiring/utility/utility.dart';
import 'package:school_hiring/models/job_list_model.dart' as jobListModelSubmit;
import 'package:school_hiring/models/school_list_model.dart'
    as schoolListModelSubmit;
import 'package:school_hiring/utility/widget_helper.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Container(
      child: GetBuilder<HomeController>(
        init: controller,
        builder: (controller) => RefreshIndicator(
            onRefresh: () async {
              await controller!.getData();
            },
            child: _buildUI()),
      ),
    );
  }

  Widget _buildUI() => Obx(() {
        if (controller.isLoading) {
          return Utility.progressIndicator();
        } else {
          return HomeView(
            controller: controller,
          );
        }
      });

    // Widget _buildUI() => HomeView(
    //         controller: controller,
    //       );
}

class HomeView extends StatelessWidget {
  final HomeController? controller;
  const HomeView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            BikeTextField(
              textEditingController: controller!.searchController,
              isMandatory: true,
              readOnly: true,
              isCircular: true,
              showTrailingIcon: false,
              hintText: "Search by keyword",
              label: "",
              actionIcon: const InkWell(
                child: Icon(Icons.search),
              ),
              onTap: () {
                // Get.toNamed(Routes.jobListScreen);
              },
              textInputType: TextInputType.name,
              maxLines: 1,
              showLabel: false,
              obscureText: false,
            ),
            const SizedBox(
              height: 10.0,
            ),
            _showProfileSection(),
          
            const SizedBox(
              height: 10.0,
            ),
          

            _showJobList()
          ],
        ),
      ),
    );
  }

  Widget _showProfileSection() => Container(
        child: Container(
          decoration: BoxDecoration(
            color: Get.theme.primaryColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 10.00, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
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
                    width: 10.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi,  👋 ",
                        style: Get.theme.textTheme.titleMedium!.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      // Text(
                      //   "${controller!.jobList[0]["UserID"]}" ?? "N/A",
                      //   style: Get.theme.textTheme.bodyMedium!.copyWith(
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
              Flexible(
                  child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
                  
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Get.theme.primaryColor,
                  ),
                ),
              ))
            ],
          ),
        ),
      );



  Widget _showJobList() => ListView.builder(
      itemCount: controller!.jobList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          _jobCardAlternate(data: controller!.jobList[index]));

  Widget _jobCardAlternate({data}) =>
      GestureDetector(
        onTap: () {
       //   Get.toNamed(Routes.jobDetailScreen, );
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.black87 : Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utility.imageContainer(
                  data["Logo"],
                      50,
                      50,
                     ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         data["CustomerName"],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Get.theme.textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          "${data["City"]}, ${data["State"]}",
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
                "${data["UserID"]}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Get.theme.textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Get.isDarkMode ? Colors.grey : Colors.black87,
                ),
              ),
              // const SizedBox(height: 10.0),
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
                          "Email id:",
                          style: Get.theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${data["EmailID"]}" ,
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
              const SizedBox(height: 6.0),
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
                          "Remark: ",
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
                  SizedBox(
                    width: 100,
                    child: Text(
                      
                      "${data["Remark"]}"?? "",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'medium',
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(FontAwesomeIcons.chartLine,
                          size: 16.0, color: Colors.grey),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        child: Text(
                          "CategoryList: ",
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
                    "${data["City"]}",
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
                            );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Get.theme.colorScheme.secondary,
                          // Text color
                          padding: EdgeInsets.zero, // Remove padding
                          minimumSize: Size(double.infinity,
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
                  // Flexible(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       Text(
                  //         AppConstant.currencyUnicode,
                  //         style: Get.theme.textTheme.bodyMedium!.copyWith(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.bold,
                  //           color:
                  //               Get.isDarkMode ? Colors.grey : Colors.black87,
                  //         ),
                  //       ),
                  //       const SizedBox(width: 5.0),
                  //       // model.hideSalary == 1
                  //       //     ? Text(
                  //       //         "Not Disclosed",
                  //       //         style: Get.theme.textTheme.bodyMedium!.copyWith(
                  //       //           fontWeight: FontWeight.w500,
                  //       //           color: Colors.grey.shade600,
                  //       //         ),
                  //       //       )
                  //       //     : ["0", null, 0, "null"].contains(model.salaryFrom)
                  //       //         ? Text(
                  //       //             "Not Disclosed",
                  //       //             style: Get.theme.textTheme.bodyMedium!
                  //       //                 .copyWith(
                  //       //               fontWeight: FontWeight.w500,
                  //       //               color: Colors.grey.shade600,
                  //       //             ),
                  //       //           )
                  //       //         : Text(
                  //       //             "${AppConstant.formattedNumber(model.salaryFrom)} - ${AppConstant.formattedNumber(model.salaryTo)}",
                  //       //             style: Get.theme.textTheme.bodyMedium!
                  //       //                 .copyWith(
                  //       //               fontWeight: FontWeight.bold,
                  //       //               color: Get.isDarkMode
                  //       //                   ? Colors.grey
                  //       //                   : Colors.black87,
                  //       //             ),
                  //       //           ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      );
}
