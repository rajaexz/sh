

import 'package:get/get.dart';

class DashboardController extends GetxController {


  RxInt _selectedIndex = 0.obs;

  get selectedIndex => _selectedIndex.value;

  set selectedIndex(index) => _selectedIndex.value = index;
}