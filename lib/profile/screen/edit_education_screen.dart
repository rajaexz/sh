import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/profile/controller/edit_education_controller.dart';
import 'package:school_hiring/utility/utility.dart';
import 'package:school_hiring/utility/widget_helper.dart';

import '../../models/filter_model.dart';
import '../../utility/custom_widget.dart';

class EditEducationScreen extends GetView<EditEducationController> {
  const EditEducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditEducationController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Education"),
      ),
      body: GetBuilder<EditEducationController>(
        init: controller,
        builder: (controller) => Obx(() => _buildUI()),
      ),
    );
  }



  Widget _buildUI(){
    if(controller.isLoading){
      return Utility.progressIndicator();
    }else{
      return EditEducationView(controller: controller,);
    }
  }

}


class EditEducationView extends StatelessWidget {
  final EditEducationController? controller;
  final _formKey = GlobalKey<FormState>();
  EditEducationView({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                BikeTextField(
                  textEditingController: controller!.degreeLevelController,
                  isMandatory: true,
                  readOnly: true,
                  showTrailingIcon: false,
                  hintText: "Select Degree Level",
                  label: "Degree Level",
                  isCircular: false,
                  onChanged: (String? value){
                  },
                  actionIcon: InkWell(
                    child: Icon(FontAwesomeIcons.arrowDownLong),
                  ),
                  onTap: (){
                    Get.bottomSheet(FilterBottomSheet(title: "Select Degree Level",filterModel: controller!.degreeLevelFilterModel,onClick: (FilterDatum? model){
                      controller!.degreeLevelController!.text = model!.value!;
                      controller!.selectedDegreeLevel = model;
                      controller!.degreeTypeController!.clear();
                      controller!.selectedDegreeLevelType = null;
                      controller!.fetchDegreeTypeData();
                      Get.back();
                    },),);
                  },
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                ),
                const SizedBox(height: 10.0,),
                BikeTextField(
                  textEditingController: controller!.degreeTypeController,
                  isMandatory: true,
                  readOnly: true,
                  showTrailingIcon: false,
                  hintText: "Select Degree Type",
                  label: "Degree Type",
                  isCircular: false,
                  actionIcon: Obx(() => controller!.isDegreeLevelTypeLoading ? SizedBox(height: 20,width: 20,child: Utility.progressIndicator(),) : Icon(FontAwesomeIcons.arrowDown)),
                  onChanged: (String? value){
                  },
                  // suffixIcon: InkWell(
                  //   child: Icon(FontAwesomeIcons.arrowDownLong),
                  // ),
                  onTap: (){
                    if(controller!.degreeLevelController!.text.isBlank! || controller!.isDegreeLevelTypeLoading == true){
                      bakeToast("Select Degree Level",type: ToastType.warning);
                    }else{
                      Get.bottomSheet(FilterBottomSheet(title: "Select Degree Type",filterModel: controller!.degreeTypeFilterModel,onClick: (FilterDatum? model){
                        controller!.degreeTypeController!.text = model!.value!;
                        controller!.selectedDegreeLevelType = model;
                        Get.back();
                      },),);
                    }
                  },
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                ),
                const SizedBox(height: 10.0,),
                BikeTextField(
                  textEditingController: controller!.degreeTitleController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Enter Degree Title",
                  label: "Degree Title",
                  isCircular: false,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                ),
                // const SizedBox(height: 10.0,),
                BikeTextField(
                  textEditingController: controller!.majorSubjectController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Select Major Subject",
                  label: "Major Subject",
                  isCircular: false,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                  onTap: (){
                    Get.bottomSheet(FilterBottomSheetMultiple(title: "Select Major Subject",controller: controller!,onClick: (FilterDatum? model){
                      controller!.cityController!.text = model!.value!;
                      controller!.selectedCity = model;
                      Get.back();
                    },),);
                  },
                ),
                const SizedBox(height: 10.0,),
                BikeTextField(
                  textEditingController: controller!.stateController,
                  isMandatory: true,
                  readOnly: true,
                  showTrailingIcon: false,
                  hintText: "Select State",
                  label: "State",
                  isCircular: false,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                  onTap: (){
                    Get.bottomSheet(FilterBottomSheet(title: "Select State",filterModel: controller!.stateFilterModel,onClick: (FilterDatum? model){
                      controller!.stateController!.text = model!.value!;
                      controller!.selectedState = model;
                      controller!.cityController!.clear();
                      controller!.selectedCity = null;
                      controller!.fetchCityData();
                      Get.back();
                    },),);
                  },
                ),
                const SizedBox(height: 10.0,),
                BikeTextField(
                  textEditingController: controller!.cityController,
                  isMandatory: true,
                  readOnly: true,
                  showTrailingIcon: false,
                  hintText: "Select City",
                  label: "City",
                  isCircular: false,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  actionIcon: Obx(() => controller!.isDegreeCityLoading ? SizedBox(height: 20,width: 20,child: Utility.progressIndicator(),) : Icon(FontAwesomeIcons.arrowDown)),
                  obscureText: false,
                  onTap: (){
                    if(controller!.stateController!.text.isBlank! || controller!.isDegreeCityLoading == true){
                      bakeToast("Select State",type: ToastType.warning);
                    }else{
                      Get.bottomSheet(FilterBottomSheet(title: "Select City",filterModel: controller!.cityFilterModel,onClick: (FilterDatum? model){
                        controller!.cityController!.text = model!.value!;
                        controller!.selectedCity = model;
                        Get.back();
                      },),);
                    }
                  },
                ),
                const SizedBox(height: 10.0,),
                BikeTextField(
                  textEditingController: controller!.institutionController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Enter Institution",
                  label: "Institution",
                  isCircular: false,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                ),
                const SizedBox(height: 10.0,),
                BikeTextField(
                  textEditingController: controller!.dateCompletionController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Select Completion Date",
                  label: "Completion Date",
                  isCircular: false,
                  textInputType: TextInputType.datetime,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                ),
                const SizedBox(height: 10.0,),
                BikeTextField(
                  textEditingController: controller!.degreeResultController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Select Degree Result",
                  label: "Degree Result",
                  isCircular: false,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                ),
                const SizedBox(height: 10.0,),
                BikeTextField(
                  textEditingController: controller!.resultTypeController,
                  isMandatory: true,
                  readOnly: true,
                  showTrailingIcon: false,
                  hintText: "Select Result",
                  label: "Result",
                  isCircular: false,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                  actionIcon: InkWell(
                    child: Icon(FontAwesomeIcons.arrowDownLong),
                  ),
                  onTap: (){
                    Get.bottomSheet(FilterBottomSheet(title: "Select Result Type",filterModel: controller!.resultTypeFilterModel,onClick: (FilterDatum? model){
                      controller!.resultTypeController!.text = model!.value!;
                      controller!.selectedResultType = model;

                      Get.back();
                    },),);
                  },
                ),
                const SizedBox(height: 20.0,),
                AppThemeButton(
                  onClick: (){
                    if(_formKey.currentState!.validate()){
                      controller!.addEducation();
                    }
                  },
                  label: "Save",
                  textColor: Colors.white,
                  color: Get.theme.colorScheme.secondary,
                )
              ],
            )),
      ),
    );
  }
}


class FilterBottomSheetMultiple extends StatelessWidget {
  final EditEducationController? controller;
  final String? title;
  final void Function(FilterDatum model)? onClick;
  const FilterBottomSheetMultiple({Key? key,this.controller,this.title,this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: Colors.white,
      child: Column(
        children: [
          AppBar(
            title: Text(title!),
            actions: [
              MaterialButton(onPressed: (){
                controller!.majorSubjectController!.text =  controller!.getMajorSubjectStringName().join(",");
                Get.back();
              },child: Text("Apply"),)
            ],
          ),
          Expanded(child: GetBuilder<EditEducationController>(
            init: controller,
            builder: (controller) => _showListView(),
          ))
        ],
      ),
    );
  }

  Widget _showListView() => ListView.builder(
      itemCount: controller!.majorSubjectFilterModel!.data!.length,
      itemBuilder: (context,index) => ListTile(
        onTap: ()  {
          controller!.majorSubjectFilterModel!.data!.elementAt(index).isSelected = !controller!.majorSubjectFilterModel!.data!.elementAt(index).isSelected!;
          Get.log("qwe ${controller!.majorSubjectFilterModel!.data!.elementAt(index).isSelected}");
        },
        title: Text(controller!.majorSubjectFilterModel!.data!.elementAt(index).value!.toString().capitalize!),
        trailing: IconButton(
          onPressed: (){

            controller!.majorSubjectFilterModel!.data!.elementAt(index).isSelected = !controller!.majorSubjectFilterModel!.data!.elementAt(index).isSelected!;
            controller!.update();
          },
          icon: Obx(() => controller!.majorSubjectFilterModel!.data!.elementAt(index).isSelected! ? Icon(Icons.check_box ): Icon(Icons.check_box_outline_blank_outlined)),
        ),
      ));

}
