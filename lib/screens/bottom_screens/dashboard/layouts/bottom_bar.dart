import 'dart:math';
import '../../../../../config.dart';
import 'dashboard_widget.dart';

class BottomNavBarLayout extends StatelessWidget {
  const BottomNavBarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (dashboardCtrl) {
      return dashboardCtrl.bottomList.isNotEmpty
          ? DefaultTabController(
              length: dashboardCtrl.bottomList.length,
              child: DashboardWidget().tabBorderLayout(
                  child: Container(
                      height: Sizes.s58,
                      decoration: BoxDecoration(
                          color: appCtrl.appTheme.boxBg,
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(53, 193, 255, 0.08),
                                blurRadius: 20,
                                offset: Offset(4, -1))
                          ],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(AppRadius.r10),
                              topRight: Radius.circular(AppRadius.r10))),
                      child: TabBar(
                          controller: dashboardCtrl.con,
                          physics: const NeverScrollableScrollPhysics(),
                          isScrollable: false,

                          padding: EdgeInsets.zero,
                          indicatorPadding: EdgeInsets.zero,
                          labelPadding: EdgeInsets.zero,
                          overlayColor:
                              MaterialStateProperty.all(appCtrl.appTheme.white),
                          onTap: (val) => dashboardCtrl.onBottomTap(val),
                          indicator: DashboardWidget().materialIndicator(),
                          tabs: [
                            AnimatedBuilder(
                              animation: dashboardCtrl.animationControllers![0],
                              builder: (BuildContext context, Widget? child) {
                                final child = Tab(
                                  icon: SvgPicture.asset(
                                    dashboardCtrl.selectedIndex == 0
                                        ? eSvgAssets.homeColor
                                        : eSvgAssets.home,
                                    height: Sizes.s20,
                                    width: Sizes.s20,
                                    fit: BoxFit.fill,
                                  ),
                                  iconMargin: const EdgeInsets.only(bottom: Insets.i5),
                                  child: Text("home".tr,
                                      style: AppCss.outfitRegular14.textColor(
                                          dashboardCtrl.selectedIndex == 0
                                              ? appCtrl.appTheme.primary
                                              : appCtrl.appTheme.lightText)),
                                ).width(Sizes.s70);
                                final value = dashboardCtrl.animationControllers![0].value;
                                if (dashboardCtrl.animationControllers![0].status ==
                                    AnimationStatus.forward) {
                                  final angle = sin(4 * pi * value) * pi * 0.2;
                                  return Transform.rotate(angle: angle, child: child);
                                } else {
                                  final dy = sin(2 * pi * value) * 0.2;
                                  return FractionalTranslation(
                                      translation: Offset(0, dy), child: child);
                                }
                              },
                            ),
                            if(appCtrl.firebaseConfigModel!.isChatShow!)
                            AnimatedBuilder(
                              animation: dashboardCtrl.animationControllers![1],
                              builder: (BuildContext context, Widget? child) {
                                final child = Tab(
                                  icon: SvgPicture.asset(
                                    dashboardCtrl.selectedIndex == 1
                                        ? eSvgAssets.chatColor
                                        : eSvgAssets.chat,
                                    height: Sizes.s20,
                                    width: Sizes.s20,
                                    fit: BoxFit.fill,
                                  ),
                                  iconMargin: const EdgeInsets.only(bottom: Insets.i5),
                                  child: Text("chat".tr,
                                      style: AppCss.outfitRegular14.textColor(
                                          dashboardCtrl.selectedIndex == 1
                                              ? appCtrl.appTheme.primary
                                              : appCtrl.appTheme.lightText)),
                                ).width(Sizes.s70);
                                final value = dashboardCtrl.animationControllers![1].value;
                                if (dashboardCtrl.animationControllers![1].status ==
                                    AnimationStatus.forward) {
                                  final angle = sin(4 * pi * value) * pi * 0.2;
                                  return Transform.rotate(angle: angle, child: child);
                                } else {
                                  final dy = sin(2 * pi * value) * 0.2;
                                  return FractionalTranslation(
                                      translation: Offset(0, dy), child: child);
                                }
                              },
                            ),
                            AnimatedBuilder(
                              animation: dashboardCtrl.animationControllers![2],
                              builder: (BuildContext context, Widget? child) {
                                final child = Tab(
                                  icon: SvgPicture.asset(
                                    dashboardCtrl.selectedIndex ==2
                                        ? eSvgAssets.galleryColor
                                        : eSvgAssets.gallery,
                                    height: Sizes.s20,
                                    width: Sizes.s20,
                                    fit: BoxFit.fill,
                                  ),
                                  iconMargin: const EdgeInsets.only(bottom: Insets.i5),
                                  child: Text("image".tr,
                                      style: AppCss.outfitRegular14.textColor(
                                          dashboardCtrl.selectedIndex == 2
                                              ? appCtrl.appTheme.primary
                                              : appCtrl.appTheme.lightText)),
                                ).width(Sizes.s70);
                                final value = dashboardCtrl.animationControllers![2].value;
                                if (dashboardCtrl.animationControllers![2].status ==
                                    AnimationStatus.forward) {
                                  final angle = sin(4 * pi * value) * pi * 0.2;
                                  return Transform.rotate(angle: angle, child: child);
                                } else {
                                  final dy = sin(2 * pi * value) * 0.2;
                                  return FractionalTranslation(
                                      translation: Offset(0, dy), child: child);
                                }
                              },
                            ),
                            AnimatedBuilder(
                              animation: dashboardCtrl.animationControllers![3],
                              builder: (BuildContext context, Widget? child) {
                                final child = Tab(
                                  icon: SvgPicture.asset(
                                    dashboardCtrl.selectedIndex == 3
                                        ? eSvgAssets.contentColor
                                        : eSvgAssets.content,
                                    height: Sizes.s20,
                                    width: Sizes.s20,
                                    fit: BoxFit.fill,
                                  ),
                                  iconMargin: const EdgeInsets.only(bottom: Insets.i5),
                                  child: Text("content".tr,
                                      style: AppCss.outfitRegular14.textColor(
                                          dashboardCtrl.selectedIndex == 3
                                              ? appCtrl.appTheme.primary
                                              : appCtrl.appTheme.lightText)),
                                ).width(Sizes.s70);
                                final value = dashboardCtrl.animationControllers![3].value;
                                if (dashboardCtrl.animationControllers![3].status ==
                                    AnimationStatus.forward) {
                                  final angle = sin(4 * pi * value) * pi * 0.2;
                                  return Transform.rotate(angle: angle, child: child);
                                } else {
                                  final dy = sin(2 * pi * value) * 0.2;
                                  return FractionalTranslation(
                                      translation: Offset(0, dy), child: child);
                                }
                              },
                            ),
                            AnimatedBuilder(
                              animation: dashboardCtrl.animationControllers![4],
                              builder: (BuildContext context, Widget? child) {
                                final child = Tab(
                                  icon: SvgPicture.asset(
                                    dashboardCtrl.selectedIndex == 4
                                        ? eSvgAssets.settingColor
                                        : eSvgAssets.setting,
                                    height: Sizes.s20,
                                    width: Sizes.s20,
                                    fit: BoxFit.fill,
                                  ),
                                  iconMargin: const EdgeInsets.only(bottom: Insets.i5),
                                  child: Text("setting".tr,
                                      style: AppCss.outfitRegular14.textColor(
                                          dashboardCtrl.selectedIndex == 4
                                              ? appCtrl.appTheme.primary
                                              : appCtrl.appTheme.lightText)),
                                ).width(Sizes.s70);
                                final value = dashboardCtrl.animationControllers![4].value;
                                if (dashboardCtrl.animationControllers![4].status ==
                                    AnimationStatus.forward) {
                                  final angle = sin(4 * pi * value) * pi * 0.2;
                                  return Transform.rotate(angle: angle, child: child);
                                } else {
                                  final dy = sin(2 * pi * value) * 0.2;
                                  return FractionalTranslation(
                                      translation: Offset(0, dy), child: child);
                                }
                              },
                            ),
                          ]))),
            )
          : Container();
    });
  }
}
