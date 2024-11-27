import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:school_hiring/models/school_list_model.dart';
import 'package:school_hiring/pages/pages.dart';
import 'package:school_hiring/utility/custom_widget.dart';
import 'package:school_hiring/utility/helper.dart';

import '../../utility/app_constant.dart';
import '../../utility/utility.dart';
import '../controller/school_list_controller.dart';

class SchoolListScreen extends GetView<SchoolListController> {
  const SchoolListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SchoolListController());
    return GetBuilder(init: controller, builder: (controller) => RefreshIndicator(
      onRefresh: () async {
        await controller!.getData();
      },child: _buildUI()));
  }

  Widget _buildUI() {
    if (controller.isLoading.value) {
      return Utility.progressIndicator();
    } else if (controller.isError) {
      return Utility.errorInidicator("unabletFd".tr, () async {
await controller.getData();

      });
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
            ),
          ),
         
          SchoolListView(
            controller: controller,
          ),
        ],
      );
    }
  }
}

class SchoolListView extends StatelessWidget {
  final SchoolListController? controller;
  const SchoolListView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller!.schoolList!.isNotEmpty
        ? Expanded(child: _showJobList())
        : const NoDataAvailable(message: "No Data Available");
  }

  Widget _showJobList() => ListView.builder(
        itemCount: controller!.schoolList!.length,
        controller: controller!.scrollController,
        itemBuilder: (context, index) {
          return _jobCard(controller!.schoolList!.elementAt(index), index);
        },
      );

  Widget _jobCard(Datum model, int index) => GestureDetector(
        onTap: () {
          Get.toNamed(Routes.schoolDetailScreen, arguments: [model.id]);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Container(
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
                            "${model.name!.capitalize!} ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          const SizedBox(height: 1.0),
                          Text(
                            "${model.state}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            model.isFavouritesCompany == 1
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            color: Get.theme.primaryColor,
                            size: 15,
                          ),
                          onPressed: () {
                            controller!.favouritejobs(id: model.id.toString());
                          },
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
                  ],
                ),
                const SizedBox(height: 10.0),
                        //  HtmlWidget(model.description.toString()),
                ReadMoreText(
                  model.description ?? "",
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 13),
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
