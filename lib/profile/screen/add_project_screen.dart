import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/profile/controller/add_education_controller.dart';
import 'package:school_hiring/profile/controller/add_project_controller.dart';
import 'package:school_hiring/utility/utility.dart';
import 'package:school_hiring/utility/validators.dart';
import 'package:school_hiring/utility/widget_helper.dart';

import '../../models/filter_model.dart';
import '../../utility/custom_widget.dart';

class AddProjcetScreen extends GetView<AddProjcetController> {
  const AddProjcetScreen({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    Get.put(AddProjcetController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Project"),
      ),
      body: GetBuilder<AddProjcetController>(
        init: controller,
        builder: (controller) => Obx(() => _buildUI()),
      ),
    );
  }

  Widget _buildUI() {
    if (controller.isLoading) {
      return Utility.progressIndicator();
    } else {
      return AddProjcetView(
        controller: controller,
      );
    }
  }
}

class AddProjcetView extends StatelessWidget {
  final AddProjcetController? controller;
  final _formKey = GlobalKey<FormState>();
  AddProjcetView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                BikeTextField(
                                    validate: AppValidators.noBlankValidatior,
                  textEditingController: controller!.titleController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Enter Name ",
                  label: "Name Title",
                  isCircular: false,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                ),
               
     
                BikeTextField(
                  textEditingController: controller!.descriptionController,
                  isMandatory: true,
                                    validate: AppValidators.noBlankValidatior,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Enter Projcet Description",
                  label: "Projcet Description Title",
                  isCircular: false,
                  textInputType: TextInputType.name,
                  maxLines: 4,
                  showLabel: true,
                  obscureText: false,
                ),
               
                            BikeTextField(
                                                validate: AppValidators.noBlankValidatior,
                  textEditingController: controller!.urlController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Enter Projcet Url ",
                  label: "Projcet Url",
                  isCircular: false,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                ),
             
                const SizedBox(
                  height: 20,
                ),
                Obx(() => TextFormField(
                  validator:                AppValidators.noBlankValidatior,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Start Date',
                        hintText: 'Select Start Date',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      controller: TextEditingController(
                        text: controller!.formattedStartDate,
                      ),
                      onTap: () async {
                        DateTime? selectedDate = await _selectDate(
                            context, controller!.startDate.value);
                        if (selectedDate != null) {
                          controller!.startDate.value = selectedDate;
                        }
                      },
                    )),
                const SizedBox(height: 16),
                Obx(() => TextFormField(
                  validator:                   AppValidators.noBlankValidatior,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'End Date',
                        hintText: 'Select End Date',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      controller: TextEditingController(
                        text: controller!.formattedEndDate,
                      ),
                      onTap: () async {
                        DateTime? selectedDate = await _selectDate(
                            context, controller!.endDate.value);
                        if (selectedDate != null) {
                          controller?.endDate.value = selectedDate;
                        }
                      },
                    )),
                const SizedBox(height: 16),
                AppThemeButton(
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      controller!.addProjcet();
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

  Future<DateTime?> _selectDate(
      BuildContext context, DateTime? currentDate) async {
    DateTime initialDate = currentDate ?? DateTime.now();
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    return newDate;
  }
}
