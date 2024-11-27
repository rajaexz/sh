import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:school_hiring/daashboard/controller/favorite_company_controller.dart';
import 'package:school_hiring/daashboard/controller/favorite_job_controller.dart';

import 'package:school_hiring/pages/pages.dart';
import 'package:school_hiring/utility/helper.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../models/school_list_model.dart';
import '../../utility/app_constant.dart';
import '../../utility/utility.dart';

class FavoriteSchoolScreen extends GetView<FavoriteSchoolController> {
  const FavoriteSchoolScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 Get.put(FavoriteSchoolController());
    return GetBuilder<FavoriteSchoolController>(
      init: controller,
      builder: (controller) => Obx(() => _buildUI()),
    );
  }

  Widget _buildUI() {
    if (controller.isLoading.value) {
      return Utility.progressIndicator();
    } else {
      return FavoriteSchoolListView(
        controller: controller,
      );
    }
  }
}

class FavoriteSchoolListView extends StatelessWidget {
  final FavoriteSchoolController? controller;
  const FavoriteSchoolListView({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: RefreshIndicator(
        onRefresh: () async {
          await controller?.getData();
        },
        child: controller!.schoolList!.isNotEmpty
            ? _showJobList()
            : ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: const NoDataAvailable(message: "No Data Found",)
                  ),
                ],
              ),
      ),
    );
  }

  Widget _showJobList() => ListView.builder(
        itemCount: controller!.schoolList!.length,
        itemBuilder: (context, index) {
          return _jobCard(controller!.schoolList!.elementAt(index), index);
        },
      );

  Widget _jobCard(Datum model, int index) => GestureDetector(
        onTap: () {
          Get.toNamed(Routes.schoolDetailScreen, arguments: [model.id]);
        },
        child: Container(
       
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            decoration: BoxDecoration(
              color:  Get.isDarkMode ?  Colors.black87: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(20.0),
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Utility.profileAvatar(model.logo ?? AppConstant.dummyImage,
                        80, 80, BoxShape.circle),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${model.name!.capitalizeFirst!} ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const SizedBox(height: 1.0),
                          Text(
                            "${model.state}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 1,
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          model!.ownershipType ?? "N/A",
                          style: Get.textTheme.bodySmall?.copyWith(
                            color: const Color.fromARGB(255, 26, 25, 25),
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                ReadMoreText(
                  "${model.description ?? ""}",
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 13 ),
                  colorClickableText: Colors.pink,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: ' Show less',
                ),
              ],
            ),
          ),
        ),
      );
}
