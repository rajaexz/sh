import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:school_hiring/daashboard/controller/school_detail_controller.dart';
import 'package:school_hiring/pages/pages.dart';

import '../../utility/app_constant.dart';
import '../../utility/utility.dart';

class SchoolDetailScreen extends GetView<SchoolDetailController> {
  const SchoolDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SchoolDetailController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Academy Details"),

        actions: [


            // Flexible(child: IconButton(
            //         onPressed: (){
            //             controller!.favouriteCompany(schoolId:    controller.schoolDetailModel!.data!.id);
                
            //         },
            //         icon: Icon(

            //             controller!.schoolDetailModel!.data!.isFeatured ==  0 ? Icons.bookmark_border : Icons.bookmark,color: Colors.green,),
            //       )),
            
        ],
      ),
      body: GetBuilder<SchoolDetailController>(
        init: controller,
        builder: (controller) => Obx(() => _buildUI()),
      ),
    );
  }

  Widget _buildUI() {
    if (controller.isLoading) {
      return Utility.progressIndicator();
    } else {
      return SchoolDetailView(
        controller: controller,
      );
    }
  }
}

class SchoolDetailView extends StatelessWidget {
  final SchoolDetailController? controller;
  const SchoolDetailView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
     await   controller!.getData();
      },
      child:ListView(
                children: [
                  Container(
        height: Get.height,
        //color: Colors.transparent,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Utility.profileAvatar(
                              controller!.schoolDetailModel!.data!.logo ??
                                  AppConstant.dummyImage,
                              60,
                              60,
                              BoxShape.circle),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            controller!
                                .schoolDetailModel!.data!.name!.capitalize!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Visibility(
                              visible: ["", null, "null"].contains(controller!
                                      .schoolDetailModel!.data!.website) ==
                                  false,
                              child: InkWell(
                                onTap: () {
                                  //Get.toNamed(Routes.schoolWebView,arguments: [controller!.schoolDetailModel!.data!.website,controller!.schoolDetailModel!.data!.name]);
                                },
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  textScaler:
                                      TextScaler.linear(Get.textScaleFactor),
                                  controller!.schoolDetailModel!.data!.website!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.blue),
                                ),
                              )),
                          const SizedBox(height: 5.0,),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            "${controller!.schoolDetailModel!.data!.city ?? ""}, ${controller!.schoolDetailModel!.data!.state}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     _showSocialIcon(
                          //         controller!.schoolDetailModel!.data!.facebook! ?? "",
                          //         AppConstant.socialIconFacebook),
                          //     const SizedBox(
                          //       width: 10.0,
                          //     ),
                          //     _showSocialIcon(
                          //         controller!.schoolDetailModel!.data!.pinterest!,
                          //         AppConstant.socialIconInstagram),
                          //     const SizedBox(
                          //       width: 10.0,
                          //     ),
                          //     _showSocialIcon(
                          //         controller!.schoolDetailModel!.data!.twitter!,
                          //         AppConstant.socialIconTwitter),
                          //     const SizedBox(
                          //       width: 10.0,
                          //     ),
                          //     _showSocialIcon(
                          //         controller!.schoolDetailModel!.data!.linkedin!,
                          //         AppConstant.socialIconLinkedin),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          // Text(
                          //   overflow: TextOverflow.ellipsis,
                          //   maxLines: 2,
                          //   textScaler: TextScaler.linear(Get.textScaleFactor),
                          //   "Posted ${timeago.format(controller!.jobDetailModel!.data!.createdAt!)}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.grey),),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _showrequirementSection(),
                    const SizedBox(
                      height: 10.0,
                    ),
      
                    const SizedBox(
                      height: 5.0,
                    ),
               
                    Container(
                       padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.shade300, width: 1.0),
                          borderRadius: BorderRadius.circular(5.0),
                          color: Get.isDarkMode
                              ? Colors.black87
                              : Colors
                                  .white, // Optional: You can set the background color here
                        ),
                      child: Column(
                     
                        children: [
      
                          _buildSectionTitle( "About The School"),
                       
                          const SizedBox(height: 5.0),
                          SizedBox(child: HtmlWidget(controller!.schoolDetailModel!.data!.description.toString())),
                          // ReadMoreText(
                          //   "${controller!.schoolDetailModel!.data?.description.toString()?? "N/A"}",
                          //   trimMode: TrimMode.Line,
                          //   trimLines: 2,
                          //   textAlign: TextAlign.justify,
                          //   style: const TextStyle(fontSize: 15),
                          //   colorClickableText: Colors.pink,
                          //   trimCollapsedText: 'Show more',
                          //   trimExpandedText: ' Show less',
                          // ),
                        
                         const SizedBox(height: 105.0),
                        ],
                      ),
                    ),
      
                  
                    // HtmlWidget(
                    //   controller!.jobDetailModel!.data!.description!,
                    //   //textAlign: TextAlign.justify,
                    // ),
      
                    const SizedBox(
                      height: 50.0,
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
   
                ],
              )
      
      );
  }
Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white, // Optional: You can set the background color here
      ),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textScaler: TextScaler.linear(1.0),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

Widget _showrequirementSection() => Container(
  margin: const EdgeInsets.symmetric(vertical: 10.0),
  child: Column(
    children: [
      if (controller!.schoolDetailModel!.data?.noOfEmployees != null && 
          controller!.schoolDetailModel!.data!.noOfEmployees!.isNotEmpty) 
        _showRow(Icons.people, "No. of Employees", 
          controller!.schoolDetailModel!.data!.noOfEmployees.toString()),

      const SizedBox(height: 10.0),

      if (controller!.schoolDetailModel!.data?.ceo != null && 
          controller!.schoolDetailModel!.data!.ceo!.isNotEmpty) 
        _showRow(Icons.person, "Recruiter", 
          controller!.schoolDetailModel!.data!.ceo.toString()),

      const SizedBox(height: 10.0),

      if (controller!.schoolDetailModel!.data!.noOfOffices != null
         ) 
        _showRow(Icons.business, "No. of Academys ", 
          controller!.schoolDetailModel!.data!.noOfOffices.toString()),

      const SizedBox(height: 10.0),

      if (controller!.schoolDetailModel!.data?.establishedIn != null &&
          controller!.schoolDetailModel!.data!.establishedIn!.isNotEmpty) 
        _showRow(Icons.calendar_today, "Established In", 
          controller!.schoolDetailModel!.data!.establishedIn.toString()),

      const SizedBox(height: 10.0),

      if (controller!.schoolDetailModel!.data?.phone != null &&
          controller!.schoolDetailModel!.data!.phone!.isNotEmpty) 
        _showRow(Icons.phone, "Phone", 
          controller!.schoolDetailModel!.data!.phone.toString()),

      const SizedBox(height: 10.0),

      if (controller!.schoolDetailModel!.data?.email != null &&
          controller!.schoolDetailModel!.data!.email!.isNotEmpty) 
        _showRow(Icons.email, "Email", 
          controller!.schoolDetailModel!.data!.email.toString()),

      const SizedBox(height: 10.0),

      if (controller!.schoolDetailModel!.data?.industry != null &&
          controller!.schoolDetailModel!.data!.industry!.isNotEmpty) 
        _showRow(Icons.work, "Organisation Type", 
          controller!.schoolDetailModel!.data!.industry.toString()),

      const SizedBox(height: 10.0),

      if (controller!.schoolDetailModel!.data?.ownershipType != null &&
          controller!.schoolDetailModel!.data!.ownershipType!.isNotEmpty) 
        _showRow(Icons.security, "Ownership Type", 
          controller!.schoolDetailModel!.data!.ownershipType.toString()),

      const SizedBox(height: 10.0),

      if (controller!.schoolDetailModel!.data?.city != null &&
          controller!.schoolDetailModel!.data!.city!.isNotEmpty) 
        _showRow(Icons.location_city, "City", 
          controller!.schoolDetailModel!.data!.city.toString()),

      const SizedBox(height: 10.0),

      if (controller!.schoolDetailModel!.data?.state != null &&
          controller!.schoolDetailModel!.data!.state!.isNotEmpty) 
        _showRow(Icons.map, "State", 
          controller!.schoolDetailModel!.data!.state.toString()),

      const SizedBox(height: 10.0),

      if (controller!.schoolDetailModel!.data?.location != null &&
          controller!.schoolDetailModel!.data!.location!.isNotEmpty) 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 14.0, color: Colors.grey),
                  SizedBox(width: 10.0),
                  Text(
                    "Address:",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                controller!.schoolDetailModel!.data!.location!,
                overflow: TextOverflow.ellipsis,
                maxLines: 20,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
    ],
  ),
);

  Widget _showRow(IconData icon, String title, String value) => Row(
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
  );

  Widget _showSocialIcon(String? value, String imagePath) => GestureDetector(
        onTap: () {
          if (["", null, "null"].contains(value) == false) {
            Utility.launchUniversalLinkIOS(Uri.parse(value!));
          }
        },
        child: Container(
          child: Image.asset(
            imagePath,
            height: 40,
            width: 40,
          ),
        ),
      );
}
