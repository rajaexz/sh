import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_hiring/daashboard/controller/applied_job_controller.dart';
import 'package:school_hiring/daashboard/controller/home_controller.dart';
import 'package:school_hiring/utility/helper.dart';

import '../../models/apply_job_model.dart';
import '../../pages/pages.dart';
import '../../utility/app_constant.dart';
import '../../utility/utility.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'home_screen.dart';

// class AppliedJobScreen extends GetView<HomeController> {
//   const AppliedJobScreen({Key? key}) : super(key: key);
// DataTable _createDataTable() {
//     return DataTable(columns: _createColumns(), rows: _createRows());
//   }
// List<DataColumn> _createColumns() {
//     return [
//       DataColumn(label: Text('ID')),
//       DataColumn(label: Text('Book')),
//       DataColumn(label: Text('Author'))
//     ];
//   }
// List<DataRow> _createRows() {
//     return controller.jobList
//         .map((book) => DataRow(cells: [
//               DataCell(Text('#' + book['id'].toString())),
//               DataCell(Text(book['title'])),
//               DataCell(Text(book['author']))
//             ]))
//         .toList();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeController());
//     return RefreshIndicator(
//       onRefresh: () async {
//         await controller!.getData();
//       },
//       child: GetBuilder<HomeController>(
//         init: controller,
//         builder: (controller) => Obx(() => _buildUI()),
//       ),
//     );
//   }

//   Widget _buildUI() {
//     if (controller.isLoading) {
//       return Utility.progressIndicator();
//     } else {
//       return _createDataTable();
//     }
//   }
// }

// class AppliedJobListView extends StatelessWidget {
//   final AppliedJobController? controller;
//   const AppliedJobListView({Key? key, this.controller}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 10.0),
//       child: controller!.jobList.isNotEmpty
//           ? _showJobList()
//           :  ListView(
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height / 2,
//                     child: const NoDataAvailable(message: "No Data Found",)
//                   ),
//                 ],
//               ),
//     );
//   }

//   Widget _showJobList() => Obx(() => ListView.builder(
//       itemCount: controller!.jobList!.length,
//       // shrinkWrap: true,
//       // physics: NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) =>
//           _jobCardAlternate(controller!.jobList!.elementAt(index), index)));

//   Widget _jobCardSecondary(Datum model, int index) => GestureDetector(
//         onTap: () {
//           Get.toNamed(Routes.jobDetailScreen, arguments: [model.id]);
//         },
//         child: Card(
//           elevation: 1.0,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//           child: Container(
//             padding: EdgeInsets.all(18.0),
//             width: Get.width,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                         child: Row(
//                       children: [
//                         Utility.profileAvatar(
//                             model.companyLogo ?? AppConstant.dummyImage,
//                             40,
//                             40,
//                             BoxShape.circle),
//                         const SizedBox(
//                           width: 10.0,
//                         ),
//                         Expanded(
//                             child: Text(
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 2,
//                           textScaler: TextScaler.linear(Get.textScaleFactor),
//                           model.title!.capitalize!,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12,
//                               color: Colors.grey),
//                         ))
//                       ],
//                     )),
//                     // IconButton(onPressed: (){
//                     //   controller!.addRemoveBookmark(index);
//                     // }, icon: Icon(model.isFav == 0 ? Icons.bookmark_border : Icons.bookmark,size: 20,color: Colors.green,),)
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 2,
//                     model.companyName!.capitalizeFirst!,
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 RichText(
//                     textScaler: TextScaler.linear(Get.textScaleFactor),
//                     text: TextSpan(
//                         text: model.jobType,
//                         style: TextStyle(fontSize: 12, color: Colors.grey))),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                         child: Container(
//                       width: Get.width,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Icon(
//                             FontAwesomeIcons.locationDot,
//                             size: 16,
//                             color: Get.theme.colorScheme.secondary,
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Flexible(
//                               child: Text(
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 1,
//                                   textScaler:
//                                       TextScaler.linear(Get.textScaleFactor),
//                                   model.city ?? "N/A".capitalizeFirst!,
//                                   style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w500))),
//                         ],
//                       ),
//                     )),
//                     Expanded(
//                         child: Container(
//                       width: Get.width,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           // Icon(FontAwesomeIcons.clock,size: 16,color: Get.theme.colorScheme.secondary,),
//                           // const SizedBox(width: 10,),
//                           // Flexible(child: Text(
//                           //   overflow: TextOverflow.ellipsis,
//                           //   maxLines: 1,
//                           //   textAlign: TextAlign.end,
//                           //   model.jobType ?? "N/A".capitalizeFirst!,style: TextStyle(
//                           //     fontSize: 15,color: Colors.grey
//                           // ),))
//                           Text(
//                             " ${AppConstant.currencyUnicode}",
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 1,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 18),
//                           ),
//                           const SizedBox(
//                             width: 5.0,
//                           ),
//                           Flexible(
//                               child: ["0", null, 0, "null"]
//                                       .contains(model.salaryFrom!)
//                                   ? Text(
//                                       "Not Disclosed",
//                                       overflow: TextOverflow.ellipsis,
//                                       maxLines: 1,
//                                       textScaler: TextScaler.linear(
//                                           Get.textScaleFactor),
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15),
//                                     )
//                                   : Text(
//                                       "${AppConstant.formattedNumber(model.salaryFrom)}-${AppConstant.formattedNumber(model.salaryTo)}",
//                                       overflow: TextOverflow.ellipsis,
//                                       maxLines: 1,
//                                       textScaler: TextScaler.linear(
//                                           Get.textScaleFactor),
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15),
//                                     ))
//                         ],
//                       ),
//                     ))
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//  Widget _jobCardAlternate(Datum model, int index) =>
//       GestureDetector(
//         onTap: () {
//           Get.toNamed(Routes.jobDetailScreen, arguments: [model.id]);
//         },
//         child: Container(
//           padding: const EdgeInsets.all(12),
//           margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//           decoration: BoxDecoration(
//             color: Get.isDarkMode ? Colors.black87 : Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 offset: Offset(0, 2),
//                 blurRadius: 4,
//                 color: Colors.black.withOpacity(0.1),
//               ),
//             ],
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Utility.profileAvatar(
//                       model.companyLogo ?? AppConstant.dummyImage,
//                       50,
//                       50,
//                       BoxShape.circle),
//                   const SizedBox(width: 10.0),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           model.title!.capitalizeFirst!,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                           style: Get.theme.textTheme.headlineMedium!.copyWith(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         const SizedBox(height: 4.0),
//                         Text(
//                           "${model.city!.capitalizeFirst!}, ${model.state?.capitalizeFirst ?? ""}",
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                           style: Get.theme.textTheme.bodySmall!.copyWith(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.grey.shade600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10.0),
//               Text(
//                 model.companyName!.capitalizeFirst!,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 style: Get.theme.textTheme.headlineLarge!.copyWith(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16,
//                   color: Get.isDarkMode ? Colors.grey : Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 10.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [

//                Row(children: [
//                         const Icon(FontAwesomeIcons.briefcase, size: 14.0, color: Colors.grey),
              
//                   const SizedBox(width: 10,),
//                   SizedBox(
//                     child: Text(
//                       "Experience: ",
//                       style: Get.theme.textTheme.bodyMedium!.copyWith(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                ],),
//                   const SizedBox(width: 2),
//                   Text(
//                     model.jobExperience!.capitalizeFirst! ?? "",
//                     textAlign: TextAlign.center,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontSize: 13,
//                       fontFamily: 'medium',
//                       fontWeight: FontWeight.normal,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//               Row(children: [
//                      const Icon( FontAwesomeIcons.solidClock, size: 14.0, color: Colors.grey),
//                      const SizedBox(width: 10,),
//                   SizedBox(
//                     child: Text(
//                       "Job type: ",
//                       style: Get.theme.textTheme.bodyMedium!.copyWith(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//               ],),
//                   const SizedBox(width: 2),
//                   Text(
//                     model.jobType!.capitalizeFirst! ?? "",
//                     textAlign: TextAlign.center,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontFamily: 'medium',
//                       fontWeight: FontWeight.normal,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
           
//                       Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//               Row(children: [
//                    Icon(FontAwesomeIcons.userFriends, size: 16.0, color: Colors.grey),

//                      const SizedBox(width: 10,),
//                   SizedBox(
//                     child: Text(
//                       "Num Of Positions: ",
//                       style: Get.theme.textTheme.bodyMedium!.copyWith(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//               ],),
//                   const SizedBox(width: 2),
//                   Text(
//                     model.numOfPositions!.toString().capitalizeFirst!,
//                     textAlign: TextAlign.center,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontFamily: 'medium',
//                       fontWeight: FontWeight.normal,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
      
//               const SizedBox(height: 10.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Flexible(
//                     child:    Text(
//                   "Posted: ${timeago.format(model.createdAt!)}",
//                   style: Get.theme.textTheme.bodyMedium!.copyWith(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                 ),
//                   ),
//                   Flexible(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           AppConstant.currencyUnicode,
//                           style: Get.theme.textTheme.bodyMedium!.copyWith(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color:
//                                 Get.isDarkMode ? Colors.grey : Colors.black87,
//                           ),
//                         ),
//                         const SizedBox(width: 5.0),
//                         ["0", null, 0, "null"].contains(model.salaryFrom)
//                             ? Text(
//                                 "Not Disclosed",
//                                 style: Get.theme.textTheme.bodyMedium!.copyWith(
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.grey.shade600,
//                                 ),
//                               )
//                             : Text(
//                                 "${AppConstant.formattedNumber(model.salaryFrom)} - ${AppConstant.formattedNumber(model.salaryTo)}",
//                                 style: Get.theme.textTheme.bodyMedium!.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                   color: Get.isDarkMode
//                                       ? Colors.grey
//                                       : Colors.black87,
//                                 ),
//                               ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
// }
