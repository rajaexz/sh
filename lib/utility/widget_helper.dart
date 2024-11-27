
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:school_hiring/utility/utility.dart';

import '../models/common_model.dart';
import 'app_constant.dart';

class SocialLoginButton extends StatelessWidget {
  Color? color;
  String? title;
  String? imagePath;
  Color? textColor;
  void Function()? onClick;

  SocialLoginButton(
      {Key? key,
      this.color,
      this.title,
      this.imagePath,
      this.onClick,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        height: 44,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath!, height: 25, width: 25),
            Expanded(
                child: Container(
              child: Center(
                child: Text(
                  title!,
                  textAlign: TextAlign.start,
                  style: Get.theme.textTheme.titleSmall!
                      .copyWith(color: textColor!),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class TechMixinTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? textEditingController;
  final String? hintText;
  final TextInputType? textInputType;
  final String? Function(String?)? validate;
  final void Function()? onTap;
  final void Function(String? value)? onSave;
  final bool? readOnly;
  final dynamic maxLines;
  final bool? showTrailingIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? showLabel;
  final bool? isMandatory;
  final List<TextInputFormatter>? inputFormatters;

  const TechMixinTextField(
      {Key? key,
      this.label,
      this.textEditingController,
      this.hintText,
      this.textInputType,
      this.validate,
      this.onTap,
      this.inputFormatters,
      this.readOnly,
      this.maxLines,
      this.suffixIcon,
      this.showLabel,
      this.obscureText,
      this.isMandatory,
      this.onSave,
      this.showTrailingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            child: Utility.fieldLabels(label, isMandatory ?? false),
            visible: showLabel!,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Card(
            elevation: 0.0,
            color: Colors.transparent,
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(
            //         AppConstant.borderRadius)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //     color: Get.theme.primaryColor.withOpacity(0.10),
                //     spreadRadius: 5,
                //     blurRadius: 7,
                //     offset: const Offset(0, 3), // changes position of shadow
                //   ),
                //],
              ),
              child: TextFormField(
                obscureText: obscureText!,
                style: Get.theme.textTheme.headlineSmall,
                decoration: showTrailingIcon!
                    ? Utility.vNetInputDecoration(hintText, null, false)
                        .copyWith(suffixIcon: suffixIcon)
                    : Utility.vNetInputDecoration(hintText, null, false),
                readOnly: readOnly!,
                onTap: onTap,
                controller: textEditingController,
                validator: validate,
                keyboardType: textInputType,
                maxLines: maxLines,
                onSaved: onSave,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppThemeButton extends StatelessWidget {
  final void Function()? onClick;
  final String? label;
  final Color? color;
  final Color? textColor;
  const AppThemeButton({Key? key, this.onClick, this.label,this.color,this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetPlatform.isAndroid ? _androidButton() : _androidButton();
  }

  Widget _androidButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          minimumSize: const Size.fromHeight(50), // NEW
        ),
        onPressed: onClick,
        child: Text(
          label!,
          textScaler: TextScaler.linear(Get.textScaleFactor),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor,fontWeight: FontWeight.w600,letterSpacing: 1.5,fontSize: 16,),
        ),
      );

  Widget _iosButton() => CupertinoButton(
      color: color,
      child: Text(
        label!,
        style:
            Get.theme.textTheme.titleMedium!.copyWith(color: textColor),
      ),
      onPressed: onClick);
}

class AppThemeTextButton extends StatelessWidget {
  final void Function()? onClick;
  final String? label;
  const AppThemeTextButton({Key? key, this.onClick, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetPlatform.isAndroid ? _androidButton() : _iosButton();
  }

  Widget _androidButton() => ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      minimumSize: const Size.fromHeight(50), // NEW
    ),
    onPressed: onClick,
    child: Text(
      label!,
      style: Get.theme.textTheme.titleLarge!,
    ),
  );

  Widget _iosButton() => CupertinoButton(
      color: Colors.white,
      child: Text(
        label!,
        style:
        Get.theme.textTheme.titleLarge!.copyWith(color: Colors.black),
      ),
      onPressed: onClick);
}

class TechmixinMultiSelectField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final void Function()? onTap;
  final bool? showTrailingIcon;
  final bool? isMandatory;
  final List<CommonModel>? dataList;
  final void Function(int index)? onDelete;
  final List<FilteringTextInputFormatter>? inputFormatters;

  const TechmixinMultiSelectField(
      {Key? key,
      this.label,
      this.hintText,
      this.onTap,
      this.inputFormatters,
      this.showTrailingIcon,
      this.isMandatory,
      this.dataList,
      this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utility.fieldLabels(label, isMandatory!),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              height: 50,
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppConstant.borderRadius)),
                  color: Colors.grey.withOpacity(0.15)),
              child: dataList!.isNotEmpty ? _showListView() : _showRawText(),
            )
          ],
        ),
      ),
    );
  }

  Widget _showRawText() => Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              hintText!,
              textScaleFactor: Get.textScaleFactor,
              style: Get.theme.textTheme.displaySmall,
            ),
            const Icon(
              Icons.arrow_drop_down_circle_outlined,
              size: 20,
            )
          ],
        ),
      );

  Widget _showListView() => Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dataList!.length,
            itemBuilder: (context, index) =>
                _showDataWidget(dataList!.elementAt(index), index)),
      );

  Widget _showDataWidget(CommonModel model, int index) => Container(
        height: 30,
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(
              5.0,
            )),
            color: Get.theme.primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              model.title!,
              textScaleFactor: 1.0,
              style: Get.theme.textTheme.displaySmall!
                  .copyWith(color: Colors.white),
            ),
            InkWell(
              onTap: () => onDelete!(index),
              child: Icon(
                Icons.close,
                size: 18,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
}

class CommonModelMultiChoiceWidgetBottom extends StatelessWidget {
  final List<CommonModel>? commonModelList;
  final void Function(CommonModel model)? onClick;
  final String? label;
  final void Function()? onDonePress;
  final void Function(int index)? onPressSelect;
  final GetxController? controller;
  const CommonModelMultiChoiceWidgetBottom(
      {Key? key,
      this.commonModelList,
      this.onClick,
      this.label,
      this.onDonePress,
      this.onPressSelect,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GetBuilder<GetxController>(
        init: controller,
        builder: (controller) => Column(
          children: [
            AppBar(
              elevation: 0.0,
              title: Text(
                label!,
                textScaleFactor: Get.textScaleFactor,
              ),
              actions: [
                TextButton(
                    onPressed: onDonePress,
                    child: Text(
                      "Done",
                      textScaleFactor: Get.textScaleFactor,
                      style: Get.theme.textTheme.headlineMedium!
                          .copyWith(color: Colors.white),
                    ))
              ],
            ),
            Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: commonModelList!.length,
                    itemBuilder: (context, index) => ListTile(
                          onTap: () =>
                              onClick!(commonModelList!.elementAt(index)),
                          //onTap: (){},
                          dense: true,
                          title: Text(
                            commonModelList!.elementAt(index).title!,
                            textScaleFactor: Get.textScaleFactor,
                            style: Get.theme.textTheme.headlineMedium,
                          ),
                          trailing: InkWell(
                            onTap: () => onPressSelect!(index),
                            child: Icon(
                                commonModelList!.elementAt(index).isChecked!
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank),
                          ),
                        )))
          ],
        ),
      ),
    );
  }


  Widget _showDataFlow(CommonModel model,int index) => GestureDetector(
    onTap: (){},
    child: Container(
      child: Column(
        children: [
          Text(
            model.title!,
            textScaleFactor: Get.textScaleFactor,
            style: Get.theme.textTheme.headlineMedium,
          )
        ],
      ),
    ),
  );

}
