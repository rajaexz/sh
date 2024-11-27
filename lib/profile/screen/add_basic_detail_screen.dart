import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/profile/controller/add_basic_detail_controller.dart';
import 'package:school_hiring/utility/app_config.dart';
import 'package:school_hiring/utility/app_constant.dart';
import 'package:school_hiring/utility/validators.dart';
import 'package:school_hiring/utility/widget_helper.dart';

import '../../models/filter_model.dart';
import '../../utility/custom_widget.dart';
import '../../utility/utility.dart';

class AddBasicDetailScreen extends GetView<AddBasicDetailController> {
  const AddBasicDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddBasicDetailController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Basic Details"),
      ),
      body: GetBuilder<AddBasicDetailController>(
        init: controller,
        builder: (controller) => Obx(() => _buildUI()),
      ),
    );
  }

  Widget _buildUI(){
    if(controller.isLoading){
      return Utility.progressIndicator();
    }else{
      return AddBasicDetailView(controller: controller,);
    }
  }
}

class AddBasicDetailView extends StatelessWidget {
  final AddBasicDetailController? controller;
  final _formKey = GlobalKey<FormState>();
  AddBasicDetailView({Key? key, this.controller}) : super(key: key);

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
                Row(
                  children: [
                    Obx(() => Switch(
                      // This bool value toggles the switch.
                      value: controller!.isImmidiateAvailable!,
                      activeColor: Colors.red,
                      onChanged: (bool value) {
                        controller!.isImmidiateAvailable = value;
                        // This is called when the user toggles the switch.
                      },
                    )),
                    const SizedBox(width: 10.0,),
                    Text("Immidiate Available",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: BikeTextField(
                      textEditingController: controller!.firstNameController,
                      isMandatory: true,
                      readOnly: false,
                      showTrailingIcon: false,
                      hintText: "Enter First Name",
                      label: "First Name",
                      isCircular: false,
                      textInputType: TextInputType.name,
                      maxLines: 1,
                      showLabel: true,
                      validate: AppValidators.noBlankValidatior,
                      obscureText: false,
                    )),
                    const SizedBox(width: 10.0,),
                    Expanded(child: BikeTextField(
                      textEditingController: controller!.middleNameController,
                      isMandatory: false,
                      readOnly: false,
                      showTrailingIcon: false,
                      hintText: "Enter Middle Name",
                      label: "Middle Name",
                      isCircular: false,
                      textInputType: TextInputType.name,
                      maxLines: 1,
                      showLabel: true,
                      obscureText: false,
                    )),
                  ],
                ),
                const SizedBox(height: 10.0,),
              
                BikeTextField(
                  textEditingController: controller!.lastNameController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Enter Last Name",
                  label: "Last Name",
                  isCircular: false,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  validate: AppValidators.noBlankValidatior,
                  obscureText: false,
                ),
                    const SizedBox(height: 10.0,),
              
                BikeTextField(
                  textEditingController: controller!.emailController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Enter  Email",
                  label: "Email ",
                  isCircular: false,
                  textInputType: TextInputType.emailAddress,
                  maxLines: 1,
                  showLabel: true,
                  validate: AppValidators.noBlankValidatior,
                  obscureText: false,
                ),
                // const SizedBox(height: 10.0,),
                // BikeTextField(
                //   textEditingController: controller!.fatherNameController,
                //   isMandatory: true,
                //   readOnly: false,
                //   showTrailingIcon: false,
                //   hintText: "Enter Father Name",
                //   label: "Father Name",
                //   isCircular: false,
                //   textInputType: TextInputType.name,
                //   maxLines: 1,
                //   showLabel: true,
                //   validate: AppValidators.noBlankValidatior,
                //   obscureText: false,
                // ),
                // const SizedBox(height: 10.0),
                Utility.fieldLabels("Gender", false),
                const SizedBox(height: 5.0),
                _showGenderField(),

                     Utility.fieldLabels("Marital Status", false),
                const SizedBox(height: 5.0),
                _showmaritalField(),
                const SizedBox(height: 5.0),
                BikeTextField(
                  textEditingController: controller!.dobController,
                  isMandatory: false,
                  readOnly: true,
                  showTrailingIcon: false,
                  hintText: "Choose DOB",
                  label: "DOB",
                  suffixIcon: Icon(Icons.calendar_month),
                  validate: AppValidators.noBlankValidatior,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  onTap: () async {
                    await showDatePicker(
                        context: context,
                        initialDate: controller!.dobDate ?? DateTime.now(),
                        firstDate: DateTime.now().subtract(Duration(days: 30000)),
                        lastDate: DateTime.now(),
                        initialEntryMode:
                        DatePickerEntryMode.calendarOnly)
                        .then((selectedDate) {
                      if (selectedDate != null) {
                        controller!.dobController!.text = AppConstant
                            .getDateFormat
                            .format(selectedDate);

                        // controller!.generalProfileModel!.dob = AppConstant.getDateFormat.format(selectedDate);
                      }
                    });
                  },
                  obscureText: false,
                ),
                // const SizedBox(height: 10.0,),
                // BikeTextField(
                //   textEditingController: controller!.phoneController,
                //   isMandatory: true,
                //   readOnly: false,
                //   showTrailingIcon: false,
                //   hintText: "Enter Mobile Number",
                //   label: "Mobile Number",
                //   isCircular: false,
                //   textInputType: TextInputType.number,
                //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                //   maxLines: 1,
                //   maxLength: 10,
                //   validate: AppValidators.noBlankValidatior,
                //   showLabel: true,
                //   obscureText: false,
                // ),
                const SizedBox(height: 10.0,),
                BikeTextField(
                  textEditingController: controller!.alternateContactController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Enter Alternate Mobile",
                  label: "Alternate Mobile Number",
                  isCircular: false,
                  textInputType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLines: 1,
                  maxLength: 10,
                  showLabel: true,
                  obscureText: false,
                ),
                const SizedBox(height: 10.0,),

                BikeTextField(
                  textEditingController: controller!.addresseController,
                  isMandatory: true,
                  readOnly: false,
                  showTrailingIcon: false,
                  hintText: "Enter Address",
                  label: "Address",
                  isCircular: false,
                  textInputType: TextInputType.name,
                  maxLines: 2,
                  showLabel: true,
                  validate: AppValidators.noBlankValidatior,
                  obscureText: false,
                ),
                const SizedBox(height: 5.0),
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
                  validate: AppValidators.noBlankValidatior,
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
                  validate: AppValidators.noBlankValidatior,
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
                Divider(),
                const SizedBox(
                  height: 20.0,
                ),
                BikeTextField(
                  textEditingController: controller!.jobExperienceController,
                  isMandatory: true,
                  readOnly: true,
                  showTrailingIcon: false,
                  hintText: "Select Experience",
                  label: "Experience",
                  validate: AppValidators.noBlankValidatior,
                  isCircular: false,

                  onChanged: (String? value){
                  },
                  actionIcon: InkWell(
                    child: Icon(FontAwesomeIcons.arrowDownLong),
                  ),
                  onTap: (){
                    Get.bottomSheet(FilterBottomSheet(title: "Select Job Experience",filterModel: controller!.experienceModel,onClick: (FilterDatum? model){
                      controller!.jobExperienceController!.text = model!.value!;
                      controller!.selectedJobExperience = model;
                      Get.back();
                    },),);
                  },
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BikeTextField(
                  textEditingController: controller!.careerLevelController,
                  isMandatory: true,
                  readOnly: true,
                  showTrailingIcon: false,
                  hintText: "Select Career",
                  label: "Career",
                  validate: AppValidators.noBlankValidatior,
                  isCircular: false,

                  onChanged: (String? value){
                  },
                  actionIcon: InkWell(
                    child: Icon(FontAwesomeIcons.arrowDownLong),
                  ),
                  onTap: (){
                    Get.bottomSheet(FilterBottomSheet(title: "Select Career",filterModel: controller!.careerFilterModel,onClick: (FilterDatum? model){
                      controller!.careerLevelController!.text = model!.value!;
                      controller!.selectedCareerLevel = model;
                      Get.back();
                    },),);
                  },
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BikeTextField(
                  textEditingController: controller!.industryController,
                  isMandatory: true,
                  readOnly: true,
                  showTrailingIcon: false,
                  hintText: "Select Industry",
                  label: "Industry",
                  validate: AppValidators.noBlankValidatior,
                  isCircular: false,

                  onChanged: (String? value){
                  },
                  actionIcon: InkWell(
                    child: Icon(FontAwesomeIcons.arrowDownLong),
                  ),
                  onTap: (){
                    Get.bottomSheet(FilterBottomSheet(title: "Select Industry",filterModel: controller!.industriesFilterModel,onClick: (FilterDatum? model){
                      controller!.industryController!.text = model!.value!;
                      controller!.selectedIndustries = model;
                      Get.back();
                    },),);
                  },
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BikeTextField(
                  textEditingController: controller!.functionalAreaController,
                  isMandatory: true,
                  readOnly: true,
                  showTrailingIcon: false,
                  hintText: "Select Functional Area",
                  label: "Functional Area",
                  validate: AppValidators.noBlankValidatior,
                  isCircular: false,

                  onChanged: (String? value){
                  },
                  actionIcon: InkWell(
                    child: Icon(FontAwesomeIcons.arrowDownLong),
                  ),
                  onTap: (){
                    Get.bottomSheet(FilterBottomSheet(title: "Select Functional Area",filterModel: controller!.functionalAreaFilterModel,onClick: (FilterDatum? model){
                      controller!.functionalAreaController!.text = model!.value!;
                      controller!.selectedFunctionalArea = model;
                      Get.back();
                    },),);
                  },
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  showLabel: true,
                  obscureText: false,
                ),
                const SizedBox(height: 20.0,),
                _showAgeRange(),
                const SizedBox(height: 20.0,),
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
  Widget _showmaritalField() => Obx(() => Container(
    decoration: BoxDecoration(
        border: Border.all(color: Get.theme.primaryColor, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(5.0))),
    height: 40,
    width: Get.width,
    child: Row(
      children: [
        Expanded(
            child: GestureDetector(
              onTap: () {
                if (controller!.selectedMarital !=
                    AppConfig.unMaritalValue) {
                  controller!.selectedMarital = AppConfig.unMaritalValue;

                }
              },
              child: Container(
                color: controller!.selectedMarital ==
                    AppConfig.unMaritalValue
                    ? Get.theme.primaryColor
                    : Colors.transparent,
                child: Center(
                  child: Text(
                    "Married",
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),
                  ),
                ),
              ),
            )),











        Container(
          height: 40,
          width: 1.0,
          color: Get.theme.primaryColor,
        ),


        Expanded(
            child: GestureDetector(
              onTap: () {
                if (controller!.selectedMarital !=
                    AppConfig.maritalValue) {
                  controller!.selectedMarital =
                      AppConfig.maritalValue;
                }
              },
              child: Container(
                color: controller!.selectedMarital ==
                    AppConfig.maritalValue
                    ? Get.theme.primaryColor
                    : Colors.transparent,
                child: Center(
                  child: Text(
                    "Single",
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),
                  ),
                ),
              ),
            )),
      ],
    ),
  ));

  Widget _showGenderField() => Obx(() => Container(
    decoration: BoxDecoration(
        border: Border.all(color: Get.theme.primaryColor, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(5.0))),
    height: 40,
    width: Get.width,
    child: Row(
      children: [
        Expanded(
            child: GestureDetector(
              onTap: () {
                if (controller!.selectedGender !=
                    AppConfig.genderMaleValue) {
                  controller!.selectedGender = AppConfig.genderMaleValue;

                }
              },
              child: Container(
                color: controller!.selectedGender ==
                    AppConfig.genderMaleValue
                    ? Get.theme.primaryColor
                    : Colors.transparent,
                child: Center(
                  child: Text(
                    "Male",
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),
                  ),
                ),
              ),
            )),
        Container(
          height: 40,
          width: 1.0,
          color: Get.theme.primaryColor,
        ),
        Expanded(
            child: GestureDetector(
              onTap: () {
                if (controller!.selectedGender !=
                    AppConfig.genderFeMaleValue) {
                  controller!.selectedGender =
                      AppConfig.genderFeMaleValue;
                }
              },
              child: Container(
                color: controller!.selectedGender ==
                    AppConfig.genderFeMaleValue
                    ? Get.theme.primaryColor
                    : Colors.transparent,
                child: Center(
                  child: Text(
                    "Female",
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),
                  ),
                ),
              ),
            )),
      ],
    ),
  ));

  Widget _showAgeRange() => Obx(() => Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Get.theme.colorScheme!.secondary.withOpacity(0.2)),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Salary Range",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
            ),
            Row(
              children: [
                AnimatedFlipCounter(
                  value: controller!.currentSalary!,
                  fractionDigits: 0, // decimal precision
                  prefix: "${AppConstant.currencyUnicode}",
                  suffix: "-",
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
                AnimatedFlipCounter(
                  value: controller!.expectedSalary!,
                  fractionDigits: 0, // decimal precision

                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
RangeSlider(
  values: RangeValues(
    controller!.currentSalary!.clamp(AppConfig.minSalaryValue, AppConfig.maxSalaryValue),
    controller!.expectedSalary!.clamp(AppConfig.minSalaryValue, AppConfig.maxSalaryValue),
  ),
  min: AppConfig.minSalaryValue,
  max: AppConfig.maxSalaryValue,
  activeColor: const Color(0xff331A01),
  inactiveColor: const Color(0xff331A01),
  onChanged: (value) {
    controller!.currentSalary = value.start;
    controller!.expectedSalary = value.end;
    // You might want to call update() if using GetX
    // controller!.update();
  },
)

      ],
    ),
  ));
}
