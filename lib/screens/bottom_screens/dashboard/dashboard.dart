import '../../../config.dart';
import 'layouts/tab_common.dart';

class Dashboard extends StatelessWidget {
  final dashboardCtrl = Get.put(DashboardController());

  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (_) {
      return DirectionalityRtl(
          child: WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Scaffold(
                backgroundColor: appCtrl.appTheme.bg1,
                body: Stack(
                  children: [
                    dashboardCtrl.widgetOptions
                        .elementAt(dashboardCtrl.selectedIndex),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        // color: appCtrl.appTheme.bg1,
                        height: Sizes.s100,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: Sizes.s70,
                                decoration: const BoxDecoration(
                                    color: Color(0xff12171A),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xff12171A),
                                          blurRadius: 25,
                                          spreadRadius: 10,
                                          offset: Offset(4, 4))
                                    ]),
                                width: double.maxFinite,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TabCommon(
                                            title: "home",
                                            sImage: eSvgAssets.homeColor,
                                            usImage: eSvgAssets.home,
                                            index: 0)
                                        .paddingOnly(
                                            top:
                                                dashboardCtrl.selectedIndex == 0
                                                    ? 5
                                                    : 30),
                                    if (appCtrl
                                        .firebaseConfigModel!.isChatShow!)
                                      TabCommon(
                                              title: "chat",
                                              sImage: eSvgAssets.chatColor,
                                              usImage: eSvgAssets.chat,
                                              index: 1)
                                          .paddingOnly(
                                              top:
                                                  dashboardCtrl.selectedIndex ==
                                                          1
                                                      ? 5
                                                      : 30),
                                    // if (appCtrl.firebaseConfigModel!.isImageGeneratorShow!)
                                    //   TabCommon(
                                    //       title: "image",
                                    //       sImage: eSvgAssets.galleryColor,
                                    //       usImage: eSvgAssets.gallery,
                                    //       index: 2),
                                    // if (appCtrl.firebaseConfigModel!.isTextCompletionShow!)
                                    //   TabCommon(
                                    //       title: "content",
                                    //       sImage: eSvgAssets.contentColor,
                                    //       usImage: eSvgAssets.content,
                                    //       index: 3),
                                    TabCommon(
                                            title: "setting",
                                            sImage: eSvgAssets.settingColor,
                                            usImage: eSvgAssets.setting,
                                            index: 4)
                                        .paddingOnly(
                                            top:
                                                dashboardCtrl.selectedIndex == 4
                                                    ? 5
                                                    : 30)
                                  ]),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )));
    });
  }
}
