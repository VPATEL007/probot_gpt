import 'package:probot/config.dart';

extension ProbotExtensions on Widget {
  //Auth container extension
  Widget authBoxExtension() => Container(child: this).decorated(
      color: appCtrl.appTheme.boxBg,
      boxShadow: [
        BoxShadow(
            color: appCtrl.isTheme
                ? appCtrl.appTheme.trans
                : appCtrl.appTheme.primary.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4)
      ],
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10)),
      border: Border.all(
          color: appCtrl.isTheme
              ? appCtrl.appTheme.trans
              : appCtrl.appTheme.primary.withOpacity(0.1),
          width: 2));

  Widget descriptionOptionBg() =>
      Container(child: this).paddingAll(Insets.i8).decorated(
          color: appCtrl.appTheme.primaryLight,
          borderRadius: BorderRadius.circular(AppRadius.r4));

  Widget subscribeExtension() => Container(child: this).decorated(
          color: appCtrl.appTheme.white,
          borderRadius: BorderRadius.circular(AppRadius.r10),
          border: Border.all(color: appCtrl.appTheme.borderColor),
          boxShadow: [
            BoxShadow(
                color: appCtrl.appTheme.primaryShadow,
                offset: const Offset(0, 10),
                blurRadius: 20)
          ]);
}

removeAllKey(){
  appCtrl.storage.remove(session.envConfig);
  appCtrl.storage.remove(session.isGuestLogin);
  appCtrl.storage.remove(session.selectedCharacter);
  appCtrl.storage.remove(session.isLogin);
  appCtrl.storage.remove(session.isBiometric);
}