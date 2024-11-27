
import 'package:get/get.dart';
import 'package:school_hiring/pages/pages.dart';
import 'package:school_hiring/utility/app_constant.dart';

import '../../network/storage_repository.dart';

class SplashController extends GetxController {



 void _redirect() async {
  // Get the stored 'intor' value as a String and parse it to an int
  String? intorString = await StorageRepository.getOfflineKey(AppConstant.offlineintorKey);
  int? intor = intorString != null ? int.tryParse(intorString) : null;

  bool isLoggedIn = await StorageRepository.isLoggedIn();

  // Print the values for debugging
  print("--------------------------------- intorString: $intorString");
  print("--------------------------------- intor: ${intor.runtimeType}");
  print("--------------------------------- isLoggedIn: $isLoggedIn");

  // Delay for 2 seconds (if needed)
  await Future.delayed(const Duration(seconds: 3));

  if ( intor == 0 || intor == null) {
    Get.offNamed(Routes.introScreen);
  } else {
    if (isLoggedIn) {
      Get.offAllNamed(Routes.dashboardScreen);
    } else {
      Get.offAllNamed(Routes.authScreen);
    }
  }
}




  @override
  void onInit() {
    // TODO: implement onInit
    _redirect();
    //Get.offAllNamed(Routes.dashboardScreen);
    super.onInit();
  }

}