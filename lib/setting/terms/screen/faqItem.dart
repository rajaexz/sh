import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_hiring/setting/Expend.dart';

class FaqListItem extends StatelessWidget {

  final String question;
  final String answer;
  final int index;
  final int selectedIndex;
  final VoidCallback press;

  const FaqListItem({super.key,
    required this.answer,
    required this.question,
    required this.index,
    required this.press,
    required this.selectedIndex
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal:15, vertical: 15),
        decoration: BoxDecoration(
         
          borderRadius: BorderRadius.circular(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    question.tr,
           ),
                ),
                SizedBox(
                    height: 30, width: 30,
                    child: Icon( index == selectedIndex ? Icons.keyboard_arrow_up: Icons.keyboard_arrow_down,
                   
                        size: 20)
                )
              ],
            ),

           ExpandedSection(
              expand:index==selectedIndex,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(answer.tr
                 ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
