import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_hiring/main.dart';
import 'package:school_hiring/utility/app_constant.dart';
import 'package:school_hiring/utility/styles.dart';

import 'package:get_storage/get_storage.dart';

import '../network/storage_repository.dart';

class ThemeController extends GetxController {
  // Observable to hold the current theme mode
  RxBool isDarkMode =
      false.obs; // Changed to RxBool for better alignment with your approach

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromStorage();
        Get.forceAppUpdate();
    update();
  }

  Future<void> _loadThemeFromStorage() async {
    // Load theme mode from storage or default to light theme
    Get.forceAppUpdate();
    bool? isDark =
        await StorageRepository.getOfflineKey(AppConstant.toggleTheme);
    isDarkMode.value = isDark! ?? true; // Use .value to update the RxBool
    update();
  }

  // Method to toggle between light and dark theme
void toggleTheme() {
  final newTheme = !isDarkMode.value;
  isDarkMode.value = newTheme;

  StorageRepository.saveOffline(AppConstant.toggleTheme, newTheme);
  _applyTheme(newTheme);
update(); // This updates the controller's listeners
  // Force update all pages
  Get.forceAppUpdate();
}


  void _applyTheme(bool isDark) {
        Get.forceAppUpdate();
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    update();
  }

  // Get the current theme data
  ThemeData get themeData {
    return isDarkMode.value ? Styles.darkTheme : Styles.themeLight;
  }
}
