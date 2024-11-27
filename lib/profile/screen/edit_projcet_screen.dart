import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/profile/controller/edit_project_controller.dart';
import 'package:school_hiring/utility/validators.dart';
import 'package:school_hiring/utility/widget_helper.dart';

import '../../models/filter_model.dart';
import '../../utility/app_constant.dart';
import '../../utility/custom_widget.dart';
import '../../utility/utility.dart';

class EditProjectScreen extends GetView<EditProjectController> {
  const EditProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditProjectController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Project"),
      ),
      body: GetBuilder<EditProjectController>(
        init: controller,
        builder: (controller) => Obx(() => _buildUI()),
      ),
    );
  }

  Widget _buildUI() {
    if (controller.isLoading_) {
      return Utility.progressIndicator();
    } else {
      return EditProjectView(controller: controller);
    }
  }
}

class EditProjectView extends StatelessWidget {
  final EditProjectController? controller;
  final _formKey = GlobalKey<FormState>();

  EditProjectView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                textEditingController: controller!.nameController,
                isMandatory: true,
                readOnly: false,
                showTrailingIcon: false,
                hintText: "Enter Project Name",
                label: "Name",
                maxLines: 1,
                isCircular: false,
                onChanged: (String? value) {},
                onTap: () {},
                textInputType: TextInputType.name,
                showLabel: true,
                obscureText: false,
              ),
              BikeTextField(
                textEditingController: controller!.descriptionController,
                isMandatory: true,
                readOnly: false,
                showTrailingIcon: false,
                hintText: "Enter Description",
                label: "Description",
                maxLines: 10,
                isCircular: false,
                onChanged: (String? value) {},
                onTap: () {},
                textInputType: TextInputType.name,
                showLabel: true,
                obscureText: false,
              ),
              BikeTextField(
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
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: BikeTextField(
                      textEditingController: controller!.dateStartController,
                      isMandatory: true,
                      readOnly: true,
                      showTrailingIcon: false,
                      hintText: "Choose Start Date",
                      label: "Start Date",
                      suffixIcon: const Icon(Icons.calendar_month),
                      validate: AppValidators.noBlankValidatior,
                      textInputType: TextInputType.name,
                      maxLines: 1,
                      showLabel: true,
                      onTap: () async {
                        await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1955),
                          lastDate: DateTime.now(),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            controller!.dateStartController!.text =
                                AppConstant.getDateFormat.format(selectedDate);
                            controller!.startDate.value = selectedDate;
                            controller!.endDateController!.clear();
                          }
                        });
                      },
                      obscureText: false,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: BikeTextField(
                      textEditingController: controller!.endDateController,
                      isMandatory: false,
                      readOnly: true,
                      showTrailingIcon: false,
                      hintText: "Choose End Date",
                      label: "End Date",
                      suffixIcon: const Icon(Icons.calendar_month),
                      textInputType: TextInputType.name,
                      maxLines: 1,
                      showLabel: true,
                      onTap: () async {
                        if (controller!.startDate.value != null) {
                          await showDatePicker(
                            context: context,
                            initialDate: controller!.startDate.value!,
                            firstDate: controller!.startDate.value!,
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)),
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              controller!.endDateController!.text = AppConstant
                                  .getDateFormat
                                  .format(selectedDate);
                              controller!.endDate.value = selectedDate;
                            }
                          });
                        } else {
                          bakeToast("Select Start Date first",
                              type: ToastType.warning);
                        }
                      },
                      obscureText: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              AppThemeButton(
                onClick: () {
                  if (_formKey.currentState!.validate()) {
                    controller!.addProject();
                  }
                },
                label: "Save",
                textColor: Colors.white,
                color: Get.theme.colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
