
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:school_hiring/profile/controller/addSummry.dart';

import 'package:school_hiring/profile/controller/add_basic_detail_controller.dart';

import 'package:school_hiring/utility/app_constant.dart';
import 'package:school_hiring/utility/validators.dart';
import 'package:school_hiring/utility/widget_helper.dart';

import '../../utility/custom_widget.dart';
import '../../utility/utility.dart';

class AddSummaryScreen extends GetView<AddSummaryController> {
  const AddSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddSummaryController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Summary"),
      ),
      body: GetBuilder<AddSummaryController>(
        init: controller,
        builder: (controller) => Obx(() => _buildUI()),
      ),
    );
  }

  Widget _buildUI(){
    if(controller.isLoading){
      return Utility.progressIndicator();
    }else{
      return AddSummaryView(controller: controller,);
    }
  }
}

class AddSummaryView extends StatelessWidget {
  final AddSummaryController? controller;
  final _formKey = GlobalKey<FormState>();
  AddSummaryView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                BikeTextField(
                  
                  textEditingController: controller!.summaryController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Enter Summary",
                  label: "Summary",
                  isCircular: false,
                  textInputType: TextInputType.name,
                  maxLines: 2,
                  showLabel: true,
                  validate: AppValidators.noBlankValidatior,
                  obscureText: false,
                ),
             SizedBox(height: 20,),
                AppThemeButton(
                  onClick: (){
                    if(_formKey.currentState!.validate()){
                      controller!.updateProfile();
                    }
                    //Get.log(controller!.formData().toString());
                  },
                  label: "Update",
                  textColor: Colors.white,
                  color: Get.theme.colorScheme!.secondary,
                )


              ],
            )),
      ),
    );
  }
}
