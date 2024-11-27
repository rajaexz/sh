import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:school_hiring/utility/app_constant.dart';

import '../../pages/pages.dart';
import '../../theme/theme_controller.dart';
import '../../utility/utility.dart';
import '../../utility/utility_engine.dart';
import '../controller/CustomNavigationDrawerController.dart';

class CustomNavigationDrawerScreen
    extends GetView<CustomNavigationDrawerController> {
  const CustomNavigationDrawerScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    Get.put(CustomNavigationDrawerController());
    return GetBuilder<CustomNavigationDrawerController>(
        init: controller, builder: (controller) => _buildUI());
  }

  Widget _buildUI() => Obx(() {
        if (controller.isLoading) {
          return Utility.progressIndicator();
        } else {
          return CustomNavigationDrawer(
            controller: controller,
          );
        }
      });
}

class CustomNavigationDrawer extends StatelessWidget {
  CustomNavigationDrawerController controller;
  CustomNavigationDrawer({key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Scaffold(
      // Light grey background
      appBar: AppBar(
        elevation: 1,
        leading: GestureDetector(
          onTap: () {
                 Get.forceAppUpdate();
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 28,
            color: Get.isDarkMode ? Colors.white:  Colors.black  ,
          ),
        ),
        title: Row(
          children: [
            SizedBox(width: 10),
            Text(
              "Settings",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                   color: Get.isDarkMode ? Colors.white:  Colors.black  ,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Profile Picture and Name
              _showProfileSection(),
              const SizedBox(height: 40),
              // Setting Options
              buildSettingOption(
                context: context,
                name: "Share Referral Link",
                icon: Icons.share,
                description: "Invite friends and earn rewards",
                onTapClick: () {
                  UtilityEngine.shareReferralLink(
                      'https://www.facebook.com/your_page_username_or_id');
                },
              ),
              buildSettingOption(
                context: context,
                name: "Faq",
                icon: Icons.question_answer,
                description: "Faq ",
                onTapClick: () {
                  Get.toNamed(Routes.faqList);
                },
              ),
              buildSettingOption(
                context: context,
                name: "App Rate",
                icon: Icons.star_rate,
                description: "Rate us on the App Store",
                onTapClick: UtilityEngine.launchRateAppURLUpdate,
              ),
              buildSettingOption(
                context: context,
                name: "Update",
                icon: Icons.update,
                description: "Check for the latest updates",
                onTapClick: () {
                  UtilityEngine.showRateUsDialogRating(context);
                },
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: themeController.isDarkMode.value
                      ? Colors.black
                      : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Get.theme.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Obx(() => Icon(
                                themeController.isDarkMode.value
                                    ? Icons.nightlight_round
                                    : Icons.sunny,
                                size: 28,
                                color: Get.theme.primaryColor,
                              )),
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "Themes",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Obx(() => Switch(
                          value: themeController.isDarkMode.value,
                          onChanged: (value) {
                        
                            themeController.toggleTheme();
                            Get.changeThemeMode(themeController.isDarkMode.value
                                ? ThemeMode.dark
                                : ThemeMode.light);
                          },
                        )),
                  ],
                ),
              ),
              buildSettingOption(
                context: context,
                name: "Logout",
                icon: Icons.logout,
                description: "",
                onTapClick: () {
                  controller.logout();
                },
              ),
            ],
          ),
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
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                            
                                    AppConstant.dummyImage),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller!.profileDetailModel!.data!.firstName ?? "N/A"}",
                        style: Get.theme.textTheme.titleMedium!.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        controller!.profileDetailModel!.data!.email ?? "N/A",
                        style: Get.theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildSettingOption({
    required BuildContext context,
    required String name,
    required IconData icon,
    required String description,
    required VoidCallback onTapClick,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Get.theme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              size: 28,
              color: Get.theme.primaryColor,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Get.isDarkMode ? Colors.grey : Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onTapClick,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
