import 'dart:io';
import 'dart:math';
import 'package:school_hiring/theme/theme_controller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:url_launcher/url_launcher.dart';


class UtilityEngine {


  static Future<File> getCroppedImage(File? file) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: file!.path,
      cropStyle: CropStyle.circle,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: "Crop Picture",
            toolbarColor: Get.theme.primaryColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: "Crop Picture",
        ),
      ],
    );
    return File(croppedFile!.path);
  }


  static Future<File?> pickImage(ImageSource source) async{
    final ImagePicker picker = ImagePicker();
    try{
      XFile? file  = await picker.pickImage(imageQuality: 10,source: source);
      return File(file!.path);
    }catch(e){
      return null;
    }
  }





























static getStoreUrl(String packageName, String iOSAppId) {
  if (Platform.isAndroid) {
    return 'https://play.google.com/store/apps/details?id=$packageName';
  } else if (Platform.isIOS) {
    return 'https://apps.apple.com/us/app/your-app-name/$iOSAppId';
  } else {
    throw 'Unsupported platform';
  }
}

 static  launchRateAppURL() async {
  // The package name (Android) or app ID (iOS) of your app
  const String packageName = 'your_app_package_name';
  const String iOSAppId = 'your_app_id';

  if (await canLaunchUrl(Uri.parse(getStoreUrl(packageName, iOSAppId)))) {
    await launchUrl(Uri.parse(getStoreUrl(packageName, iOSAppId)));
  } else {
    throw 'Could not launch store URL';
  }
}



// update
static showRateUsDialogUpdate(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor:  Get.isDarkMode ? Colors.black : Colors.white,
        contentTextStyle:  TextStyle(
    color: Get.theme.colorScheme.primary,
          fontFamily: 'Lora',
          fontWeight: FontWeight.w400,
          fontSize: 10,
        ),
        content:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Update Available",
              style: TextStyle(
               color: Get.theme.colorScheme.primary,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please consider updating us!",
              style: TextStyle(
               color: Get.theme.colorScheme.primary,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child:  Text(
              "Maybe later",
              style: TextStyle(
               color: Get.theme.colorScheme.primary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              launchRateAppURLUpdate();
              Navigator.pop(context, true);
            },
            child:  Text(
              "Update Now",
              style: TextStyle( color: Get.theme.colorScheme.primary,),
            ),
          ),
        ],
      );
    },
  );
}

static launchRateAppURLUpdate() async {
  // The package name (Android) or app ID (iOS) of your app
  const String packageName = 'your_app_package_name';
  const String iOSAppId = 'your_app_id';

  if (await canLaunchUrl(
      Uri.parse(getStoreUrlUpdata(packageName, iOSAppId)))) {
    await launchUrl(Uri.parse(getStoreUrlUpdata(packageName, iOSAppId)));
  } else {
    throw 'Could not launch store URL';
  }
}
static showRateUsDialogRating(BuildContext context) async {

  final ThemeController themeController = Get.put(ThemeController());

  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: themeController.isDarkMode.value ? Colors.black : Colors.white,
        contentTextStyle: TextStyle(
         color: Get.theme.colorScheme.secondary,
          fontFamily: 'Lora',
          fontWeight: FontWeight.w400,
          fontSize: 10,
        ),
        content:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Enjoying our app?",
              style: TextStyle(
               color: Get.theme.colorScheme.primary,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please consider rating us!",
              style: TextStyle(
          color: Get.theme.colorScheme.primary,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child:  Text(
              "Maybe later",
              style: TextStyle(
               color: Get.theme.colorScheme.primary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              launchRateAppURL();
              Navigator.pop(context, true);
            },
            child:  Text(
              "Rate Now",
              style: TextStyle( color: Get.theme.colorScheme.primary,),
            ),
          ),
        ],
      );
    },
  );
}

static getStoreUrlUpdata(String packageName, String iOSAppId) {
  if (Platform.isAndroid) {
    return 'https://play.google.com/store/apps/details?id=$packageName';
  } else if (Platform.isIOS) {
    return 'https://apps.apple.com/us/app/your-app-name/$iOSAppId';
  } else {
    throw 'Unsupported platform';
  }
}

static generateRandomCode(int length) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  return String.fromCharCodes(
    Iterable.generate(
        length, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
  );
}

static shareReferralLink(String referralLink) {
  String referralCode = generateRandomCode(6);
  Share.share(
      'Join our app using this referral link: ${referralLink + referralCode}');
}

//facebook link
static launchFacebookPage() async {
  final facebookPageUrl = 'https://www.facebook.com/your_page_username_or_id';
  if (await canLaunchUrl(Uri.parse(facebookPageUrl))) {
    await launchUrl(Uri.parse(facebookPageUrl));
  } else {
    throw 'Could not launch Facebook page';
  }
}

//instagram link
static launchInstagramProfile() async {
  final instagramProfileUrl =
      'https://www.instagram.com/your_profile_username/';
  if (await canLaunch(instagramProfileUrl)) {
    await launch(instagramProfileUrl);
  } else {
    throw 'Could not launch Instagram profile';
  }
}

}