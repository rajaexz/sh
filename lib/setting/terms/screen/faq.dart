import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_hiring/setting/faq/controller/Faq_controller.dart';
import 'package:school_hiring/setting/faq/screen/faqItem.dart';

import 'package:school_hiring/utility/utility.dart';


class FaqListScreen extends GetView<FaqController> {
  const FaqListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FaqController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQ "),
      ),
      body: GetBuilder<FaqController>(
        init: controller,
        builder: (controller) =>  Obx(()=>_buildUI()),
      ),
    );
  }

  
  Widget _buildUI(){
    if(controller.  isLoading){
      return Utility.progressIndicator();
    }else{
      return FaqScreen(controller: controller,);
    }
  }

}



class FaqScreen extends StatelessWidget {

FaqController ? controller;

FaqScreen({this.controller});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<FaqController>(
  init: FaqController(),
  builder: (controller) => controller.isLoading
      ? Utility.progressIndicator()
      : SingleChildScrollView(
          padding: EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.faqList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
             return  FaqListItem(
                answer: controller.faqList[index].answer,
                question: controller.faqList[index].question,
                index: index,
                press: () {
                  controller.changeSelectedIndex(index);
                },
                selectedIndex: controller.selectedIndex,
              );
       
            },
          ),
        ),
),
   
    );
  }
}
