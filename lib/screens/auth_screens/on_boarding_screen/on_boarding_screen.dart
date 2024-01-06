import 'package:flutter/services.dart';

import '../../../config.dart';

class OnBoardingScreen extends StatelessWidget {
  final onBoardingCtrl = Get.put(OnBoardingController());

  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(builder: (_) {
      return WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return true;
          },
          child: Scaffold(
              backgroundColor: appCtrl.appTheme.bg1,
              body: PageView(
                  onPageChanged: (index) {
                    appCtrl.isOnboard = true;
                    appCtrl.storage.write("isOnboard", appCtrl.isOnboard);
                    onBoardingCtrl.selectIndex = index;
                    onBoardingCtrl.update();
                  },
                  controller: onBoardingCtrl.pageCtrl,
                  children: onBoardingCtrl.onBoardingLists
                      .asMap()
                      .entries
                      .map((e) => PageViewCommon(
                            data: e.value,
                            onTap: () {
                              if (onBoardingCtrl.selectIndex == 2) {
                                Get.toNamed(routeName.loginScreen);
                              } else {
                                onBoardingCtrl.pageCtrl.nextPage(
                                    duration: const Duration(microseconds: 500),
                                    curve: Curves.bounceInOut);
                                appCtrl.isOnboard = true;
                                appCtrl.storage.write("isOnboard", appCtrl.isOnboard);
                              }
                            },
                          ))
                      .toList())));
    });
  }
}
