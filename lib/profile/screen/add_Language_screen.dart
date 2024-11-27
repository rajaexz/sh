import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_hiring/profile/controller/add_Language_controller.dart';
import 'package:school_hiring/utility/validators.dart';
import 'package:school_hiring/utility/widget_helper.dart';

import '../../models/filter_model.dart';
import '../../utility/custom_widget.dart';
import '../../utility/utility.dart';

class AddLanguageScreen extends GetView<AddLanguageController> {
  const AddLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddLanguageController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Language"),
      ),
      body: GetBuilder<AddLanguageController>(
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
  final AddLanguageController? controller;
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
                                     validate: AppValidators.noBlankValidatior,
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
                        controller!.levellanController!.clear();
                        // controller!.selectedExpModel = null;
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
              BikeTextField(
                                     validate: AppValidators.noBlankValidatior,
                textEditingController: controller!.levellanController,
                isMandatory: true,
                readOnly: true,
                showTrailingIcon: false,
                hintText: "Select Language Level",
                label: "Language Level",
                isCircular: false,
                onChanged: (String? value) {},
                actionIcon: InkWell(
                  child: Icon(FontAwesomeIcons.arrowDownLong),
                ),
                onTap: () {
                  Get.bottomSheet(
                    FilterBottomSheet(
                      title: "Select Experience",
                      filterModel: controller!.levelLanguageFilterModel,
                      onClick: (FilterDatum? model) {
                        controller!.levellanController!.text = model!.value!;
                        controller!.selectedlavelLanguage = model;
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
                height: 20.0,
              ),
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
