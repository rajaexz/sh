


import 'package:get/get.dart';

class AppValidators {
  static String? commanText(String? value){
    if(value!.isBlank!){
      return "Please Field Cant Empty ";
    } 
    return null;
  }

  static String? phoneNumberValid(String? value){
    if(value!.isBlank!){
      return "Please Enter Phone Number";
    } else if(value.length != 10){
      return "Invalid Phone Number";
    }
    return null;
  }

  static String? noBlankValidatior(String? value){
    if(value!.isBlank!){
      return "Required";
    }
    return null;
  }
  static String? isEmailValidatior(String? value){
    if(value!.isBlank!){
      return "This field is required";
    }else if(GetUtils.isEmail(value) == false){
      return "Invalid Email";
    }
    return null;
  }





}