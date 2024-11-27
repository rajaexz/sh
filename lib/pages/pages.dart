




import 'package:get/get.dart';
import 'package:school_hiring/authentication/screen/authentication_screen.dart';
import 'package:school_hiring/authentication/screen/authentication_signup_screen.dart';
import 'package:school_hiring/authentication/screen/verify_otp_screen.dart';
import 'package:school_hiring/authentication/screen/verify_otp_signup.dart';
import 'package:school_hiring/daashboard/screen/dashboard_screen.dart';
import 'package:school_hiring/daashboard/screen/school_detail_screen.dart';
import 'package:school_hiring/daashboard/screen/school_list_screen.dart';
import 'package:school_hiring/jobs/screen/filter_list_screen.dart';
import 'package:school_hiring/jobs/screen/job_detail_screen.dart';
import 'package:school_hiring/jobs/screen/job_list_screen.dart';
import 'package:school_hiring/middleware/auth_middleware.dart';
import 'package:school_hiring/profile/screen/add_basic_detail_screen.dart';
import 'package:school_hiring/profile/screen/add_education_screen.dart';
import 'package:school_hiring/profile/screen/add_experience_screen.dart';
import 'package:school_hiring/profile/screen/add_project_screen.dart';
import 'package:school_hiring/profile/screen/add_resume_screen.dart';
import 'package:school_hiring/profile/screen/add_skill_screen.dart';
import 'package:school_hiring/profile/screen/add_summary.dart';
import 'package:school_hiring/profile/screen/edit_education_screen.dart';
import 'package:school_hiring/profile/screen/edit_experience_screen.dart';
import 'package:school_hiring/profile/screen/edit_language_screen.dart';
import 'package:school_hiring/profile/screen/edit_projcet_screen.dart';
import 'package:school_hiring/profile/screen/edit_skill_screen.dart';
import 'package:school_hiring/setting/faq/screen/faq.dart';
import 'package:school_hiring/splash/screen/welcome.dart';
import 'package:school_hiring/utility/bike_web.dart';

import '../profile/screen/add_Language_screen.dart';
import '../setting/screen/setting_screen.dart';
import '../splash/screen/splash_screen.dart';



part './routes.dart';


abstract class AppPages {

  static final pages = [

    GetPage(name: Routes.introScreen, page:() => OnboardingScreen(),),
    GetPage(name: Routes.splashUrl, page:() => SplashScreen()),
    
    
        GetPage(name: Routes.setting, page:() => CustomNavigationDrawerScreen(),middlewares: [AuthMiddleware()]), 
    GetPage(name: Routes.dashboardScreen, page:() => DashboardScreen()),
        GetPage(name: Routes.faqList, page:() => const FaqListScreen()),
       GetPage(name: Routes.editSummary, page:() => const AddSummaryScreen()),
    
    GetPage(name: Routes.authScreen, page:() => AuthenticationScreen()),
    GetPage(name: Routes.verifyOtpScreen, page:() => VerifyOtpScreen()),
        GetPage(name: Routes.verifyOtpSignup, page:() => VerifyOtpSignupScreen()),
    GetPage(name: Routes.jobListScreen, page:() => JobListScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.jobDetailScreen, page:() => JobDetailScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.addResumeScreen, page:() => AddResumeScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.addEducationScreen, page:() => AddEducationScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.addProjectScreen, page:() => const AddProjcetScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.editProView, page:() => const EditProjectScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.editLanguageView, page:() => const EditLanguageScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.addSkillScreen, page:() => AddSkillScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.addExpenseScreen, page:() => AddExperienceScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.editBasicDetailScreen, page:() => AddBasicDetailScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.jobFilterScreen, page:() => FilterListScreen(),middlewares: [AuthMiddleware()]), 
    GetPage(name: Routes.schoolDetailScreen, page:() => SchoolDetailScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.schoolWebView, page:() => SchoolWeb(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.editSkillView, page:() => EditSkillScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.editExpView, page:() => EditExperienceScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.editEduView, page:() => EditEducationScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.addLauguege, page:() => AddLanguageScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.registerScreen, page:() => AuthenticationSignupScreen()),

  ];

}

