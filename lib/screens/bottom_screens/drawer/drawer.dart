import 'dart:developer';

import '../../../../../config.dart';
import 'layouts/bottom_layout.dart';
import 'layouts/drawer_list_common.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      log("ISCHAT : ${appCtrl.firebaseConfigModel!.isChatHistory!}");
      return Drawer(
          width: Sizes.s223,
          backgroundColor: appCtrl.appTheme.bg1,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Insets.i20),
                  bottomRight: Radius.circular(Insets.i20))),
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Column(children: [
              Image.asset(eImageAssets.proBot).marginOnly(
                  left: Insets.i45,
                  top: Insets.i20,
                  bottom: Insets.i30,
                  right: Insets.i45),
              DottedLine(
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                      lineThickness: 1,
                      dashLength: 3,
                      dashColor: appCtrl.appTheme.txt.withOpacity(.2))
                  .marginSymmetric(horizontal: Insets.i20),
              if (appCtrl.firebaseConfigModel!.isAddShow!)
                const VSpace(Sizes.s15),
              if (appCtrl.firebaseConfigModel!.isAddShow!)
                Stack(alignment: Alignment.centerLeft, children: [
                  Image.asset(eImageAssets.rewardBanner, width: Sizes.s182),
                  Text(appFonts.watchNow.tr,
                          style: AppCss.outfitMedium12
                              .textColor(const Color(0xFFF4A703)))
                      .paddingSymmetric(
                          horizontal: Insets.i15, vertical: Insets.i8)
                      .decorated(
                          color: appCtrl.appTheme.sameWhite,
                          borderRadius: BorderRadius.circular(AppRadius.r4))
                      .paddingOnly(left: Insets.i12)
                ]).
                inkWell(onTap: () => homeCtrl.onTapWatch()),
              ...homeCtrl.drawerList.asMap().entries.map((e) {
                return e.value["title"] == "chatBot"
                    ? appCtrl.firebaseConfigModel!.isChatShow!
                        ? DrawerListCommon(data: e.value, index: e.key)
                        : Container()
                    : e.value["title"] == "chatHistory"
                        ? appCtrl.firebaseConfigModel!.isChatHistory!
                            ? DrawerListCommon(data: e.value, index: e.key)
                            : Container()
                        : e.value["title"] == "option2"
                            ? appCtrl.firebaseConfigModel!.isImageGeneratorShow!
                                ? DrawerListCommon(data: e.value, index: e.key)
                                : Container()
                            : e.value["title"] == "option3"
                                ? appCtrl.firebaseConfigModel!
                                        .isImageGeneratorShow!
                                    ? DrawerListCommon(
                                        data: e.value, index: e.key)
                                    : Container()
                                : DrawerListCommon(data: e.value, index: e.key);
              }).toList()
            ]).paddingSymmetric(vertical: Insets.i30),
            const BottomLayout()
          ]));
    });
  }
}
