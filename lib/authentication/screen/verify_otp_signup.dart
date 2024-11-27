
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../pages/pages.dart';
import '../../utility/app_constant.dart';
import '../../utility/widget_helper.dart';
import '../controller/verify_otp_controller.dart';
import '../controller/verify_otp_signup_controller.dart';

class VerifyOtpSignupScreen extends GetView<VerifyOtpSignUpController> {
  const VerifyOtpSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyOtpSignUpController());
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color(0xff523313B8)),
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<VerifyOtpSignUpController>(
        init: controller,
        builder: (controller) => VerifySignupOtpView(controller: controller,),
      ),
    );
  }
}

class VerifySignupOtpView extends StatelessWidget {
  final VerifyOtpSignUpController? controller;
  const VerifySignupOtpView({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
         
          children: [
            Container(
              child: Center(
                child: SvgPicture.asset(AppConstant.appLogoSVG,height: Get.height * 0.20,width: Get.width * 0.40,fit: BoxFit.contain,),
              ),
            ),
            RichText(text: TextSpan(
              text: "Enter OTP Sent to your mobile at ",
                //text: "Enter OTP Sent to your ${controller!.isEmailMode ? 'email' : 'mobile'} at ",
              style: Get.theme.textTheme.titleSmall!.copyWith(
                color: Color(0xff3B3232),fontSize: 10
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "${controller!.mobile}",
                  style: Get.theme.textTheme.titleSmall!.copyWith(
                      color: Color(0xffA53C00),fontSize: 10
                  ),

                )
              ]
            )),
            const SizedBox(height: 20.0,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 50.0),child: PinCodeTextField(
              length: 6,
              obscureText: false,
              controller: controller!.otpController,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              autoDisposeControllers: false,
                 
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5.0),
                  fieldHeight: 40,
                  fieldWidth: 40,
                  
                  selectedColor: Get.theme.primaryColor.withOpacity(0.80),
                  //selectedFillColor: Get.theme.primaryColor,
                  disabledColor: Get.theme.primaryColor,
                  activeFillColor: Get.theme.primaryColor.withOpacity(0.40),
                  inactiveColor: Get.theme.primaryColor,
                  activeColor: Get.theme.primaryColor,
                  inactiveFillColor: Get.theme.primaryColor.withOpacity(0.20),
                  errorBorderColor: Colors.transparent),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {},
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
              appContext: Get.context!,
            ),),

            const SizedBox(height: 10.0,),

            const SizedBox(height: 10.0,),
            AppThemeButton(
                       color:Get.theme.colorScheme.secondary,
              label: "Verify",
              textColor:   Get.isDarkMode ? Colors.black87 :Colors.white  ,
              onClick: (){
                controller!.checkOtp();
              },
            )
          ],
        ),
      ),
    ));
  }
}

