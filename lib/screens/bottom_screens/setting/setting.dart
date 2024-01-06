import 'package:probot/config.dart';
import 'package:probot/screens/bottom_screens/setting/layouts/count_layout.dart';

class Setting extends StatelessWidget {
  final settingCtrl = Get.put(SettingController());
  final homeCtrl = Get.put(HomeController());

  Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (context) {
      return Scaffold(
        key: settingCtrl.scaffoldKey,
        backgroundColor: appCtrl.appTheme.bg1,
        drawer: const CommonDrawer(),
        // appBar: AppBar(
        //     leadingWidth: Sizes.s70,
        //     leading: const CommonMenuIcon().inkWell(
        //         onTap: () =>
        //             settingCtrl.scaffoldKey.currentState!.openDrawer()),
        //     automaticallyImplyLeading: false,
        //     backgroundColor: appCtrl.appTheme.bg1,
        //     title: Text(appFonts.setting.tr,
        //         style: AppCss.outfitExtraBold22
        //             .textColor(appCtrl.appTheme.sameWhite))),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(children: [
            Stack(alignment: Alignment.center, children: [
              Image.asset(eImageAssets.settingBg).marginOnly(
                  top: Insets.i16,
                  left: Insets.i20,
                  right: Insets.i20,
                  bottom: Insets.i20),
              Column(children: [
                Text(
                        settingCtrl.userName != null
                            ? settingCtrl.userName![0]
                            : "A",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ).textColor(appCtrl.appTheme.sameWhite))
                    .paddingSymmetric(
                        horizontal: Insets.i35, vertical: Insets.i30)
                    .decorated(
                        shape: BoxShape.circle, color: appCtrl.appTheme.bg1),
                const VSpace(Sizes.s5),
                //   Text(settingCtrl.userName ?? "Welcome to AskQ",
                //         style: AppCss.outfitMedium14
                //          .textColor(appCtrl.appTheme.lightText))
              ])
            ]),
            //     if (appCtrl.firebaseConfigModel!.isAddShow!)
            //        const VSpace(Sizes.s15),
            //        if (appCtrl.firebaseConfigModel!.isAddShow!)
            //         Stack(alignment: Alignment.centerLeft, children: [
            //          Image.asset(eImageAssets.rewardBanner, width: Sizes.s182),
            //          Text(appFonts.watchNow.tr,
            //             style: AppCss.outfitMedium12
            //                .textColor(const Color(0xFFF4A703)))
            //         .paddingSymmetric(
            //         horizontal: Insets.i15, vertical: Insets.i8)
            //       .decorated(
            //         color: appCtrl.appTheme.sameWhite,
            //        borderRadius: BorderRadius.circular(AppRadius.r4))
            //         .paddingOnly(left: Insets.i12)
            //     ]).
            //      inkWell(onTap: () => homeCtrl.onTapWatch()),
            const VSpace(Sizes.s20),
            if (appCtrl.isGuestLogin || settingCtrl.userName != null)
              const CountLayout(),
            if (appCtrl.isGuestLogin || settingCtrl.userName != null)
              const VSpace(Sizes.s20),

            Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff1B2831),
                        Color(0xff1C272D),
                        Color(0xff1E2329),
                      ]),
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  ...settingCtrl.settingList
                      .asMap()
                      .entries
                      .map((e) => e.value["title"] == "logout"
                          ? appCtrl.isGuestLogin
                              ? Container()
                              : Container(
                                  child: SettingList(
                                          index: e.key, data: e.value)
                                      .marginSymmetric(horizontal: Insets.i20),
                                )
                          : SettingList(index: e.key, data: e.value)
                              .marginSymmetric(horizontal: Insets.i20))
                      .toList()
                ],
              ).paddingOnly(bottom: 25),
            )
          ]).marginOnly(bottom: Insets.i25),
        )),
      );
    });
  }
}
