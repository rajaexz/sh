
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_hiring/profile/controller/add_skill_controller.dart';
import 'package:school_hiring/utility/widget_helper.dart';

import '../../models/filter_model.dart';
import '../../utility/custom_widget.dart';
import '../../utility/utility.dart';


class AddSkillScreen extends GetView<AddSkillController> {
  const AddSkillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddSkillController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Skill"),
      ),
      body: GetBuilder<AddSkillController>(
        init: controller,
        builder: (controller) => Obx(() => _buildUI()),
      ),
    );
  }

  Widget _buildUI(){
    if(controller.isLoading){
      return Utility.progressIndicator();
    }else{
      return AddSkillJobView(controller: controller,);
    }
  }
}


class AddSkillJobView extends StatelessWidget {
  final AddSkillController? controller;
  final _formKey = GlobalKey<FormState>();
  AddSkillJobView({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Form(
          key: _formKey,
          child: Column(
        children: [
          BikeTextField(
            textEditingController: controller!.skillController,
            isMandatory: true,
            readOnly: true,
            showTrailingIcon: false,
            hintText: "Select Skill",
            label: "Skill",
            isCircular: false,
            
            onChanged: (String? value){
            },
            actionIcon: InkWell(
              child: Icon(FontAwesomeIcons.arrowDownLong),
            ),
            onTap: (){
              Get.bottomSheet(FilterBottomSheet(title: "Select Skill",filterModel: controller!.skillFilterModel,onClick: (FilterDatum? model){
                controller!.skillController!.text = model!.value!;
                controller!.selectedSkill = model;
                controller!.expController!.clear();
                // controller!.selectedExpModel = null;
                Get.back();
              },),);
            },
            textInputType: TextInputType.name,
            maxLines: 1,
            showLabel: true,
            obscureText: false,
          ),
          const SizedBox(height: 10.0,),
          // BikeTextField(
          //   textEditingController: controller!.expController,
          //   isMandatory: true,
          //   readOnly: true,
          //   showTrailingIcon: false,
          //   hintText: "Select Experience",
          //   label: "Experience",
          //   isCircular: false,

          //   onChanged: (String? value){
          //   },
          //   actionIcon: InkWell(
          //     child: Icon(FontAwesomeIcons.arrowDownLong),
          //   ),
          //   onTap: (){
          //     Get.bottomSheet(FilterBottomSheet(title: "Select Experience",filterModel: controller!.jobExpModel,onClick: (FilterDatum? model){
          //       controller!.expController!.text = model!.value!;
          //       // controller!.selectedExpModel = model;
          //       Get.back();
          //     },),);
          //   },
          //   textInputType: TextInputType.name,
          //   maxLines: 1,
          //   showLabel: true,
          //   obscureText: false,
          // ),
          const SizedBox(height: 20.0,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Expanded(child: AppThemeButton(
          //       onClick: (){
          //         if(_formKey.currentState!.validate()){
          //           controller!.addSkill(false);
          //         }
          //       },
          //       label: "Save",
          //       textColor: Colors.white,
          //       color: Get.theme.colorScheme.secondary,
          //     )),
          //     const SizedBox(width: 10.0,),
          //     // Expanded(child: AppThemeButton(
          //     //   onClick: (){
          //     //     controller!.addSkill(true);
          //     //   },
          //     //   label: "Save & Add Another",
          //     // ))
          //   ],
          // )
          AppThemeButton(
            onClick: (){
              if(_formKey.currentState!.validate()){
                controller!.addSkill(false);
              }
            },
            label: "Save",
            textColor: Colors.white,
            color: Get.theme.colorScheme.secondary,
          )
        ],
      )),
    );
  }
}

