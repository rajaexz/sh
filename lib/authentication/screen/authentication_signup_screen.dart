import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school_hiring/authentication/controller/authentication_controller.dart';
import 'package:school_hiring/authentication/controller/authentication_signup_controller.dart';
import 'package:school_hiring/utility/custom_widget.dart';

import '../../pages/pages.dart';
import '../../utility/app_constant.dart';
import '../../utility/styles.dart';
import '../../utility/validators.dart';
import '../../utility/widget_helper.dart';

class AuthenticationSignupScreen extends GetView<AuthenticationSignupController> {
  const AuthenticationSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationSignupController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,

      ),
      body: GetBuilder<AuthenticationSignupController>(
        init: controller,
        builder: (controller) => AuthenticationView(
          controller: controller,
        ),
      ),
    );
  }
}

class AuthenticationView extends StatelessWidget {
  AuthenticationSignupController? controller;
  final _formkey = GlobalKey<FormState>();
  AuthenticationView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Container(
  height: Get.height,
  width: Get.width,
  padding: const EdgeInsets.symmetric(horizontal: AppConstant.globalHorizontalMargin),
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/bg.png'), // Use a PNG or JPG file here
      fit: BoxFit.cover,
    ),
  ),
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Center(
          child: SvgPicture.asset(
            AppConstant.appLogoSVG,
            height: Get.height * 0.20,
            width: Get.width * 0.40,
            fit: BoxFit.contain,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Sign Up",
            textScaleFactor: Get.textScaleFactor,
            style: Get.theme.textTheme.headlineLarge!.copyWith(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        _form(),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "If you are already registered?",
              textScaleFactor: Get.textScaleFactor,
              style: TextStyle(
                color: Get.isDarkMode ? Colors.grey : Colors.black87,
              ),
            ),
            const SizedBox(width: 5.0),
            InkWell(
              onTap: () {
                Get.offAllNamed(Routes.authScreen);
              },
              child: Text(
                "Sign in",
                // ignore: deprecated_member_use
                textScaleFactor: Get.textScaleFactor,
                style: TextStyle(
               color:Colors.blue
                ),
              ),
            ),
          ],
        ),
     ],
    ),
  ),
);
  }

  Widget _form() => Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

         Row(
   children: [
     Expanded(
       child: BikeTextField(
                  readOnly: false,
                  showLabel: true,
                  textEditingController: controller!.firstController,
                  label: "First Name",
                  
                  suffixIcon: Icon(Icons.person,),
                  obscureText: false,
                  hintText: "First Name",
                  maxLines: 1,
                  validate: AppValidators.noBlankValidatior,
                  isMandatory: true,
                  maxLength: 20,
                  textInputType: TextInputType.name,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  showTrailingIcon: true,
       
                ),
     ),

SizedBox(width: 10,),
       Expanded(
         child: BikeTextField(
              readOnly: false,
              showLabel: true,
              textEditingController: controller!.lastController,
                 label: "Last Name",
              
            suffixIcon: Icon(Icons.person,),
              obscureText: false,
              hintText: "Last Name",
              maxLines: 1,
              validate: AppValidators.noBlankValidatior,

              isMandatory: true,
              maxLength: 20,
              textInputType: TextInputType.name,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              showTrailingIcon: true,
         
            ),
       ),
      

   ],
 ),
         
         
           BikeTextField(
            readOnly: false,
            showLabel: true,
            textEditingController: controller!.mobileController,
            label: "Mobile Number",
            
            suffixIcon: Icon(Icons.phone_android,),
            obscureText: false,
            hintText: " Mobile Number",
            maxLines: 1,
            validate: AppValidators.noBlankValidatior,
            isMandatory: true,
            maxLength: 10,
            textInputType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            showTrailingIcon: true,

          ),
          
        

          SizedBox(height: 20,),  
          AppThemeButton(
            label: "Verify",
            color:Get.theme.colorScheme.secondary,
            textColor:     Colors.white,
            onClick: (){
              if(_formkey.currentState!.validate()){
                controller!.initVerification();
              }
              //Get.offAllNamed(Routes.dashboardScreen);
            },
          )
        ],
      ));


}