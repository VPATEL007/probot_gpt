import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:probot/config.dart';

class Home extends StatelessWidget {
  final homeCtrl = Get.put(HomeController());

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return CommonStream(
        child: Scaffold(
          key: homeCtrl.scaffoldKey,
          // drawer: const CommonDrawer(),
          appBar: AppBar(
            backgroundColor: appCtrl.appTheme.main,
            leading: const SizedBox(),
            toolbarHeight: 0,
            bottom: PreferredSize(
                preferredSize: const Size(100, 50),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          homeCtrl.pageController.jumpToPage(0);
                          homeCtrl.selectedTabIndex = 0;
                          homeCtrl.update();
                        },
                        highlightColor: const Color(0xff12171A),
                        child: SizedBox(
                          child: Column(
                            children: [
                              Text(
                                appFonts.message.tr,
                                style: AppCss.outfitMedium18
                                    .textColor(homeCtrl.selectedTabIndex == 0
                                        ? const Color(0xff7AE3E2)
                                        : const Color(0xff2D4B59))
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                              ),
                              const SizedBox(height: 20),
                              homeCtrl.selectedTabIndex == 0
                                  ? Container(
                                      width: 200,
                                      height: 2,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          gradient: const LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color(0xff405F6C),
                                                Color(0xff6A8A95),
                                                Color(0xff75959C),
                                                Color(0xffCDEEF1),
                                                Color(0xffCDEEF1),
                                                Color(0xffCDEEF1),
                                                Color(0xff75959C),
                                                Color(0xff6A8A95),
                                                Color(0xff405F6C),
                                              ])),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          homeCtrl.pageController.jumpToPage(1);
                          homeCtrl.selectedTabIndex = 1;
                          homeCtrl.update();
                        },
                        highlightColor: const Color(0xff12171A),
                        child: SizedBox(
                          child: Column(
                            children: [
                              Text(
                                appFonts.experts.tr,
                                style: AppCss.outfitMedium18
                                    .textColor(homeCtrl.selectedTabIndex == 1
                                        ? const Color(0xff7AE3E2)
                                        : const Color(0xff2D4B59))
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                              ),
                              const SizedBox(height: 20),
                              homeCtrl.selectedTabIndex == 1
                                  ? Container(
                                      width: 200,
                                      height: 2,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          gradient: const LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color(0xff405F6C),
                                                Color(0xff6A8A95),
                                                Color(0xff75959C),
                                                Color(0xffCDEEF1),
                                                Color(0xffCDEEF1),
                                                Color(0xffCDEEF1),
                                                Color(0xff75959C),
                                                Color(0xff6A8A95),
                                                Color(0xff405F6C),
                                              ])),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            // bottom: TabBar(
            //   tabs: [
            //     Tab(
            //       icon: Text(
            //         'Message',
            //         style: AppCss.outfitMedium18
            //             .textColor(homeCtrl.selectedTabIndex == 0
            //                 ? const Color(0xff7AE3E2)
            //                 : const Color(0xff2D4B59))
            //             .copyWith(fontWeight: FontWeight.w600, fontSize: 15),
            //       ),
            //     ),
            //     Tab(
            //       icon: Text(
            //         'Experts',
            //         style: AppCss.outfitMedium18
            //             .textColor(homeCtrl.selectedTabIndex == 1
            //                 ? const Color(0xff7AE3E2)
            //                 : const Color(0xff2D4B59))
            //             .copyWith(fontWeight: FontWeight.w600, fontSize: 15),
            //       ),
            //     ),
            //   ],
            //
            //   onTap: (value) {
            //     homeCtrl.selectedTabIndex = value;
            //     homeCtrl.update();
            //   },
            // ),
          ),
          body: PageView(
              onPageChanged: (value) {
                homeCtrl.selectedTabIndex = value;
              },
              controller: homeCtrl.pageController,
              children: [
                ChatHistoryScreen().paddingOnly(bottom: 50),
                Stack(alignment: Alignment.bottomCenter, children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(13, 34, 53, 1),
                          Color.fromRGBO(14, 33, 48, 1),
                          Color.fromRGBO(13, 32, 46, 1),
                          Color.fromRGBO(14, 30, 43, 1),
                          Color.fromRGBO(14, 30, 43, 1),
                          Color.fromRGBO(15, 28, 36, 1),
                          Color.fromRGBO(18, 25, 33, 1),
                          Color.fromRGBO(18, 25, 33, 1),
                          Color.fromRGBO(19, 24, 28, 1),
                          Colors.black,
                        ],
                        stops: [
                          0.0,
                          0.1,
                          0.2,
                          0.3,
                          0.4,
                          0.5,
                          0.6,
                          0.7,
                          0.8,
                          1.0,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: SingleChildScrollView(
                            child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VSpace(Sizes.s20),
                        ...homeCtrl.homeOptionList.asMap().entries.map((e) {
                          return ((appCtrl.firebaseConfigModel!.isChatShow! &&
                                      e.key == 0) ||
                                  (appCtrl.firebaseConfigModel!
                                          .isImageGeneratorShow! &&
                                      e.key == 1) ||
                                  ((appCtrl.firebaseConfigModel!
                                          .isTextCompletionShow! &&
                                      e.key == 2)))
                              ? Obx(() => OptionCard(
                                    homeOptionModel: e.value,
                                    onTap: () {
                                      homeCtrl.onOptionTap(e.value);
                                    },
                                    onHighlightChanged: (p0) {
                                      homeCtrl.isHover(p0);
                                      homeCtrl.hoverSelected(e.key);
                                    },
                                    isSelected: homeCtrl.isHover()
                                        ? homeCtrl.hoverSelected.value == e.key
                                            ? true
                                            : false
                                        : false,
                                  )).marginOnly(
                                  bottom: Insets.i15,
                                  right: appCtrl.isRTL ||
                                          appCtrl.languageVal == "ar"
                                      ? 0
                                      //            : Insets.i12,
                                      //   left: appCtrl.isRTL ||
                                      //                appCtrl.languageVal == "ar"
                                      //            ? Insets.i12
                                      : 0)
                              : const SizedBox();
                        }).toList(),
                      ],
                    ).marginOnly(bottom: Insets.i150))
                        .marginSymmetric(horizontal: Sizes.s20),
                  ),
                  //    ),
                  // if (appCtrl.firebaseConfigModel!.isAddShow!)
                  //   if (homeCtrl.bannerAd != null)
                  //     AdWidget(ad: homeCtrl.bannerAd!)
                  //         .height(Sizes.s50)
                  //         .paddingOnly(bottom: Insets.i10)
                  //         .width(MediaQuery.of(context).size.width)
                ])
              ]),
          backgroundColor: appCtrl.appTheme.white,
        ),
      );
    });
  }
}
