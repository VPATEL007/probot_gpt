import '../config.dart';

class AppArray {
  // On boarding list
  var onBoardingList = [
    {
      "image": eImageAssets.ob1,
      "title": appFonts.chatWith,
      "subtitle": appFonts.openAiChatGpt
    },
    {
      "image": eImageAssets.ob2,
      "title": appFonts.easilyGenerateImage,
      "subtitle": appFonts.toReceiveTheFinest
    },
    {
      "image": eImageAssets.ob3,
      "title": appFonts.quickCreation,
      "subtitle": appFonts.enterTheTitle
    }
  ];

//Select character list
  var selectCharacterList = [
    {"image": eSvgAssets.first, "title": appFonts.dino},
    {"image": eSvgAssets.seccond, "title": appFonts.king},
    {"image": eSvgAssets.third, "title": appFonts.dolly},
    {"image": eSvgAssets.forth, "title": appFonts.kettie},
    {"image": eSvgAssets.seccond, "title": appFonts.marvel},
    {"image": eImageAssets.third, "title": appFonts.henny},
    {"image": eImageAssets.first, "title": appFonts.sophie}
  ];

// Languages list
  var languagesList = [
    {
      "image": eImageAssets.english,
      "title": appFonts.english,
      'locale': const Locale('en', 'US'),
      "code": "en"
    },
    {
      "image": eImageAssets.arabic,
      "title": appFonts.arabic,
      'locale': const Locale('ar', 'AE'),
      "code": "ar"
    },
    {
      "image": eImageAssets.indian,
      "title": appFonts.hindi,
      'locale': const Locale('hi', 'IN'),
      "code": "hi"
    },
    {
      "image": eImageAssets.french,
      "title": appFonts.french,
      'locale': const Locale('fr', 'CA'),
      "code": "fr"
    },
    {
      "image": eImageAssets.italian,
      "title": appFonts.italian,
      'locale': const Locale('it', 'IT'),
      "code": "it"
    },
    {
      "image": eImageAssets.german,
      "title": appFonts.german,
      'locale': const Locale('ge', 'GE'),
      "code": "ge"
    },
    {
      "image": eImageAssets.japanese,
      "title": appFonts.japanese,
      'locale': const Locale('ja', 'JP'),
      "code": "ja"
    },
  ];

  // bottom list
  var bottomList = [
    {
      "title": "home",
      "icon": eSvgAssets.home,
      "iconSelected": eSvgAssets.homeColor
    },
    {
      "title": "chat",
      "icon": eSvgAssets.chat,
      "iconSelected": eSvgAssets.chatColor
    },
    {
      "title": "image",
      "icon": eSvgAssets.gallery,
      "iconSelected": eSvgAssets.galleryColor
    },
    {
      "title": "content",
      "icon": eSvgAssets.content,
      "iconSelected": eSvgAssets.contentColor
    },
    {
      "title": "setting",
      "icon": eSvgAssets.setting,
      "iconSelected": eSvgAssets.settingColor
    }
  ];

  // homeOption list
  var homeOptionList = [
    {
      "title": "option1",
      "icon": eSvgAssets.first,
      "desc": "desc1",
      "chat": "chat1"
    },
    {
      "title": "option2",
      "icon": eSvgAssets.seccond,
      "desc": "desc2",
      "chat": "chat2"
    },
    {
      "title": "option3",
      "icon": eSvgAssets.third,
      "desc": "desc3",
      "chat": "chat3"
    },
    {
      "title": "option4",
      "icon": eSvgAssets.forth,
      "desc": "desc4",
      "chat": "chat4"
    },
  ];

  //drawer list
  var drawerList = [
    {"title": "chatBot", "icon": eSvgAssets.chat},
    {"title": "chatHistory", "icon": eSvgAssets.chatHistory},
    {"title": "option2", "icon": eSvgAssets.gallery},
    {"title": "option3", "icon": eSvgAssets.content},
    {"title": "setting", "icon": eSvgAssets.setting},
  ];

  //chat list
  var chatList = [
    {
      "dateTime": "Today, 5:30 am",
      "chat": [
        {
          "isReceiver": true,
          "message": "Hello, There ?",
          "time": "5:30",
        },
        {
          "isReceiver": false,
          "message": "Hello !!",
          "time": "5:31",
        },
        {
          "isReceiver": true,
          "message": "How are you ? 😄",
          "time": "5:31",
        },
        {
          "isReceiver": false,
          "message": "I’m good ! what about you ?",
          "time": "5:32",
        },
        {
          "isReceiver": false,
          "message": "I’m good ! what about you ?",
          "time": "5:32",
        },
        {
          "isReceiver": true,
          "message": "Too good !\nWhere were you all this time ?",
          "time": "5:32",
        },
        {"isReceiver": true, "message": "Have any problem ?", "time": "5:32"},
        {
          "isReceiver": false,
          "message": "Yeah ! i’m not so good. 😐",
          "time": "5:33"
        },
        {
          "isReceiver": false,
          "message": "I need just some time. 😇",
          "time": "5:33",
        },
        {
          "isReceiver": true,
          "message": "Too good !\nWhere were you all this time ?",
          "time": "5:34",
        },
        {
          "isReceiver": true,
          "message": "Too good !\nWhere were you all this time ?",
          "time": "5:34",
        },
        {
          "isReceiver": false,
          "message": "I need just some time. 😇",
          "time": "5:35",
        },
      ]
    }
  ];

  // notification list
  var notificationsList = [
    {
      "image": eImageAssets.sc6,
      "title": appFonts.hennyHasSent,
      "subtitle": appFonts.justNow,
    },
    {
      "image": eImageAssets.lock,
      "title": appFonts.yourPasswordHasBeen,
      "subtitle": appFonts.am12,
    },
    {
      "image": eImageAssets.sc7,
      "title": appFonts.sophieHasWrite,
      "subtitle": appFonts.am11,
    },
    {
      "image": eImageAssets.sc1,
      "title": appFonts.dinoHasSent,
      "subtitle": appFonts.am10,
    },
    {
      "image": eImageAssets.sc5,
      "title": appFonts.marvelHasSent,
      "subtitle": appFonts.am9,
    },
    {
      "image": eImageAssets.sc4,
      "title": appFonts.kettieHasWrite,
      "subtitle": appFonts.am9,
    },
    {
      "image": eImageAssets.sc2,
      "title": appFonts.kingHasSend,
      "subtitle": appFonts.am9,
    },
  ];

// image size list
  var imageSizeList = ['256x256', '512x512', '1024x1024'];

  // view type list
  var viewTypeList = [appFonts.pageType, appFonts.gridType];

  // images list of image generator
  var imageGeneratorList = [
    {"image": eImageAssets.ig1},
    {"image": eImageAssets.ig2},
    {"image": eImageAssets.ig3},
    {"image": eImageAssets.ig4},
    {"image": eImageAssets.ig5},
    {"image": eImageAssets.ig6},
  ];

// no. of images list
  var noOfImagesList = ["5", "10", "15", "20"];

// image style list
  var imageStyleList = [
    appFonts.defaults,
    appFonts.abstract,
    appFonts.anime,
    appFonts.cartoon,
    appFonts.comic
  ];

// mood list
  var moodList = [
    appFonts.defaults,
    appFonts.happy,
    appFonts.sad,
    appFonts.angry
  ];

// image color list
  var imageColorList = [
    appFonts.defaults,
    appFonts.color,
    appFonts.blackWhite,
    appFonts.neon
  ];

  //background list
  var backgroundList = [
    {"image": eImageAssets.background1, "darkImage": eImageAssets.dBg1},
    {"image": eImageAssets.background2, "darkImage": eImageAssets.dBg2},
    {"image": eImageAssets.background3, "darkImage": eImageAssets.dBg3},
    {"image": eImageAssets.background4, "darkImage": eImageAssets.dBg4},
    {"image": eImageAssets.background5, "darkImage": eImageAssets.dBg5},
    {"image": eImageAssets.background6, "darkImage": eImageAssets.dBg6}
  ];

  //setting list
  var settingList = [
    {"icon": eSvgAssets.profile, "title": "myAccount"},
    {"icon": eSvgAssets.selectCharacter, "title": "selectCharacter"},
    {"icon": eSvgAssets.rtl, "title": "rtl"},
    {"icon": eSvgAssets.subscribe, "title": "subscriptionPlan"},
    {"icon": eSvgAssets.fingerLock, "title": "fingerprintLock"},
    {"icon": eSvgAssets.translate, "title": "language"},
    {"icon": eSvgAssets.star, "title": "rateApp"},
    {"icon": eSvgAssets.security, "title": "privacyTerm"},
    {"icon": eSvgAssets.refund, "title": "refundPolicy"},
    {"icon": eSvgAssets.logout, "title": "logout"}
  ];

  //content option List
  var contentOptionList = [
    "businessIdea",
    "coverLetter",
    "blogSection",
    "marketingWriting",
    "service"
  ];

  // notification list
  var notificationList = [
    {
      "title": appFonts.newMessage,
      "value": true,
    },
    {
      "title": appFonts.newUpdates,
      "value": false,
    },
    {
      "title": appFonts.passwordChange,
      "value": true,
    },
  ];

  //subscription plan
  var subscriptionPlan = [
    {
      "planName": "basicPlan",
      "type": "weekly",
      "price": 5.49,
      "priceTpe": "week",
      "icon": eSvgAssets.star1,
      "benefits": [
        "weekBenefit1",
        "weekBenefit2",
        "weekBenefit3",
      ]
    },
    {
      "planName": "advancePlan",
      "type": "monthly",
      "price": 18.99,
      "priceTpe": "month",
      "icon": eSvgAssets.crown,
      "benefits": [
        "weekBenefit1",
        "monthBenefit1",
        "monthBenefit2",
      ]
    },
    {
      "planName": "standardPlan",
      "type": "yearly",
      "price": 159,
      "priceTpe": "year",
      "icon": eSvgAssets.medal,
      "benefits": [
        "weekBenefit1",
        "yearBenefit1",
        "yearBenefit2",
      ]
    }
  ];

  //currency list
  var currencyList = [
    {
      'title': "dollar",
      "icon": eSvgAssets.dollar,
      'code': 'USD',
      'symbol': '\$',
      'USD': 1,
      'INR': 82.56,
      'POU': 0.82,
      'EUR': 0.94,
    },
    {
      'title': "euro",
      "icon": eSvgAssets.euro,
      'code': 'EUR',
      'symbol': '€',
      'USD': 1.03,
      'INR': 84.00,
      'POU': 0.87,
      'EUR': 1,
    },
    {
      'title': "inr",
      'code': 'INR',
      "icon": eSvgAssets.inr,
      'symbol': '₹',
      'USD': 0.012,
      'INR': 1,
      'POU': 0.010,
      'EUR': 0.011,
    },
    {
      'title': "pound",
      'icon': eSvgAssets.pound,
      'code': 'POU',
      'symbol': '£',
      'USD': 1.18,
      'INR': 96.70,
      'POU': 1,
      'EUR': 1.15,
    },
  ];

// chat history
  var chatHistoryList = [
    {
      "icon": eImageAssets.sc1,
      "title": appFonts.whatIsApp,
      "subtitle": appFonts.min2,
    },
    {
      "icon": eImageAssets.sc2,
      "title": appFonts.howToMake,
      "subtitle": appFonts.min50,
    },
    {
      "icon": eImageAssets.sc3,
      "title": appFonts.whatIsTheNext,
      "subtitle": appFonts.yesterday,
    },
    {
      "icon": eImageAssets.sc4,
      "title": appFonts.whoIsShahRukh,
      "subtitle": appFonts.march26,
    },
    {
      "icon": eImageAssets.sc5,
      "title": appFonts.howTolLearn,
      "subtitle": appFonts.march25,
    },
    {
      "icon": eImageAssets.sc6,
      "title": appFonts.isACourse,
      "subtitle": appFonts.march24,
    },
    {
      "icon": eImageAssets.sc7,
      "title": appFonts.whatIsFull,
      "subtitle": appFonts.march23,
    },
  ];
  var paymentMethodList = [
    {
      "icon": eImageAssets.paypal,
      "title": appFonts.payPal.tr,
    },
    {
      "icon": eImageAssets.stripe,
      "title": appFonts.stripe.tr,
    },
    {"icon": eImageAssets.razor, "title": appFonts.razor.tr},
    {"icon": eImageAssets.inApp, "title": appFonts.inApp},
  ];
}
