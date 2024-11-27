import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:school_hiring/daashboard/controller/favorite_job_controller.dart';
import '../../models/favorite_job_model.dart';
import 'package:school_hiring/pages/pages.dart';
import 'package:school_hiring/utility/helper.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../utility/app_constant.dart';
import '../../utility/utility.dart';

class FavoriteJobScreen extends GetView<FavoriteJobController> {
  const FavoriteJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteJobController());
    return GetBuilder<FavoriteJobController>(
      init: controller,
      builder: (controller) => Obx(() => _buildUI()),
    );
  }

  Widget _buildUI() {
    if (controller.isLoading.value) {
      return Utility.progressIndicator();
    } else {
      return FavoriteJobListView(
        controller: controller,
      );
    }
  }
}
class FavoriteJobListView extends StatelessWidget {
  final FavoriteJobController controller;

  const FavoriteJobListView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Obx(() => controller.jobList.isNotEmpty
          ? _showJobList()
          : ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: const NoDataAvailable(message: "No Data Found",)
                  ),
                ],
              ),),
    );
  }

  Widget _showJobList() => ListView.builder(
        itemCount: controller.jobList.length,
        itemBuilder: (context, index) =>
            _jobCardAlternate(controller.jobList.elementAt(index), index),
      );
 Widget _jobCardAlternate(Datum model, int index) =>
      GestureDetector(
        onTap: () {
          Get.toNamed(Routes.jobDetailScreen, arguments: [model.id]);
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

               Row(children: [
                        const Icon(FontAwesomeIcons.briefcase, size: 14.0, color: Colors.grey),
              
                  const SizedBox(width: 10,),
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
               ],),
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
                 const SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Row(children: [
                     const Icon( FontAwesomeIcons.solidClock, size: 14.0, color: Colors.grey),
                     const SizedBox(width: 10,),
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
              ],),
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
                const SizedBox(height: 6.0),
                      Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Row(children: [
                   Icon(FontAwesomeIcons.userFriends, size: 16.0, color: Colors.grey),

                     const SizedBox(width: 10,),
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
              ],),
                  const SizedBox(width: 2),
                  Text(
                    model.numOfPositions!.toString() .capitalizeFirst! ?? "",
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
                          "Career Level: ",
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
                    model.careerLevel!.toString().capitalizeFirst! ?? "",
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
                    child:    Text(
                  "Posted: ${timeago.format(model.createdAt!)}",
                  style: Get.theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.grey,
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
                        ["0", null, 0, "null"].contains(model.salaryFrom)
                            ? Text(
                                "Not Disclosed",
                                style: Get.theme.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade600,
                                ),
                              )
                            : Text(
                                "${AppConstant.formattedNumber(model.salaryFrom)} - ${AppConstant.formattedNumber(model.salaryTo)}",
                                style: Get.theme.textTheme.bodyMedium!.copyWith(
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
      );
}
