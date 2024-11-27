

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_hiring/utility/naukri_enum.dart';

import '../models/common_model.dart';
import '../pages/pages.dart';
import 'app_constant.dart';

class StaticDatabase {


  static List<CommonModel> filterList = [
    CommonModel(
        id: 1,
        title: "Experience",
        value: filterListEnum.experience
    ),
    CommonModel(
        id: 1,
        title: "Career",
        value: filterListEnum.career
    ),
    CommonModel(
        id: 1,
        title: "Industry",
        value: filterListEnum.industry
    ),

    CommonModel(
        id: 1,
        title: "Functional Area",
        value: filterListEnum.functionalArea
    ),
    CommonModel(
        id: 1,
        title: "State",
        value: filterListEnum.state
    ),
    CommonModel(
        id: 1,
        title: "Result Type",
        value: filterListEnum.resultType
    ),
    CommonModel(
        id: 1,
        title: "Skill",
        value: filterListEnum.skill
    ),
    CommonModel(
        id: 1,
        title: "Language",
        value: filterListEnum.language
    ),
    CommonModel(
        id: 1,
        title: "Major Subjects",
        value: filterListEnum.majorSubject
    ),
    CommonModel(
        id: 1,
        title: "Degree Level",
        value: filterListEnum.degreeLevel
    ),
    // CommonModel(
    //     id: 1,
    //     title: "Degree Type",
    //     value: "degreeType"
    // ),
  ];


  static List<CommonModel> loginIntroList = [
    CommonModel(
      image:  'assets/images/logo.png',
   title  :  'Welcome and PTAC Software India Pvt Ltd',
     description: " We specialize in finding the best companies tailored to your needs. Our goal is to connect individuals and businesses with organizations that align with their values, goals, and preferences. Whether you're seeking top employers, industry leaders, or trusted service providers, we provide in-depth research and insights to ensure the best match."     
    ),
    CommonModel(
        image:  'assets/images/intro2.svg',
          title:  'Current Job Openings',
    description: "Discover a range of roles tailored for passionate educators and staff. Browse our current job openings and find the perfect fit for you!"
      
    ),
    CommonModel(
        image:'assets/images/intro3.svg',
        title:  'Application Process',
       description: "Ready to apply? Follow our simple, step-by-step application process to start your journey with us. Your path to inspiring young minds begins here"
       )
  ];

  static List<CommonModel> homeScreenList = [
    CommonModel(
        image: "assets/images/store.png",
        title: "Buy, sell and rent",
      routes: Routes.ecomListScreen
    ),
    CommonModel(
        image: "assets/images/group.png",
        title: "Explore Wheels",
        routes: Routes.exploreBikeCatalog
    ),
    CommonModel(
        image: "assets/images/group.png",
        title: "Create Group"
    ),
    CommonModel(
        image: "assets/images/feedback.png",
        title: "Share Experience"
    )
  ];

  static List<CommonModel> genderChoices = [
    CommonModel(
      title: "Male",
      translatedName: "male",
    ),
    CommonModel(
      title: "Female",
      translatedName: "female",
    ),
  ];

  static List<CommonModel> commonYesList = [

    CommonModel(
      title: "Yes",
      value: 0,
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "No",
      value: 1,
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Occasionally",
      value: 2,
      isChecked: false,
      isVisible: true,
    )
  ];

  static List<CommonModel> dietStatusList = [
    CommonModel(
      title: "Non Vegetarian",
      value: 0,
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Vegetarian",
      value: 1,
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Jain",
      value: 2,
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Vegan",
      value: 3,
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Occasionally Non Veg",
      value: 4,
      isChecked: false,
      isVisible: true,
    )
  ];

  static List<CommonModel> userInterest = [
    CommonModel(
      title: "Hiking",
      value: 0,
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Mountains",
      value: 1,
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "fast",
      value: 2,
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Super Fast",
      value: 3,
      isChecked: false,
      isVisible: true,
    ),

  ];

  static List<CommonModel> ecomServiceAreas = [
    CommonModel(
      title: "Delhi",
      value: 0,
      image: "assets/images/delhi.png",
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Manali",
      value: 1,
      image: "assets/images/manali.png",
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Mumbai",
      value: 2,
      image: "assets/images/mumbai.png",
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Chennai",
      value: 3,
      image: "assets/images/chennai.png",
      isChecked: false,
      isVisible: true,
    ),

  ];


  static List<CommonModel> profileSettingList = [
    CommonModel(
      title: "Edit Profile",
      value: 0,
      image: "assets/images/edit-profile.png",
      routes: Routes.userProfileScreen,
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "My Trips",
      value: 1,
      isChecked: false,
      image: "assets/images/mytrips.png",
      isVisible: true,
    ),
    CommonModel(
      title: "My Address",
      value: 1,
      isChecked: false,
      routes: Routes.addressListScreen,
      image: "assets/images/mytrips.png",
      isVisible: true,
    ),
    CommonModel(
      title: "Membership",
      value: 2,
      isChecked: false,
      image: "assets/images/membership.png",
      routes: Routes.mediaUploadScreen,
      isVisible: true,
    ),
    CommonModel(
      title: "My Gallery",
      value: 2,
      isChecked: false,
      image: "assets/images/my-gallery.png",
      routes: Routes.userGalleryScreen,
      isVisible: true,
    ),
    CommonModel(
      title: "Notification",
      value: 3,
      isChecked: false,
      routes: Routes.notificationListScreen,
      image: "assets/images/noti.png",
      isVisible: true,
    ),
    CommonModel(
      title: "Privacy",
      value: 1,
      isChecked: false,
      routes: Routes.privacyPolicy,
      image: "assets/images/privacy.png",
      isVisible: true,
    ),
    CommonModel(
      title: "Settings",
      value: 2,
      isChecked: false,
      routes: Routes.settingListScreen,
      image: "assets/images/settings.png",
      isVisible: true,
    ),
    CommonModel(
      title: "Help & Support",
      value: 3,
      routes: Routes.helpListScreen,
      image: "assets/images/help.png",
      isChecked: false,
      isVisible: true,
    ),

  ];

  static List<CommonModel> settingList = [
    CommonModel(
      title: "Location",
      value: 0,
      image: "assets/images/location.png",
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Language",
      value: 1,
      isChecked: false,
      image: "assets/images/language.png",
      isVisible: true,
    ),
    CommonModel(
      title: "Help",
      value: 2,
      isChecked: false,
      image: "assets/images/help.png",
      isVisible: true,
    ),
    CommonModel(
      title: "Logout",
      value: 3,
      isChecked: false,
      redirectType: AppConstant.redirectTypeLogoutFunction,
      image: "assets/images/logout.png",
      isVisible: true,
    ),
    CommonModel(
      title: "Delete Account",
      value: 1,
      isChecked: false,
      redirectType: AppConstant.redirectTypeDeleteFunction,
      image: "assets/images/delete.png",
      isVisible: true,
    ),
  ];


  static List<CommonModel> travelType = [
    CommonModel(
      title: "Mountains",
      value: 0,
      image: 'https://images.unsplash.com/photo-1454496522488-7a8e488e8606?q=80&w=3552&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Beaches",
      value: 1,
      image: 'https://images.unsplash.com/photo-1590523741831-ab7e8b8f9c7f?q=80&w=3474&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Wild Escapes",
      value: 2,
      image: 'https://images.unsplash.com/photo-1559555247-4d7664f9e608?q=80&w=3474&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Historical",
      value: 3,
      image: 'https://images.unsplash.com/photo-1577083553085-d63cdcdf2fc8?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      isChecked: false,
      isVisible: true,
    ),

  ];


  static List<CommonModel> tripInfoType = [
    CommonModel(
      title: "Mountains",
      value: 0,
      image: 'https://images.unsplash.com/photo-1454496522488-7a8e488e8606?q=80&w=3552&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Beaches",
      value: 1,
      image: 'https://images.unsplash.com/photo-1590523741831-ab7e8b8f9c7f?q=80&w=3474&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Wild Escapes",
      value: 2,
      image: 'https://images.unsplash.com/photo-1559555247-4d7664f9e608?q=80&w=3474&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Historical",
      value: 3,
      image: 'https://images.unsplash.com/photo-1577083553085-d63cdcdf2fc8?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      isChecked: false,
      isVisible: true,
    ),

  ];






  static List<CommonModel> notificationList = [
    CommonModel(
      title: "Today",
      commonModel: [
        CommonModel(
          title: "Shweta Saran",
          description: "wants to connect to you",
          value: 1,
          iconData: Icons.calendar_month,
          isChecked: false,
          iconColor: Color(0xffC49B5B),
          isVisible: true,
        ),
        CommonModel(
          title: "Shweta Saran",
          description: "wants to connect to you",
          value: 1,
          iconData: Icons.calendar_month,
          isChecked: false,
          iconColor: Color(0xffC49B5B),
          isVisible: true,
        ),
        CommonModel(
          title: "Shweta Saran",
          description: "wants to connect to you",
          value: 1,
          iconData: Icons.calendar_month,
          isChecked: false,
          iconColor: Color(0xffC49B5B),
          isVisible: true,
        ),
      ],
      value: 0,
      iconData: Icons.location_on,
      isChecked: false,
      iconColor: Color(0xff950505),
      isVisible: true,
    ),
    CommonModel(
      title: "This week",
      commonModel: [
        CommonModel(
          title: "Shweta Saran",
          description: "wants to connect to you",
          value: 1,
          iconData: Icons.calendar_month,
          isChecked: false,
          iconColor: Color(0xffC49B5B),
          isVisible: true,
        ),
        CommonModel(
          title: "Shweta Saran",
          description: "wants to connect to you",
          value: 1,
          iconData: Icons.calendar_month,
          isChecked: false,
          iconColor: Color(0xffC49B5B),
          isVisible: true,
        ),
        CommonModel(
          title: "Shweta Saran",
          description: "wants to connect to you",
          value: 1,
          iconData: Icons.calendar_month,
          isChecked: false,
          iconColor: Color(0xffC49B5B),
          isVisible: true,
        ),
      ],
      value: 0,
      iconData: Icons.location_on,
      isChecked: false,
      iconColor: Color(0xff950505),
      isVisible: true,
    ),
    CommonModel(
      title: "Last Month",
      commonModel: [
        CommonModel(
          title: "Shweta Saran",
          description: "wants to connect to you",
          value: 1,
          iconData: Icons.calendar_month,
          isChecked: false,
          iconColor: Color(0xffC49B5B),
          isVisible: true,
        ),
        CommonModel(
          title: "Shweta Saran",
          description: "wants to connect to you",
          value: 1,
          iconData: Icons.calendar_month,
          isChecked: false,
          iconColor: Color(0xffC49B5B),
          isVisible: true,
        ),
        CommonModel(
          title: "Shweta Saran",
          description: "wants to connect to you",
          value: 1,
          iconData: Icons.calendar_month,
          isChecked: false,
          iconColor: Color(0xffC49B5B),
          isVisible: true,
        ),
      ],
      value: 0,
      iconData: Icons.location_on,
      isChecked: false,
      iconColor: Color(0xff950505),
      isVisible: true,
    ),

  ];


  static List<CommonModel> chatList = [
    CommonModel(
      title: "Shivani Patel",
      description: "3 New Messages",
      value: 0,
      iconData: Icons.location_on,
      isChecked: false,
      iconColor: Color(0xff950505),
      isVisible: true,
    ),
    CommonModel(
      title: "Sourav",
      description: "2 New Messages",
      value: 1,
      iconData: Icons.calendar_month,
      isChecked: false,
      iconColor: Color(0xffC49B5B),
      isVisible: true,
    ),
    CommonModel(
      title: "Chandan",
      description: "6 New Messages",
      value: 2,
      iconData: Icons.timer,
      isChecked: false,
      iconColor: Colors.black,
      isVisible: true,
    ),
    CommonModel(
      title: "Ajit",
      description: "31 New Messages",
      value: 3,
      iconColor: Color(0xff950505),
      iconData: Icons.location_pin,
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Farhan",
      description: "13 New Messages",
      value: 3,
      iconColor: Color(0xff950505),
      iconData: Icons.location_pin,
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Babu",
      description: "30 New Messages",
      value: 3,
      iconColor: Color(0xff950505),
      iconData: Icons.location_pin,
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Fazeer",
      description: "23 New Messages",
      value: 3,
      iconColor: Color(0xff950505),
      iconData: Icons.location_pin,
      isChecked: false,
      isVisible: true,
    ),
  ];


  static List<CommonModel> notificationSettingList = [
    CommonModel(
      title: "Email",
      description: "",
      value: 0,
      image: "assets/images/noti-email.png",
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Push Notifications",
      description: "",
      value: 0,
      image: "assets/images/noti-push.png",
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Sms Notifications",
      description: "",
      value: 0,
      image: "assets/images/noti-sms.png",
      isChecked: false,
      isVisible: true,
    ),
    CommonModel(
      title: "Promos & Offers",
      description: "",
      value: 0,
      image: "assets/images/noti-email.png",
      isChecked: true,
      isVisible: true,
    ),
    CommonModel(
      title: "Group Notifications",
      description: "",
      value: 0,
      image: "assets/images/noti-group.png",
      isChecked: true,
      isVisible: true,
    ),

  ];
  static List<CommonModel> profileExtraList = [
    CommonModel(
      title: "Interests",
      value: 0,
      image: "assets/images/edit-profile.png",
      routes: Routes.userProfileScreen,
      isChecked: false,
      isVisible: true,
      contentType: AppConstant.profileTypeInterest,
      commonModel: [
        CommonModel(
          title: "Movies",
          value: "Movies",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Gym",
          value: "Gym",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Sports",
          value: "Sports",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Travel",
          value: "Travel",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Walking",
          value: "Walking",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Hiking",
          value: "Hiking",
          isChecked: false,
          isVisible: true,
        ),

        CommonModel(
          title: "90s Kid",
          value: "90s Kid",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Medidation",
          value: "Medidation",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Self Care",
          value: "Self Care",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Spotify",
          value: "Spotify",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Yoga",
          value: "Yoga",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Music",
          value: "Music",
          isChecked: false,
          isVisible: true,
        ),

        CommonModel(
          title: "Fashion",
          value: "Fashion",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "History",
          value: "History",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Pet Care",
          value: "Pet Care",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Baking",
          value: "Baking",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Poetry",
          value: "Poetry",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Teaching",
          value: "Teaching",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Coding",
          value: "Coding",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Skating",
          value: "Skating",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Other",
          value: "Other",
          isChecked: false,
          isVisible: true,
        ),
      ]
    ),
    CommonModel(
      title: "Language",
      value: 1,
      isChecked: false,
        contentType: AppConstant.profileTypeLanguage,
      image: "assets/images/language.png",
      isVisible: true,
        commonModel: [
          CommonModel(
            title: "Movies",
            value: "Movies",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Hindi",
            value: "Hindi",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "English",
            value: "English",
            isChecked: false,
            isVisible: true,
          ),

        ]
    ),
    CommonModel(
      title: "Personality Type",
      value: 2,
      isChecked: false,
        contentType: AppConstant.profileTypePersonalityType,
      image: "assets/images/p-type.png",
      isVisible: true,
        commonModel: [
          CommonModel(
            title: "ISTJ",
            value: "ISTJ",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "ISFJ",
            value: "ISFJ",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "INFJ",
            value: "INFJ",
            isChecked: false,
            isVisible: true,
          ),

          CommonModel(
            title: "INTJ",
            value: "INTJ",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "ISTP",
            value: "ISTP",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "ISFP",
            value: "ISFP",
            isChecked: false,
            isVisible: true,
          ),

          CommonModel(
            title: "INFP",
            value: "INFP",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "INTP",
            value: "INTP",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "ESTP",
            value: "ESTP",
            isChecked: false,
            isVisible: true,
          ),

          CommonModel(
            title: "ESFP",
            value: "ESFP",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "ENFP",
            value: "ENFP",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "ENTP",
            value: "ENTP",
            isChecked: false,
            isVisible: true,
          ),

          CommonModel(
            title: "ESTJ",
            value: "ESTJ",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "ESFJ",
            value: "ESFJ",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "ENFJ",
            value: "ENFJ",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "ENTJ",
            value: "ENTJ",
            isChecked: false,
            isVisible: true,
          ),

        ]
    ),
    CommonModel(
      title: "Pets",
      value: 3,
      isChecked: false,
        contentType: AppConstant.profileTypePets,
      image: "assets/images/pets.png",
      isVisible: true,
      commonModel: [
        CommonModel(
          title: "Dogs",
          value: "Dogs",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Cats",
          value: "Cats",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Rabbits",
          value: "Rabbits",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Birds",
          value: "Birds",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Fish",
          value: "Fish",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Turtles",
          value: "Turtles",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Snakes",
          value: "Snakes",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Insects",
          value: "Insects",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Mouse",
          value: "Mouse",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Allergic",
          value: "Allergic",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Don’t have",
          value: "Don’t have",
          isChecked: false,
          isVisible: true,
        ),
        CommonModel(
          title: "Other",
          value: "Other",
          isChecked: false,
          isVisible: true,
        ),
      ]
    ),
    CommonModel(
      title: "Choose Your Wheels",
      value: 1,
      isChecked: false,
        contentType: AppConstant.profileTypeChooseWheels,
      image: "assets/images/wheels.png",
      isVisible: true,
        commonModel: [
          CommonModel(
            title: "300 cc",
            value: "300 cc",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "310 cc",
            value: "310 cc",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "648 cc",
            value: "648 cc",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "294.72 cc",
            value: "294.72 cc",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "948 cc",
            value: "948 cc",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "398 cc",
            value: "398 cc",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "452 cc",
            value: "452 cc",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "1200 cc",
            value: "1200 cc",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "1868 cc",
            value: "1868 cc",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "2458 cc",
            value: "2458 cc",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "398.15 cc",
            value: "398.15 cc",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Other",
            value: "Other",
            isChecked: false,
            isVisible: true,
          ),
        ]
    ),
    CommonModel(
      title: "Pick Your Belief",
      value: 2,
      isChecked: false,
        contentType: AppConstant.profileTypeBelief,
      routes: Routes.settingListScreen,
      image: "assets/images/belief.png",
      isVisible: true,
        commonModel: [
          CommonModel(
            title: "Hindu",
            value: "Hindu",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Muslim",
            value: "Muslim",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Christian",
            value: "Christian",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Buddhist",
            value: "Buddhist",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Jewish",
            value: "Jewish",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Sikh",
            value: "Sikh",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Jain",
            value: "Jain",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Parsi",
            value: "Parsi",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Bahai",
            value: "Bahai",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Atheist",
            value: "Atheist",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Agnostic",
            value: "Agnostic",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Other",
            value: "Other",
            isChecked: false,
            isVisible: true,
          ),
        ]
    ),

    CommonModel(
      title: "Drinking",
      value: 1,
      isChecked: false,
        contentType: AppConstant.profileTypeDrinking,
      image: "assets/images/drinks-p.png",
      isVisible: true,
        commonModel: [
          CommonModel(
            title: "Never",
            value: "Never",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Mostly",
            value: "Mostly",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Curious",
            value: "Curious",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Once a week",
            value: "Once a week",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Only on weekends",
            value: "Only on weekends",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Other",
            value: "Other",
            isChecked: false,
            isVisible: true,
          ),
        ]
    ),
    CommonModel(
      title: "Smoking",
      value: 2,
      isChecked: false,
        contentType: AppConstant.profileTypeSmoking,
      image: "assets/images/smoking-p.png",
      isVisible: true,
        commonModel: [
          CommonModel(
            title: "Never smoke",
            value: "Never smoke",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            value: "Rarely smoke",
            title: "Rarely smoke",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Curious",
            value: "Curious",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Everyday",
            value: "Everyday",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Only on weekends",
            value: "Only on weekends",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Other",
            value: "Other",
            isChecked: false,
            isVisible: true,
          ),
        ]
    ),
    CommonModel(
      title: "Workout",
      value: 3,
      isChecked: false,
        contentType: AppConstant.profileTypeWorkout,
      image: "assets/images/workout.png",
      isVisible: true,
        commonModel: [
          CommonModel(
            title: "Never workout",
            value: "neverworkout",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            value: "rarelyworkout",
            title: "Rarely workout",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Once a week",
            value: "onceaweek",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Everyday",
            value: "everyday",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Only on weekends",
            value: "onlyonweekends",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Other",
            value: "other",
            isChecked: false,
            isVisible: true,
          ),
        ]
    ),
    CommonModel(
      title: "Eating preference",
      value: 1,
      isChecked: false,
        contentType: AppConstant.profileTypeEP,
      image: "assets/images/eating-p.png",
      isVisible: true,
        commonModel: [
          CommonModel(
            title: "Vegetarian",
            value: "Vegetarian",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Non vegetarian",
            value: "Non Vegetarian",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Vegan",
            value: "Vegan",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Pescatarian",
            value: "Pescatarian",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Omnivorous",
            value: "Omnivorous",
            isChecked: false,
            isVisible: true,
          ),
        ]
    ),
    CommonModel(
      title: "Social Media",
      value: 2,
      isChecked: false,
        contentType: AppConstant.profileTypeSM,
      routes: Routes.settingListScreen,
      image: "assets/images/social-media.png",
      isVisible: true,
        commonModel: [
          CommonModel(
            title: "Content creator",
            value: "Content creator",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Occasional user",
            value: "Occasional user",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Daily scroller",
            value: "Daily scroller",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Unplugged user",
            value: "Unplugged user",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Influencer",
            value: "Influencer",
            isChecked: false,
            isVisible: true,
          ),
        ]
    ),
    CommonModel(
      title: "Sleep Routine",
      value: 3,
        contentType: AppConstant.profileTypeSR,
      image: "assets/images/sleep-p.png",
      isChecked: false,
      isVisible: true,
        commonModel: [
          CommonModel(
            title: "Early-to-bed",
            value: "Early-to-bed",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Early riser",
            value: "Early riser",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Night owl",
            value: "Night owl",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Late riser",
            value: "Late riser",
            isChecked: false,
            isVisible: true,
          ),
          CommonModel(
            title: "Routine sleeper",
            value: "Routine sleeper",
            isChecked: false,
            isVisible: true,
          ),
        ]
    ),

  ];
  static CommonModel helpSupportListMaster = CommonModel(
    title: "Help & Support",
    description: "Browse Common Issue and get in touch with our support team",
    value: 0,
    image: "assets/images/noti-email.png",
    isChecked: false,
    isVisible: true,
    commonModel: [
      CommonModel(
        title: "How to Create Trip",
        description: "Get Complete Instruction for creating Trips & Etc",
        value: 0,
        image: "assets/images/help-trips.png",
        isChecked: true,
        isVisible: true,
      ),
      CommonModel(
        title: "Refunds",
        description: "Get Complete Instruction for creating Trips & Etc",
        value: 0,
        image: "assets/images/help-refund.png",
        isChecked: true,
        isVisible: true,
      ),
      CommonModel(
        title: "Delete Account",
        description: "Get Complete Instruction for creating Trips & Etc",
        value: 0,
        image: "assets/images/help-da.png",
        isChecked: true,
        isVisible: true,
      ),
      CommonModel(
        title: "Membership",
        description: "Get Complete Instruction for creating Trips & Etc",
        value: 0,
        image: "assets/images/help-membership.png",
        isChecked: true,
        isVisible: true,
      ),
    ]
  );

  static List<CommonModel> exploreBikeList = [
    CommonModel(
        image: "assets/images/ktm.png",
        title: "KTM",
        routes: Routes.ecomListScreen
    ),
    CommonModel(
        image: "assets/images/jawa.png",
        title: "Jawa",

    ),
    CommonModel(
        image: "assets/images/bajaj.png",
        title: "Bajaj"
    ),
    CommonModel(
        image: "assets/images/kawasakhi.png",
        title: "Kawasakhi"
    ),
    CommonModel(
        image: "assets/images/royal.png",
        title: "Royal Enfield"
    ),
    CommonModel(
        image: "assets/images/harley.png",
        title: "Harley Davidson"
    )
  ];
}
