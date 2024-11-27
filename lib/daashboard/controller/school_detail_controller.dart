



import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:school_hiring/models/school_detail_model.dart';


import '../../network/api_path.dart';
import '../../services/startup_service.dart';
import '../../utility/app_constant.dart';

class SchoolDetailController extends GetxController {

  RxBool _isLoading = false.obs;

  get isLoading => _isLoading.value;
  set isLoading(index) => _isLoading.value = index;

  RxDouble? _currentSalary = 10000.00.obs;
  RxDouble? _expectedSalary = 30000.00.obs;
  RxInt? _selectedCV = 100.obs;

  set currentSalary(value) => _currentSalary!.value =  value;
  get currentSalary => _currentSalary!.value;

  set expectedSalary(value) => _expectedSalary!.value =  value;
  get expectedSalary => _expectedSalary!.value;

  set selectedCV(value) => _selectedCV!.value =  value;
  get selectedCV => _selectedCV!.value;


  SchoolDetailModel? schoolDetailModel;




  int? jobId;


  @override
  void onInit() {
    // TODO: implement onInit
    jobId = Get.arguments[0];
    getData();
    super.onInit();
  }

   getData(){

    try{
 
    isLoading = true;
    StartUpService.networkProvider!.getCallQuery(ApiPath.schoolDetailUrl,{"id":jobId.toString()}).then((value){
      schoolDetailModel = SchoolDetailModel.fromJson(value.body);
      isLoading = false;
    }).catchError((error){
      isLoading = false;
      throw error;
    });

 }catch(e){
print(e);
}


    }

  




    void favouriteCompany( {schoolId}){

            update();

    StartUpService.networkProvider!.getCommonCall(ApiPath.addmyFavouriteCompany,{"company_id": schoolId}).then((value){
      if(value.body["status"] == 1){

        print("---------------${value.body}");
        schoolDetailModel!.data!.isFeatured =  schoolDetailModel!.data!.isFeatured == 0 ? 1 : 0;
        update();
        bakeToast(value.body["message"],type: ToastType.success);
      }else{
        bakeToast(value.body["message"],type: ToastType.error);
      }
    }).catchError((error){

    });

  }


  

}
