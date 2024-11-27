


class ApiPath{

  static const String baseUrl = "http://api.srssoftwares.in/ihd/api/v1/";


  static const String loginUrl = "http://api.srssoftwares.in/ihd/api/v1/login";


    static const String signupUrl = "register";
  static const String resendOtp = "forget";
  static const String verifyOtp = "verify";

  static const String tripCategoryList = "category/get";
  static const String createTrip = "trips/create";
  static const String createUserTrip = "trips/create_user_trip";
  static const String myTripList = "trips/usertrip/";
  static const String tripDetails = "trips/usertripdetails/";
  static const String nearbyUser = "dashboard/getnearestrip";
  static const String getProfile = "users/getProfile";
  static const String updateProfile = "users/updateProfile";
  static const String updateProfilePicture = "users/updateProfilePicture";
  static const String uploadImage = "gallery/uploadGallery";
  static const String userGalleryList = "gallery/getGallery";
  static const String groupDetailView = "group/details/";
  static const String getProjcetView = "user/get-project"; 
  static const String getLanguageView = "user/get-profile_languages"; 
  static const String addLanguage = "user/add-profile_languages";  
  static const String editLanguage = "user/add-profile_languages";  
  static const String getExpenseAPI = "expenses/lists/";
  static const String getSummarySplitAPI = "user/get-summary";
  static const String addExpenseAPI = "expenses/addExpense";

  static const String chatRoomListUrl  = "getrooms";
  static const String chatRoomHistoryUrl = "getConversationByRoom/";
  static String chatSendUrl(String value) =>  "room/${value}/doMessage/";

  static const String updateTripId = "trips/updateTrip";
  static const String updateUserTripId = "trips/update_user_trip";

  static const String viewUserDetailAPI = "users/user-detail/";

  static const String followersListModel = "followers/get_followers";
  static const String followingListModel = "followers/get_followings";


  static const String addressList  = "address/list";
  static const String addressAdd  = "address/create";
  static const String addressEdit  = "address/update/";
  static const String addressDefault  = "address/change_mark_as_default";
  static const String addressDelete  = "address/delete/";

  static const String tripJoinRequestRemove = "trips/joinTrip/";
  static const String tripJoinedMember = "trips/getTripJoinedMenber/";
  static const String tripApproveMember = "trips/approveMember";


  static const String groupPostAdd = "group/posts/";
  static const String groupPostList = "group/posts/";

  static const String likeUnlikeAPI = "comment/doLike";
  static const String commentAddAPI = "comment/doComment/";
  static const String commentListAPI  = "comment/getComment/";
  static const String approveTripMember = "trips/approveMember";


    static const String filterCareedLevels = "companies";
    static const String faqScreen = "filer-career_levels";
  static const String jobListUrl = "job/get-list";
  static const String schoolListUrl = "school/get-list";
  static const String jobDetailUrl = "job/detail";


  static const String getProfileUrl = "user/get-info";
  static const String updateProfileUrl = "user/update-info";
  static const String getCVUrl  = "user/get-cvs";
  static const String getJobSkill  = "user/get-job_skills";
  static const String getJobExperience  = "user/get-experience";
  static const String getMyEducation  = "user/get-education";
  
  static const String addResume  = "user/update-cvs";
  static const String addEducation  = "user/add-education";
   static const String addProjcet  = "user/add-project";
      static const String editProjcet  = "user/edit-project";

  static const String addJobSkill  = "user/add-job_skills";
  static const String addExperience  = "user/add-experience";
  static const String updateInfo  = "user/update-info";
  static const String updateSummary  = "user/update-summary"; 

  static const String filterDegreeLevelUrl = "filer-degree_level";
  static const String filterDegreeLevelType = "filer-degree_types";
  static const String filterState = "filer-state";
  static const String filterCity = "filer-city";
  static const String filterMajorSubject = "filer-major_subjects";
  static const String filterResultTYpe = "filer-result_type";
  static const String filterJobSkill = "filer-job_skill";
  static const String filterExperience = "filer-experience";
  static const String filterIndustries = "filer-industries";
  static const String filterCareerLevel = "filer-career_levels";
  static const String filterFunctionalArea = "filer-functional_areas";
  static const String filterLanguage = "filer-languages";
  static const String filterLanguagelevel = "filer-language_level";


  static const String bookMark = "user/add-my-favourite-jobs";
  static const String applyJobs = "user/apply-job";
  static const String applyJobsList = "user/my-job-applications";
    static const String favoriteJobList = "user/my-favourite-jobs";
        static const String addfavoriteJob = "user/add-my-favourite-jobs";
            static const String favoriteSchoolList = "user/my-favourite-jobs";
 
         static const String addfavoritecompany = "user/add-my-favourite-company";
  static const String addmyFavouriteCompany = "user/my-favourites-company";  
  static const String schoolDetailUrl = "school/detail";


  static const String deleteCVs = "user/delete-cvs";
  static const String deleteSkill = "user/delete-job_skills";
  static const String deleteEducation = "user/delete-education";
    static const String deleteProject = "user/delete-project";
        static const String deletelauguage = "user/delete-profile_languages";
  static const String deleteExperience = "user/delete-experience";


}