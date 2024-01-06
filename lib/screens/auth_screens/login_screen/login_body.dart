import '../../../config.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IntrinsicHeight(
          child: Row(children: [
            VerticalDivider(
                thickness: 4, width: 1, color: appCtrl.appTheme.bg1)
                .backgroundColor(appCtrl.appTheme.error),
            const HSpace(Sizes.s12),
            SizedBox(
                width: Sizes.s300,
                child: Text(appFonts.fastResponse.tr,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 18
              )
                 //   style: AppCss.outfitSemiBold22
                        .textColor(appCtrl.appTheme.white)
                        .textHeight(1.3)))
          ])),
      const VSpace(Sizes.s20),
      Text(appFonts.aBuddyWhoAvailable.tr,
          style: GoogleFonts.roboto(
            fontSize: 16,
          )
              .textColor(appCtrl.appTheme.lightText)
              .textHeight(1.3)),
      const VSpace(Sizes.s40),
      Row(children: [
        Expanded(
            child: ButtonCommon(
                title: appFonts.signUp,
                onTap: () => Get.toNamed(routeName.signUpScreen))),
        const HSpace(Sizes.s15),
        Expanded(
            child: ButtonCommon(
                title: appFonts.signIn,
                onTap: () => Get.toNamed(routeName.signInScreen)))
      ]),
      const OrLayout(),
      Text(appFonts.continueAsAGuest.tr,
    style: GoogleFonts.roboto(
    fontSize: 16,
      fontWeight: FontWeight.w100,
      color: Colors.white
    ))
      //    style:
        //  AppCss.outfitMedium16.textColor(appCtrl.appTheme.primary))
          .inkWell(onTap: () {
        appCtrl.isLogin = true;
        appCtrl.isGuestLogin = true;
        appCtrl.storage.write(session.isGuestLogin, true);
        appCtrl.storage
            .write(session.selectedCharacter, appArray.selectCharacterList[3]);
        Get.offAllNamed(routeName.dashboard);
        appCtrl.update();
      })
    ]);
  }
}
