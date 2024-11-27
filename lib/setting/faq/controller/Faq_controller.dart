import 'package:get/get.dart';
import 'package:school_hiring/network/api_path.dart';

import '../../../services/startup_service.dart';

class FaqController extends GetxController {
  RxBool _isLoading = true.obs; // Keep this as an RxBool
  var faqList = <FaqModel>[].obs;
  var selectedIndex = -1.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value; // Correct setter

  @override
  void onInit() {
    loadFaqData();
        loadData();
    getData();
    super.onInit();
  }

  void getData() {
    isLoading = true; // Correct usage
    StartUpService.networkProvider!.getCall(ApiPath.faqScreen).then((value) {
      return StartUpService.networkProvider!.getCall(ApiPath.jobListUrl);
    }).then((value) {
      isLoading = false; // Correct usage
    }).catchError((error) {
      isLoading = false; // Correct usage
    });
  }

  void loadData() async {
    try {
      isLoading = true;
      update();

      // Fetch your data
      
      
    } finally {
      isLoading = false;
      update();
    }
  }

  void changeSelectedIndex(int index) {
    if (selectedIndex == index) {
      selectedIndex = -1; // Deselect if it's the same index
    } else {
      selectedIndex = index ;
    }
    update(); // Notify listeners
  }

  void loadFaqData() {
    isLoading = true; // Correct usage

    // Simulate a network request or database fetch with mock data
    faqList.value = [
      FaqModel(question: "What is Flutter?", answer: "Flutter is an open-source UI toolkit."),
      FaqModel(question: "How to use GetX?", answer: "GetX is a lightweight state management solution."),
      FaqModel(question: "What is Dart?", answer: "Dart is a programming language optimized for building mobile, desktop, server, and web applications."),
      FaqModel(question: "How to create a widget in Flutter?", answer: "A widget in Flutter can be created by extending the StatelessWidget or StatefulWidget class."),
    ];

    isLoading = false; // Correct usage
  }

  
}

class FaqModel {
  final String question;
  final String answer;

  FaqModel({required this.question, required this.answer});
}
