import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:ots/toast/types.dart';
import 'package:school_hiring/profile/controller/edit_experience_controller.dart';
import 'package:school_hiring/utility/validators.dart';
import 'package:school_hiring/utility/widget_helper.dart';

import '../../models/filter_model.dart';
import '../../utility/app_constant.dart';
import '../../utility/custom_widget.dart';
import '../../utility/utility.dart';


class EditExperienceScreen extends GetView<EditExperienceController> {
  const EditExperienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditExperienceController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Experience"),
      ),
      body: GetBuilder<EditExperienceController>(
        init: controller,
        builder: (controller) => Obx(() => _buildUI()),
      ),
    );
  }

  Widget _buildUI(){
    if(controller.isLoading){
      return Utility.progressIndicator();
    }else{
      return EditExperienceView(controller: controller,);
    }
  }
}

class EditExperienceView extends StatelessWidget {
  final EditExperienceController? controller;
  final _formKey = GlobalKey<FormState>();
  EditExperienceView({Key? key,this.controller}) : super(key: key);

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
                  textEditingController: controller!.titleController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Enter Title",
                  label: "Title",
                  isCircular: false,

                  onChanged: (String? value){
                  },

                  onTap: (){
                    // Get.bottomSheet(FilterBottomSheet(title: "Select Skill",filterModel: controller!.skillFilterModel,onClick: (FilterDatum? model){
                    //   controller!.skillController!.text = model!.value!;
                    //   controller!.selectedSkill = model;
                    //   controller!.expController!.clear();
                    //   controller!.selectedExpModel = null;
                    //   Get.back();
                    // },),);
                  },
                  textInputType: TextInputType.text,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                ),
                const SizedBox(height: 10.0,),




                         BikeTextField(
                  textEditingController: controller!.descriptionController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Enter Description",
                  label: "Designation",
                                maxLines: 23,
                  isCircular: false,

                  onChanged: (String? value){
                  },

                  onTap: (){
                    // Get.bottomSheet(FilterBottomSheet(title: "Select Skill",filterModel: controller!.skillFilterModel,onClick: (FilterDatum? model){
                    //   controller!.skillController!.text = model!.value!;
                    //   controller!.selectedSkill = model;
                    //   controller!.expController!.clear();
                    //   controller!.selectedExpModel = null;
                    //   Get.back();
                    // },),);
                  },
                  textInputType: TextInputType.name,
           
                  showLabel: true,
                  obscureText: false,
                ),
                const SizedBox(height: 10.0,),
                BikeTextField(
                  textEditingController: controller!.companyController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Enter Company Name",
                  label: "Company Name",
                  isCircular: false,

                  onChanged: (String? value){
                  },


                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                ),
                
                const SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(child: BikeTextField(
                      textEditingController: controller!.dateStartController,
                      isMandatory: true,
                      readOnly: true ,
                      showTrailingIcon: false,
                      hintText: "Choose Start Date",
                      label: "Start Date",
                      suffixIcon: Icon(Icons.calendar_month),
                      validate: AppValidators.noBlankValidatior,
                      textInputType: TextInputType.name,
                      maxLines: 1,
                      showLabel: true,
                      onTap: () async {

                        await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(1955 + 70),
                            initialEntryMode:
                            DatePickerEntryMode.calendarOnly)
                            .then((selectedDate) {
                          if (selectedDate != null) {
                            controller!.dateStartController!.text = AppConstant
                                .getDateFormat
                                .format(selectedDate);
                            controller!.startDate = selectedDate;
                            controller!.endDateController!.clear();
                          }
                        });

                      },
                      obscureText: false,
                    ),),
                    const SizedBox(width: 5.0,),
                    Expanded(child: BikeTextField(
                      textEditingController: controller!.endDateController,
                      isMandatory: false,
                      readOnly: true,
                      showTrailingIcon: false,
                      hintText: "Choose End Date",
                      label: "End Date",
                      suffixIcon: Icon(Icons.calendar_month),
                      //validate: AppValidators.noBlankValidatior,
                      textInputType: TextInputType.name,
                      maxLines: 1,
                      showLabel: true,
                      onTap: () async {
                        if(controller!.dateStartController!.text.isNotEmpty){
                          await showDatePicker(
                              context: context,
                              initialDate: controller!.startDate!,
                              firstDate: controller!.startDate!,
                              lastDate: DateTime.now().add(Duration(days: 365)),
                              initialEntryMode:
                              DatePickerEntryMode.calendarOnly)
                              .then((selectedDate) {
                            if (selectedDate != null) {
                              controller!.endDateController!.text = AppConstant
                                  .getDateFormat
                                  .format(selectedDate);
                              controller!.isCurrentlyWorking = false;
                              // controller!.generalProfileModel!.dob = AppConstant.getDateFormat.format(selectedDate);
                            }
                          });
                        }else{
                          bakeToast("Select Start Date first",type: ToastType.warning);
                        }

                      },
                      obscureText: false,
                    ),),


                  ],
                ),
                const SizedBox(height: 10.0,),
                Row(
                  children: [
                    Obx(() => Switch(
                      // This bool value toggles the switch.
                      value: controller!.isCurrentlyWorking!,
                      activeColor: Colors.red,
                      onChanged: (bool value) {
                        controller!.isCurrentlyWorking = value;
                        if(value){
                          controller!.endDateController!.clear();
                        }
                        // This is called when the user toggles the switch.
                      },
                    )),
                    const SizedBox(width: 10.0,),
                    Text("Currently Working",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  ],
                ),

                BikeTextField(
                  textEditingController: controller!.stateController,
                  isMandatory: true,
                  readOnly: true,
                  showTrailingIcon: false,
                  hintText: "Select State",
                  label: "State",
                  isCircular: false,
                  actionIcon: Icon(FontAwesomeIcons.arrowDown),
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                  onTap: (){
                    Get.bottomSheet(FilterBottomSheet(title: "Select State",filterModel: controller!.stateModel,onClick: (FilterDatum? model){
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
                      Get.bottomSheet(FilterBottomSheet(title: "Select City",filterModel: controller!.cityModel,onClick: (FilterDatum? model){
                        controller!.cityController!.text = model!.value!;
                        controller!.selectedCity = model;
                        Get.back();
                      },),);
                    }
                  },
                ),
                const SizedBox(height: 20.0,),
                AppThemeButton(
                  onClick: (){
                    //Get.log(controller!.formData().toString());
                    if(_formKey.currentState!.validate()){
                      controller!.addExperience();
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

