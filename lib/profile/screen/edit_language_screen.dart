import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_hiring/profile/controller/edit_Language_controller.dart';
import 'package:school_hiring/utility/widget_helper.dart';

import '../../models/filter_model.dart';
import '../../utility/custom_widget.dart';
import '../../utility/utility.dart';

class EditLanguageScreen extends GetView<EditLanguageController> {
  const EditLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditLanguageController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Language"),
      ),
      body: GetBuilder<EditLanguageController>(
        init: controller,
        builder: (controller) => Obx(() => _buildUI()),
      ),
    );
  }

  Widget _buildUI() {
    if (controller.isLoading) {
      return Utility.progressIndicator();
    } else {
      return AddLanguageJobView(
        controller: controller,
      );
    }
  }
}

class AddLanguageJobView extends StatelessWidget {
  final EditLanguageController? controller;
  final _formKey = GlobalKey<FormState>();
  AddLanguageJobView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              BikeTextField(
                textEditingController: controller!.LanguageController,
                isMandatory: true,
                readOnly: true,
                showTrailingIcon: false,
                hintText: "Select Language",
                label: "Language",
                isCircular: false,
                onChanged: (String? value) {},
                actionIcon: InkWell(
                  child: Icon(FontAwesomeIcons.arrowDownLong),
                ),
                onTap: () {
                  Get.bottomSheet(
                    FilterBottomSheet(
                      title: "Select Language",
                      filterModel: controller!.LanguageFilterModel,
                      onClick: (FilterDatum? model) {
                        controller!.LanguageController!.text = model!.value!;
                        controller!.selectedLanguage = model;
                        // controller!.expController!.clear();
                       
                        Get.back();
                      },
                    ),
                  );
                },
                textInputType: TextInputType.name,
                maxLines: 1,
                showLabel: true,
                obscureText: false,
              ),
              const SizedBox(
                height: 10.0,
              ),
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
              //       controller!.selectedExpModel = model;
              //       Get.back();
              //     },),);
              //   },
              //   textInputType: TextInputType.name,
              //   maxLines: 1,
              //   showLabel: true,
              //   obscureText: false,
              // ),
              // const SizedBox(height: 20.0,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Expanded(child: AppThemeButton(
              //       onClick: (){
              //         if(_formKey.currentState!.validate()){
              //           controller!.addLanguage(false);
              //         }
              //       },
              //       label: "Save",
              //       textColor: Colors.white,
              //       color: Get.theme.colorScheme.secondary,
              //     )),
              //     const SizedBox(width: 10.0,),
              //     // Expanded(child: AppThemeButton(
              //     //   onClick: (){
              //     //     controller!.addLanguage(true);
              //     //   },
              //     //   label: "Save & Add Another",
              //     // ))
              //   ],
              // )
              AppThemeButton(
                onClick: () {
                  if (_formKey.currentState!.validate()) {
                    controller!.addLanguage(false);
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
