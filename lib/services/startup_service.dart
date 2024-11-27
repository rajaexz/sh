
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';


import '../network/network_config.dart';
import '../network/storage_repository.dart';
import '../utility/app_constant.dart';

class StartUpService extends GetxService {

  static NetworkProvider? networkProvider;
  static bool? isLogin;
  static String? token;
  static int? userId;
  static String? name;
  static String? email;
  static String? mobile;
  static String? mediaBaseUrl;
  static PackageInfo? packageInfo;
  static String? appVersion;






  Future<bool> init() async{

    networkProvider = Get.put(NetworkProvider());
    isLogin = await StorageRepository.isLoggedIn() ?? false;
    token = await StorageRepository.getToken();

    print(token);
    name = await StorageRepository.getOfflineKey(AppConstant.offlineNameKey) ?? "Guest";
    userId = await StorageRepository.getOfflineKey(AppConstant.offlineUserIdKey) ?? 0;
    email = await StorageRepository.getOfflineKey(AppConstant.offlineEmailKey);
    mobile = await StorageRepository.getOfflineKey(AppConstant.offlineNumberKey);
    packageInfo = await PackageInfo.fromPlatform();
    appVersion = "${packageInfo!.version}+${packageInfo!.buildNumber}";
    Get.log("StartUp Services Started :::: ${isLogin} ${token} ");
    return true;
  }

}