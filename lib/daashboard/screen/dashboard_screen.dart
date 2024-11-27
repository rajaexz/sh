import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_hiring/daashboard/controller/dashboard_controller.dart';
import 'package:school_hiring/daashboard/screen/favorite_tab_screen.dart';
import 'package:school_hiring/daashboard/screen/favorite_job_sreen.dart';
import 'package:school_hiring/daashboard/screen/school_list_screen.dart';
import 'package:school_hiring/utility/app_constant.dart';
import 'package:school_hiring/utility/utility.dart';

import '../../profile/screen/profile_detail_screen.dart';
import '../../utility/styles.dart';
import 'applied_job_screen.dart';
import 'home_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return Scaffold(
      bottomNavigationBar: BottomNavBar(controller: controller),
      appBar: AppBar(
  title:  Image.asset(
        AppConstant.appImage,
        height: 50
      ),
  actions: [
    IconButton(
      onPressed: () {
        Utility.showLogoutDialog();
      },
      icon: Icon(Icons.power_settings_new),
    ),
  ],
)
,
      body: GetBuilder<DashboardController>(
        init: controller,
        builder: (controller) => _buildUIS(),
      ),
    );
  }

  Widget _buildUIS() => Obx(() => IndexedStack(
        index: controller.selectedIndex,
        children: [
          HomeScreen(),
                    //  AppliedJobScreen(),
    HomeScreen(),
            HomeScreen(),
             HomeScreen(),
              HomeScreen(),
          // AppliedJobScreen(),
          // FavoriteTabScreen(),
          // SchoolListScreen(),
          // ProfileDetailScreen(),
        ],
      ));
}

class BottomNavBar extends StatelessWidget {
  final DashboardController? controller;
  const BottomNavBar({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 24),
              label: "Home",
              //backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.kitesurfing, size: 24),
              label: "Applied Job",
              //backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidHeart, size: 24),
              label: "Favorite",
              //backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school, size: 24),
              label: "Academy",
              //backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 24),
              label: "Profile",
              //backgroundColor: Colors.white,
            ),
          ],
          currentIndex: controller!.selectedIndex,
          selectedItemColor: Get.theme.primaryColor,
          type: BottomNavigationBarType.fixed,

          elevation: 0.0,
          //unselectedItemColor: Get.isDarkMode ? Colors.white : Colors.black,
          showUnselectedLabels: true,
          //unselectedLabelStyle: TextStyle(color: Colors.black),
          onTap: (int index) {
            controller!.selectedIndex = index;
            // if(controller!.selectedIndex == 3){
            //   StartUpService.cartListController!.onRefresh();
            //   StartUpService.cartListController!.update();
            // }
          },
        ));
    // return Obx(() => BottomAppBar(
    //   padding: const EdgeInsets.symmetric(horizontal: 10),
    //   height: 60,
    //   color: Get.theme.primaryColor,
    //   shape: const CircularNotchedRectangle(),
    //   notchMargin: 5,
    //     child: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //
    //         _showContainer("Home","assets/images/home.png",0),
    //         _showContainer("Task","assets/images/tasks.png",1),
    //
    //         _showContainer("Expenses","assets/images/expenses.png",2),
    //         _showContainer("Leads","assets/images/leads.png",3)
    //         // _showContainer("Home","assets/images/home.png"),
    //           // BottomNavigationBarItem(
    //           //   icon: Image.asset("assets/images/home.png",height: 24,width: 24,color: controller!.selectedIndex == 0 ? Get.theme.primaryColor : Colors.black,),
    //           //   label: "Home",
    //           //   //backgroundColor: Colors.white,
    //           // ),
    //           // BottomNavigationBarItem(
    //           //   icon: Image.asset("assets/images/tasks.png",height: 24,width: 24,color: controller!.selectedIndex == 1 ? Get.theme.primaryColor : Colors.black,),
    //           //   label: "Task",
    //           //   //backgroundColor: Colors.white,
    //           // ),
    //           // BottomNavigationBarItem(
    //           //   icon: Image.asset("assets/images/expenses.png",height: 24,width: 24,color: controller!.selectedIndex == 2 ? Get.theme.primaryColor : Colors.black,),
    //           //   label: "Expenses",
    //           //   //backgroundColor: Colors.white,
    //           // ),
    //           // BottomNavigationBarItem(
    //           //   icon: Image.asset("assets/images/leads.png",height: 24,width: 24,color: controller!.selectedIndex == 3 ? Get.theme.primaryColor : Colors.black,),
    //           //   label: "Leads",
    //           //   //backgroundColor: Colors.white,
    //           // ),
    //           // BottomNavigationBarItem(
    //           //   icon: Image.asset("assets/images/more.png",height: 24,width: 24,color: controller!.selectedIndex == 4 ? Get.theme.primaryColor : Colors.black,),
    //           //   label: "More",
    //           //   //backgroundColor: Colors.white,
    //           // ),
    //
    //
    //       ],
    //     ),
    //   // currentIndex: controller!.selectedIndex,
    //   // selectedItemColor: Get.theme.primaryColor,
    //   // type: BottomNavigationBarType.fixed,
    //   //
    //   // elevation: 0.0,
    //   // unselectedItemColor: Get.isDarkMode ? Colors.white : Colors.black,
    //   // showUnselectedLabels: true,
    //   // //unselectedLabelStyle: TextStyle(color: Colors.black),
    //   // onTap: (int index) {
    //   //   controller!.selectedIndex = index;
    //   //   // if(controller!.selectedIndex == 3){
    //   //   //   StartUpService.cartListController!.onRefresh();
    //   //   //   StartUpService.cartListController!.update();
    //   //   // }
    //   // },
    // ));
  }

  Widget _showContainer(String name, String imageLink, int index) =>
      GestureDetector(
        onTap: () {
          controller!.selectedIndex = index;
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          child: Column(
            children: [
              Image.asset(
                imageLink,
                height: 24,
                width: 24,
                color: controller!.selectedIndex == 3
                    ? Get.theme.primaryColor
                    : Colors.white,
              ),
              Text(
                name,
                style: Get.theme.textTheme.titleSmall!
                    .copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      );
}
