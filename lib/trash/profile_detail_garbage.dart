// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:readmore/readmore.dart';
// import 'package:school_hiring/pages/pages.dart';
// import 'package:school_hiring/profile/controller/profile_detail_controller.dart';
// import 'package:school_hiring/utility/app_constant.dart';
// import 'package:school_hiring/utility/utility.dart';
//
// class ProfileDetailScreen extends GetView<ProfileDetailController> {
//   const ProfileDetailScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(ProfileDetailController());
//     return GetBuilder<ProfileDetailController>(
//         init: controller, builder: (controller) => _buildUI());
//   }
//
//   Widget _buildUI() => Obx(() {
//     if (controller.isLoading) {
//       return Utility.progressIndicator();
//     } else {
//       return ProfileDetailView(
//         controller: controller,
//       );
//     }
//   });
// }
//
// class ProfileDetailView extends StatelessWidget {
//   final ProfileDetailController? controller;
//   const ProfileDetailView({Key? key, this.controller}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: Get.height,
//       width: Get.width,
//       child: DefaultTabController(
//         length: 4,
//         child: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             //Get.log("OkOK ${innerBoxIsScrolled}");
//             return [
//               SliverAppBar(
//                   pinned: true,
//                   floating: true,
//
//                   expandedHeight: 250,
//                   elevation: 0.0,
//                   automaticallyImplyLeading: false,
//                   flexibleSpace: ListView(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     children: [
//                       const SizedBox(
//                         height: 10.0,
//                       ),
//                       Container(
//                         height: 100,
//                         width: 100,
//                         child: Center(
//                           child: Utility.profileAvatar(
//                               controller!.profileDetailModel!.data!.image ??
//                                   AppConstant.dummyImage,
//                               100,
//                               100,
//                               BoxShape.circle),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10.0,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 30.00),
//                         child: Text(
//                           "${controller!.profileDetailModel!.data!.name ?? "N/A"}",
//                           maxLines: 2,
//                           textAlign: TextAlign.center,
//                           overflow: TextOverflow.ellipsis,
//                           textScaler: TextScaler.linear(Get.textScaleFactor),
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 0.0,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 30.00),
//                         child: Text(
//                           "${controller!.profileDetailModel!.data!.email ?? "N/A"}",
//                           maxLines: 2,
//                           textAlign: TextAlign.center,
//                           overflow: TextOverflow.ellipsis,
//                           textScaler: TextScaler.linear(Get.textScaleFactor),
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   bottom: ScrollTabBar(
//                     tabs: [
//                       Tab(
//                         text: "Profile",
//                       ),
//                       Tab(text: "Summary"),
//                       Tab(text: "Resume"),
//                       Tab(text: "Projects")
//                     ],
//                   ))
//             ];
//           },
//           body: TabBarView(children: [
//             BasicDetailView(
//               controller: controller,
//             ),
//             Container(),
//             Container(),
//             Container(),
//           ]),
//         ),
//       ),
//     );
//   }
//
//   SliverAppBar buildAppBar() => SliverAppBar(
//     elevation: 0.0,
//     pinned: true,
//     leading: Container(),
//     title: TabBar(tabs: [
//       TextButton(onPressed: () {}, child: Text("Sub Task")),
//       Icon(Icons.home),
//       Icon(Icons.home),
//     ]),
//   );
// }
//
// class ScrollTabBar extends StatelessWidget implements PreferredSizeWidget {
//   final List<Widget>? tabs;
//   const ScrollTabBar({Key? key, this.tabs}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Get.isDarkMode ? Colors.black : Colors.white,
//       width: Get.width,
//       height: kToolbarHeight,
//       child: TabBar(
//         isScrollable: false,
//         labelStyle: Get.theme.textTheme.titleMedium!
//             .copyWith(fontWeight: FontWeight.w600),
//         //tabAlignment: TabAlignment.fill,
//         tabAlignment: TabAlignment.fill,
//         tabs: tabs!,
//       ),
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }
//
// class BasicDetailView extends StatelessWidget {
//   final ProfileDetailController? controller;
//   const BasicDetailView({Key? key, this.controller}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 10.0,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.0),
//               child: Text(
//                 "Basic Details",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//             ),
//             _showFirstBasicDetails(),
//             const SizedBox(
//               height: 10.0,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.0),
//               child: Text(
//                 "Contact Details",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//             ),
//             _showContactDetails(),
//             const SizedBox(
//               height: 10.0,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.0),
//               child: Text(
//                 "Income Details",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//             ),
//             _showIncomeDetails(),
//             CvListSection(
//               controller: controller,
//             ),
//             JobSkillListSection(
//               controller: controller,
//             ),
//             JobExperienceSection(
//               controller: controller,
//             ),
//             MyEducationSection(
//               controller: controller,
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _showRow(String title, String value) => Container(
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           overflow: TextOverflow.ellipsis,
//           maxLines: 2,
//           textAlign: TextAlign.start,
//           textScaler: TextScaler.linear(Get.textScaleFactor),
//           title,
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 15,
//               color: Colors.grey),
//         ),
//         Text(
//           overflow: TextOverflow.ellipsis,
//           maxLines: 2,
//           textScaler: TextScaler.linear(Get.textScaleFactor),
//           value,
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 15,
//               color: Colors.grey),
//         ),
//       ],
//     ),
//   );
//
//   Widget _showFirstBasicDetails() => Container(
//     child: Card(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Text("Basic Details",style: TextStyle(
//             //     fontSize: 18,
//             //     fontWeight: FontWeight.w600
//             // ),),
//             const SizedBox(
//               height: 10.0,
//             ),
//             _showRow("First Name",
//                 controller!.profileDetailModel!.data!.firstName!),
//             const SizedBox(
//               height: 10.0,
//             ),
//             _showRow("Last Name",
//                 controller!.profileDetailModel!.data!.lastName!),
//             const SizedBox(
//               height: 10.0,
//             ),
//             _showRow(
//                 "Dob",
//                 AppConstant.getDateFormat.format(
//                     controller!.profileDetailModel!.data!.dateOfBirth!)),
//             const SizedBox(
//               height: 10.0,
//             ),
//             _showRow(
//                 "Gender",
//                 controller!.profileDetailModel!.data!.genderId == 1
//                     ? "Male"
//                     : "Female"),
//             const SizedBox(
//               height: 10.0,
//             ),
//             _showRow("Father Name",
//                 controller!.profileDetailModel!.data!.fatherName!),
//             const SizedBox(
//               height: 10.0,
//             ),
//             _showRow(
//                 "Marital Status",
//                 controller!.profileDetailModel!.data!.maritalStatusId == 1
//                     ? "Not Married"
//                     : "Married")
//           ],
//         ),
//       ),
//     ),
//   );
//
//   Widget _showContactDetails() => Container(
//     child: Card(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Text("Contact Details",style: TextStyle(
//             //     fontSize: 18,
//             //     fontWeight: FontWeight.w600
//             // ),),
//             const SizedBox(
//               height: 10.0,
//             ),
//             _showRow("Email", controller!.profileDetailModel!.data!.email!),
//             const SizedBox(
//               height: 10.0,
//             ),
//             _showRow("Mobile Numner",
//                 controller!.profileDetailModel!.data!.phone ?? "N/A"),
//             const SizedBox(
//               height: 10.0,
//             ),
//             _showRow("Alternate Number",
//                 controller!.profileDetailModel!.data!.mobileNum ?? "N/A"),
//           ],
//         ),
//       ),
//     ),
//   );
//
//   Widget _showIncomeDetails() => Container(
//     child: Card(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 5.0),
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.all(Radius.circular(10.0))),
//               child: Row(
//                 children: [
//                   Expanded(
//                       child: Column(
//                         children: [
//                           const SizedBox(
//                             height: 5.0,
//                           ),
//                           Text(
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 1,
//                             textAlign: TextAlign.center,
//                             textScaler: TextScaler.linear(Get.textScaleFactor),
//                             "Current Salary",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15,
//                                 color: Colors.grey),
//                           ),
//                           Text(
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 1,
//                             textAlign: TextAlign.center,
//                             textScaler: TextScaler.linear(Get.textScaleFactor),
//                             "${AppConstant.currencyUnicode}${controller!.profileDetailModel!.data!.currentSalary!}",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15,
//                                 color: Colors.grey),
//                           ),
//                           const SizedBox(
//                             height: 5.0,
//                           ),
//                         ],
//                       )),
//                   Expanded(
//                       child: Column(
//                         children: [
//                           const SizedBox(
//                             height: 5.0,
//                           ),
//                           Text(
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 1,
//                             textAlign: TextAlign.center,
//                             textScaler: TextScaler.linear(Get.textScaleFactor),
//                             "Expected Salary",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15,
//                                 color: Colors.grey),
//                           ),
//                           Text(
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 1,
//                             textAlign: TextAlign.center,
//                             textScaler: TextScaler.linear(Get.textScaleFactor),
//                             "${AppConstant.currencyUnicode}${controller!.profileDetailModel!.data!.expectedSalary!}",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15,
//                                 color: Colors.grey),
//                           ),
//                           const SizedBox(
//                             height: 5.0,
//                           ),
//                         ],
//                       ))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
// class CvListSection extends StatelessWidget {
//   final ProfileDetailController? controller;
//   const CvListSection({Key? key, this.controller}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 10.0,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "My Resume",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                 ),
//                 IconButton(onPressed: (){
//                   Get.toNamed(Routes.addResumeScreen);
//                 }, icon: Icon(Icons.add))
//               ],
//             ),
//           ),
//           controller!.cvListModel!.data!.isNotEmpty ? _showCVList() : _showNoCVList()
//         ],
//       ),
//     );
//   }
//
//   Widget _showCVList() => Container(
//     child: Card(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//         child: ListView.separated(
//             separatorBuilder: (context,index) => Divider(),
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: controller!.cvListModel!.data!.length,
//             itemBuilder: (context, index) => ListTile(
//               dense: true,
//               onTap: () {
//                 Get.log(
//                     "${controller!.cvListModel!.data!.elementAt(index).cvFile!.split(".")}");
//               },
//               leading: Image.asset(Utility.getCVImageType([
//                 "",
//                 null,
//                 "null"
//               ].contains(controller!.cvListModel!.data!.elementAt(index).cvFile)
//                   ? ""
//                   : controller!.cvListModel!.data!
//                   .elementAt(index)
//                   .cvFile!
//                   .split(".").last),
//                 height: 40,
//                 width: 40,
//               ),
//               title: Text(
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 textAlign: TextAlign.start,
//                 textScaler: TextScaler.linear(Get.textScaleFactor),
//                 "${controller!.cvListModel!.data!.elementAt(index).title!.capitalize}",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                     color: Colors.grey),
//               ),
//               subtitle: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     textAlign: TextAlign.start,
//                     textScaler: TextScaler.linear(Get.textScaleFactor),
//                     "${["",null,"null"].contains(controller!.cvListModel!.data!.elementAt(index).cvFile) ? "N/A" : controller!.cvListModel!.data!.elementAt(index).cvFile!.capitalize}",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                         color: Colors.grey),
//                   ),
//                   const SizedBox(height: 5.0,),
//                   Text(
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     textAlign: TextAlign.start,
//                     textScaler: TextScaler.linear(Get.textScaleFactor),
//                     "Added On: ${AppConstant.getDateFormat.format(controller!.cvListModel!.data!.elementAt(index).createdAt!)}",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                         color: Colors.grey),
//                   )
//                 ],
//               ),
//             )
//
//         ),
//       ),
//     ),
//   );
//
//   Widget _showNoCVList() => Container(
//     width: Get.width,
//     child: Card(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(FontAwesomeIcons.plus),
//             const SizedBox(height: 10.0,),
//             Text("No Resume Available",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
// class JobSkillListSection extends StatelessWidget {
//   final ProfileDetailController? controller;
//   const JobSkillListSection({Key? key, this.controller}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 10.0,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "My Skills",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                 ),
//                 IconButton(onPressed: (){
//                   Get.toNamed(Routes.addSkillScreen);
//                 }, icon: Icon(Icons.add))
//               ],
//             ),
//           ),
//           controller!.jobSkillModel!.data!.isNotEmpty ? _showSkillList() : _showNoSkillList()
//         ],
//       ),
//     );
//   }
//
//   Widget _showSkillList() => Container(
//     child: Card(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//         child: ListView.separated(
//             separatorBuilder: (context,index) => Divider(),
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: controller!.jobSkillModel!.data!.length,
//             itemBuilder: (context, index) => ListTile(
//               dense: true,
//               onTap: () {
//                 // Get.log(
//                 //     "${controller!.cvListModel!.data!.elementAt(index).cvFile!.split(".")}");
//               },
//               // leading: Image.asset(Utility.getCVImageType([
//               //   "",
//               //   null,
//               //   "null"
//               // ].contains(controller!.cvListModel!.data!.elementAt(index).cvFile)
//               //     ? ""
//               //     : controller!.cvListModel!.data!
//               //     .elementAt(index)
//               //     .cvFile!
//               //     .split(".")[1]),
//               //   height: 40,
//               //   width: 40,
//               // ),
//               contentPadding: EdgeInsets.zero,
//               title: Text(
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 textAlign: TextAlign.start,
//                 textScaler: TextScaler.linear(Get.textScaleFactor),
//                 "${controller!.jobSkillModel!.data!.elementAt(index).jobSkillName}",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                     color: Colors.grey),
//               ),
//               subtitle: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     textAlign: TextAlign.start,
//                     textScaler: TextScaler.linear(Get.textScaleFactor),
//                     "Experience: ${["",null,"null"].contains(controller!.jobSkillModel!.data!.elementAt(index).asJobExperienceName) ? "N/A" : controller!.jobSkillModel!.data!.elementAt(index).asJobExperienceName!.capitalize}",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                         color: Colors.grey),
//                   ),
//                   const SizedBox(height: 5.0,),
//                   Text(
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     textAlign: TextAlign.start,
//                     textScaler: TextScaler.linear(Get.textScaleFactor),
//                     "Added On: ${AppConstant.getDateFormat.format(controller!.cvListModel!.data!.elementAt(index).createdAt!)}",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                         color: Colors.grey),
//                   )
//                 ],
//               ),
//             )
//
//         ),
//       ),
//     ),
//   );
//
//   Widget _showNoSkillList() => Container(
//     width: Get.width,
//     child: Card(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(FontAwesomeIcons.plus),
//             const SizedBox(height: 10.0,),
//             Text("No Skills Available",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
// class JobExperienceSection extends StatelessWidget {
//   final ProfileDetailController? controller;
//   const JobExperienceSection({Key? key, this.controller}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 10.0,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "My Experience",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                 ),
//                 IconButton(onPressed: (){
//                   Get.toNamed(Routes.editBasicDetailScreen,arguments: [controller!.profileDetailModel]);
//                 }, icon: Icon(FontAwesomeIcons.plus,size: 20,))
//               ],
//             ),
//           ),
//           controller!.userExperienceModel!.data!.isNotEmpty ? _showExpList() : _showNoExpList()
//         ],
//       ),
//     );
//   }
//
//   Widget _showExpList() => Container(
//     child: Card(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//         child: ListView.separated(
//             separatorBuilder: (context,index) => Divider(),
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: controller!.userExperienceModel!.data!.length,
//             itemBuilder: (context, index) => ListTile(
//               dense: true,
//               onTap: () {
//                 // Get.log(
//                 //     "${controller!.cvListModel!.data!.elementAt(index).cvFile!.split(".")}");
//               },
//               leading: Icon(FontAwesomeIcons.building),
//               contentPadding: EdgeInsets.zero,
//               title: Text(
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 textAlign: TextAlign.start,
//                 textScaler: TextScaler.linear(Get.textScaleFactor),
//                 "${controller!.userExperienceModel!.data!.elementAt(index).company!.capitalize}",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                     color: Colors.grey),
//               ),
//               subtitle: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     textAlign: TextAlign.start,
//                     textScaler: TextScaler.linear(Get.textScaleFactor),
//                     "Position: ${["",null,"null","Exp","exp"].contains(controller!.userExperienceModel!.data!.elementAt(index).title!) ? "Sr.Software Engineer" : controller!.userExperienceModel!.data!.elementAt(index).title!.capitalize}",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                         color: Colors.grey),
//                   ),
//                   // const SizedBox(height: 5.0,),
//                   Text(
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     textAlign: TextAlign.start,
//                     textScaler: TextScaler.linear(Get.textScaleFactor),
//                     "${DateFormat().add_yMMM().format(controller!.userExperienceModel!.data!.elementAt(index).dateStart!)} - ${controller!.userExperienceModel!.data!.elementAt(index).isCurrentlyWorking == 1 ? "Present" : DateFormat().add_yMMM().format(controller!.userExperienceModel!.data!.elementAt(index).dateEnd!)}",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                         color: Colors.grey),
//                   ),
//                   Text(
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     textAlign: TextAlign.start,
//                     textScaler: TextScaler.linear(Get.textScaleFactor),
//                     "${controller!.userExperienceModel!.data!.elementAt(index).cityName}, ${controller!.userExperienceModel!.data!.elementAt(index).stateName}",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                         color: Colors.grey),
//                   ),
//                   ReadMoreText("An administrative position in a school typically involves overseeing various aspects of the school's operations to ensure it runs smoothly and efficiently. Below is a general description of what such a role might entail:",
//                     trimMode: TrimMode.Line,
//                     trimLines: 1,
//                     colorClickableText: Colors.pink,
//                     trimCollapsedText: 'Show more',
//                     trimExpandedText: ' Show less',
//                   ),
//                 ],
//               ),
//             )
//
//         ),
//       ),
//     ),
//   );
//
//   Widget _showNoExpList() => Container(
//     width: Get.width,
//     child: Card(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(FontAwesomeIcons.plus),
//             const SizedBox(height: 10.0,),
//             Text("No Experience Available",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
//
// class MyEducationSection extends StatelessWidget {
//   final ProfileDetailController? controller;
//   const MyEducationSection({Key? key, this.controller}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 10.0,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "My Education",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                 ),
//                 IconButton(onPressed: (){
//                   Get.toNamed(Routes.addEducationScreen);
//                 }, icon: Icon(FontAwesomeIcons.plus))
//               ],
//             ),
//           ),
//           controller!.myEducationModel!.data!.isNotEmpty ? _showEduList() : _showNoEduList()
//         ],
//       ),
//     );
//   }
//
//   Widget _showEduList() => Container(
//     child: Card(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//         child: ListView.separated(
//             separatorBuilder: (context,index) => Divider(),
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: controller!.myEducationModel!.data!.length,
//             itemBuilder: (context, index) => ListTile(
//               dense: true,
//               onTap: () {
//                 // Get.log(
//                 //     "${controller!.cvListModel!.data!.elementAt(index).cvFile!.split(".")}");
//               },
//               leading: Icon(FontAwesomeIcons.building),
//               contentPadding: EdgeInsets.zero,
//               title: Text(
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 textAlign: TextAlign.start,
//                 textScaler: TextScaler.linear(Get.textScaleFactor),
//                 "${controller!.myEducationModel!.data!.elementAt(index).degreeTitle!.capitalize} (${controller!.myEducationModel!.data!.elementAt(index).degreeTypeName})",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                     color: Colors.grey),
//               ),
//               subtitle: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     textAlign: TextAlign.start,
//                     textScaler: TextScaler.linear(Get.textScaleFactor),
//                     "Degree: ${["",null,"null","Exp","exp","title"].contains(controller!.myEducationModel!.data!.elementAt(index).degreeTypeName!) ? "B.Tech" : controller!.myEducationModel!.data!.elementAt(index).degreeTypeName!.capitalize}",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                         color: Colors.grey),
//                   ),
//                   // const SizedBox(height: 5.0,),
//                   Text(
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     textAlign: TextAlign.start,
//                     textScaler: TextScaler.linear(Get.textScaleFactor),
//                     "Completion Date: ${controller!.myEducationModel!.data!.elementAt(index).dateCompletion}",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                         color: Colors.grey),
//                   ),
//                   Text(
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     textAlign: TextAlign.start,
//                     textScaler: TextScaler.linear(Get.textScaleFactor),
//                     "${controller!.myEducationModel!.data!.elementAt(index).cityName}, ${controller!.myEducationModel!.data!.elementAt(index).stateName}",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                         color: Colors.grey),
//                   ),
//                   Text(
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     textAlign: TextAlign.start,
//                     textScaler: TextScaler.linear(Get.textScaleFactor),
//                     "${controller!.myEducationModel!.data!.elementAt(index).countryName}",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                         color: Colors.grey),
//                   ),
//
//                 ],
//               ),
//             )
//
//         ),
//       ),
//     ),
//   );
//
//   Widget _showNoEduList() => Container(
//     width: Get.width,
//     child: Card(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(FontAwesomeIcons.plus),
//             const SizedBox(height: 10.0,),
//             Text("No Education Available",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
//
//
