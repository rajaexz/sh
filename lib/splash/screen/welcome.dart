// ignore: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school_hiring/utility/utility.dart';

import '../../network/storage_repository.dart';
import '../../pages/pages.dart';
import '../../utility/app_constant.dart';
import '../../utility/static_database.dart';
import '../../utility/styles.dart';
import '../controller/splash_controller.dart';



class OnboardingScreen extends GetView<SplashController> {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: controller,
        builder: (controller) => Onboarding()
      )
    );
  }
}

class Onboarding extends StatefulWidget {
   SplashController ? controller ;
   Onboarding({Key? key ,this.controller}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final int _numPages = 3;

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive
            ? Get.theme.colorScheme.primary
            : Get.theme.colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF2F1F6),
    body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'), // Ensure the image path is correct
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: StaticDatabase.loginIntroList.map((e) => _buildPageContent(
                  e.image.toString(),
                  e.title.toString(),
                  e.description.toString(),
                )).toList(),
              ),
            ),
            if (_currentPage != _numPages - 1)
              _buildNextButton(),
            if (_currentPage == _numPages - 1)
              _buildGetStartedButton(),
            // Align(
            //   alignment: FractionalOffset.bottomCenter,
            //   child: Padding(
            //     padding: const EdgeInsets.only(bottom: 20.0),
            //     child: ListView(
            //       scrollDirection: Axis.horizontal,
            //       children: _buildPageIndicator(),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildPageContent(String imagePath, String title, String subtitle) {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

         if (_currentPage != _numPages - 1)
        Center(
            child: Image.asset(
             
            height: 300.0,
            width: 300.0,
               imagePath),
          ),
          
        Center(
          child: SvgPicture.asset(
            imagePath,
            
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 30.0),
        Center(
          child: Text(
            title,
            style: Get.theme.textTheme.labelMedium!.copyWith( fontWeight: FontWeight.bold,   color:  Colors.black87),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 15.0),
        Center(
          child: Text(
            subtitle,
            style: Get.theme.textTheme.labelMedium!.copyWith(    color:   Colors.black87),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}

Widget _buildNextButton() {
  return Container(
    margin: const EdgeInsets.only(bottom: 40),
    child: Align(
      alignment: FractionalOffset.bottomCenter,
      child: TextButton(
        onPressed: () {
          // _pageController.nextPage(
          //   duration: const Duration(milliseconds: 500),
          //   curve: Curves.ease,
          // );
          
            Get.offAllNamed(Routes.authScreen);
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Icons.arrow_forward,
            size: 30.0,
       color: Colors.white
        
          ),
        ),
      ),
    ),
  );
}

Widget _buildGetStartedButton() {
  return Container(
    margin: const EdgeInsets.only(bottom: 40),
    child: Align(
      alignment: FractionalOffset.bottomCenter,
      child: TextButton(
        onPressed: () {
          try {
            StorageRepository.saveOffline(
                AppConstant.offlineintorKey,
                _currentPage.toString());
            Get.offAllNamed(Routes.authScreen);
          } catch (e) {
            print('Error accessing SharedPreferences: $e');
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Get Started",
                  style: Get.theme.textTheme.bodyMedium!.copyWith(
                         color: Colors.white)),
              const Icon(
                Icons.arrow_forward,
                   color: Colors.white,
                size: 30.0,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

}
