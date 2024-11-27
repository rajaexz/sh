


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppConstant {

  static const String appName = "Schools Hiring";
    static const String appImage = "assets/images/schoolLogohiring.png";
  static const String appLogo = "assets/images/logo.png";
  static const String appLogoSVG = "assets/images/logo_svg.svg";
  static const String appLogoSemiSVG = "assets/images/logo.png";
  static const String loaderCircular = "assets/images/loaderCriculaar.json";
  static const String fontFamily = "";
  

  static const Locale englishLocale = Locale("en","US");
  static const Locale hindiLocale = Locale("hn","IN");
static const String toggleTheme = "toggleTheme";
  static const String appWriteBaseUrl = "https://cloud.appwrite.io/v1";

  static const String databasesIdTechBase = "63f78c62301fbdef7d46";

  static const String projectId = "63e3d8317cd1dafff6cf";

  static const String filterCollectId = "64a12497c04dfad3f411";

  static const String dummyImage = "assets/images/profile.png";

  static const profilesCollectionId = "6419677906a516510f14";
  static const int apiStatusDocumentNotFound = 404;
  static const String profilePicDefault = "assets/images/profile-default.png";
  static const double borderRadius = 15.0;
  static final DateFormat getDateFormat =  DateFormat('yyyy-MM-dd');
  static const String buckedId = "63fe2650b3f1151650a8";
  static const double gapBetweenFields = 15.0;

  static const String currencyUnicode = "\u{20B9}";
  static const double globalHorizontalMargin = 10.0;


  static const String signInFacebookProvider  = "facebook";
  static const String signInGoogleProvider  = "google";
  static const String signInAppleProvider  = "google";



  static const accountStatusIncompleteValue = 0;
  static const accountStatusPendingValue = 1;
  static const accountStatusInReviewValue = 2;
  static const accountStatusApprovedValue = 3;
  static const accountStatusRejectedValue = 4;
  static const accountStatusSuspendedValue = 5;

  static const accountMembershipInitial = 1;
  static const accountMembershipBasic = 2;
  static const accountMembershipPremium = 3;


  static const double buttonRadius = 12.0;
  static const double cardElevation = 3.0;

  static const double smallRadius = 5.0;
  static const double mediumRadius = 15.0;
  static const double largeRadius = 30.0;

  static const String lottieProgressBar = "assets/lottie/progress.json";
  static const String lottieError = "assets/lottie/error.json";
  static const String lottieMessage = "assets/lottie/message.json";
  static const String lottieBike = "assets/images/nodata.json";
  static const String lottieHooray = "assets/lottie/hooray.json";
  static const String lottieUploadLoader = "assets/lottie/upload-loader.json";

  static const String placesDatabase = "assets/data/places.json";

  static const int accountStatusPending = 1;
  static const int accountStatusInReview = 2;
  static const int accountStatusApproved = 3;
  static const int accountStatusReject = 4;
  static const int accountStatusSuspend = 5;


  static const int doesntMatter = -1;


  static const String redirectTypeRoutes = "routes";
  static const String redirectTypeLogoutFunction = "logout";
  static const String redirectTypeDeleteFunction = "delete";

  static const String isLoggedInKey = "isLogin";
  static const String tokenKey = "token";
  static const String offlineUserIdKey = "userId";
  static const String offlineNameKey = "name";
  static const String offlineEmailKey = "email";
  static const String offlineCompanyKey = "company";
  static const String offlineNumberKey = "mobile";
  static const String offlineProfilePicKey = "profilePic";
  static const String offlineUserTypeKey = "userType";
  static const String offlineUserTokenKey = "userToken";
  static const String offlineintorKey = "intorKey";

  static const String userDummyImage = "https://s3-alpha-sig.figma.com/img/e9f4/fb33/89e97b744a37a1d48297734c55a8576f?Expires=1718582400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=DTvNtzDeR74arRLi7eiw6ubkLOHcDaXrX-7f8cia8eeIVnsB6~ibcsIUgwnE~xHRWIpFmwT8uzubDyT6XTx9qngXAa-rid1tWuAkJKNB8mCX5vXYBccUg5kPX3H01Z2fLfsQ7i4FyKqByFgn1M0atiSw6sa~sDeo1s302hbBaDCh0Gp1FxTHcT-XqR4VbRsgeGuc~42NCXRbYwS3qHpcXOEXFrvao5C3gB8SrUTj7XX3tUIpEXeYpe6h1O2376fbqNH10kTrxnrEYKPeuFExCdCpMr1n9J5eYib6autRPEPzaa-POe-LgHtZniyP2RoKpY7I0Lh6YQ21ywPEDxU8NA__";

  static const String profileTypeInterest = "interest";
  static const String profileTypeLanguage = "language";
  static const String profileTypePersonalityType = "personalityType";
  static const String profileTypePets = "pets";
  static const String profileTypeChooseWheels = "chooseWheels";
  static const String profileTypeBelief = "belief";
  static const String profileTypeDrinking = "drinking";
  static const String profileTypeSmoking = "smoking";
  static const String profileTypeWorkout = "workout";
  static const String profileTypeEP = "ep";
  static const String profileTypeSM = "sm";
  static const String profileTypeSR = "sr";


  static const bool responseSuccessStatusCode = true;

  static const String bikeJsonPath = "assets/data/bike.json";


  static const String dummyText = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.";


  static const List<String> imageAssetsBike = [
    "https://images.unsplash.com/photo-1686472450943-33a772c49923?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1646729213778-63f0540a6d7a?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1653058489330-b6ede759022e?q=80&w=3542&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

  static String formattedNumber(numberToFormat) => NumberFormat.compactCurrency(
    decimalDigits: 2,
    symbol: '', // if you want to add currency symbol then pass that in this else leave it empty.
  ).format(numberToFormat);

  //static const double gapBetweenFields  = 15.0;


  static const String cvPdfType = "pdf";
  static const String cvDocType = "doc";


  static const String socialIconFacebook  = "assets/images/facebook.png";
  static const String socialIconInstagram  = "assets/images/instagram.png";
  static const String socialIconLinkedin  = "assets/images/linkedin.png";
  static const String socialIconTwitter  = "assets/images/twitter.png";
  static const String backgroundCardOne  = "assets/images/card-one.png";






}