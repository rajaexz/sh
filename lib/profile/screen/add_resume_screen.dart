import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_hiring/profile/controller/add_resume_controller.dart';
import 'package:school_hiring/utility/widget_helper.dart';

import '../../utility/custom_widget.dart';


class AddResumeScreen extends GetView<AddResumeController> {
  const AddResumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddResumeController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Resume"),
      ),
      body: GetBuilder<AddResumeController>(
        init: controller,
        builder: (controller) => AddResumeView(controller: controller,),
      ),
    );
  }
}


class AddResumeView extends StatelessWidget {
  final AddResumeController? controller;
  final _formKey = GlobalKey<FormState>();
  AddResumeView({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: Get.height,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0,),
              BikeTextField(
                textEditingController: controller!.resumeTitle,
                isMandatory: true,
                readOnly: false,
                showTrailingIcon: false,
                hintText: "Add Title",
                label: "Resume Title",
                isCircular: false,
                onChanged: (String? value){

                },

                textInputType: TextInputType.name,
                maxLines: 1,
                showLabel: true,
                obscureText: false,
              ),
              Obx(() => controller!.selectedResume.path.toString().length > 0 ? _showImagePreview() : _showNoEduList()),
              Row(
                children: [
                  Obx(() => Switch(
                    // This bool value toggles the switch.
                    value: controller!.isDefault!,
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      controller!.isDefault = value;
                      // This is called when the user toggles the switch.
                    },
                  )),
                  const SizedBox(width: 10.0,),
                  Text("Make Default",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  

                ],
              ),
              const SizedBox(height: 10.0,),
              AppThemeButton(
                onClick: (){
                  Get.log("aa ${controller!.selectedResume.path}");
                  if(_formKey.currentState!.validate()){
                    controller!.addResume();
                  }
                },
                label: "Save",
                color: Get.theme.colorScheme.secondary,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _showNoEduList() => GestureDetector(
    onTap: (){
      controller!.pickFile();
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: Get.width,
      child: Card(
        elevation: 1.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.plus),
              const SizedBox(height: 10.0,),
              Text("Add Resume",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
            ],
          ),
        ),
      ),
    ),
  );


  Widget _showImagePreview() => Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: Colors.black)),
    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(child: Container(
          height: 100,width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              image: DecorationImage(image: AssetImage("assets/images/pdf.png"))
          ),
        )),
        Flexible(child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                controller!.selectedResume = File("");
                controller!.update();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Remove",style: Get.theme.textTheme.titleMedium!.copyWith(color: Colors.white),),
            ),
            ElevatedButton(

              onPressed: (){
                controller!.pickFile();
              },
              child: Text("Replace",style: Get.theme.textTheme.titleMedium!,),
            )
          ],
        ))
      ],
    ),
  );

}
