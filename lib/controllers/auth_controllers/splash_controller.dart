import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:probot/config.dart';

import '../../env.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {

    appCtrl.update();
    bool isLoginSave = appCtrl.storage.read(session.isLogin) ?? false;
    bool isGuestLogin = appCtrl.storage.read(session.isGuestLogin) ?? false;
    bool isBiometricSave = appCtrl.storage.read(session.isBiometric) ?? false;
    bool isLanguageSaved = appCtrl.storage.read(session.isLanguage) ?? false;
    bool isCharacterSaved = appCtrl.storage.read(session.isCharacter) ?? false;
    appCtrl.isCharacter = isCharacterSaved;
    appCtrl.isLanguage = isLanguageSaved;
    appCtrl.isBiometric = isBiometricSave;
    appCtrl.isLogin = isLoginSave;
    appCtrl.selectedCharacter =
        appCtrl.storage.read(session.selectedCharacter) ??
            appArray.selectCharacterList[3];
    appCtrl.characterIndex = appCtrl.storage.read(session.characterIndex) ?? 3;
    log("isBiometricSave: $isBiometricSave");
    log("isLoginSave: $isLoginSave");
    // Language Save
    Locale? locale = const Locale("en", "US");

    // Theme Save
    bool isTheme = appCtrl.storage.read(session.isDarkMode) ?? false;
    ThemeService().switchTheme(isTheme);
    appCtrl.isTheme = isTheme;

    var language = await appCtrl.storage.read(session.locale) ?? "en";
    log("language ; $language");
    if (language != null) {
      appCtrl.languageVal = language;
      if (language == "en") {
        locale = const Locale("en", "US");
      } else if (language == "hi") {
        locale = const Locale("hi", "IN");
      }
      else if (language == "ar") {
        locale = const Locale("ar", "AR");
      } else if (language == "it") {
        locale = const Locale("it", "IT");
      } else if (language == "fr") {
        locale = const Locale("fr", "CA");
      } else if (language == "ge") {
        locale = const Locale("ge", "GE");
      }
      else if (language == "so") {
        locale = const Locale("so", "SO");
      } else if (language == "ja") {
        locale = const Locale("ja", "JP");
      }
    } else {
      locale = const Locale("en", "US");
    }

    Get.updateLocale(locale);
    appCtrl.update();
    Get.forceAppUpdate();

    bool onBoard = appCtrl.storage.read("isOnboard") ?? false;
    var name = appCtrl.storage.read("name");
    var userName = appCtrl.storage.read("userName");
    var firebaseUser = appCtrl.storage.read("firebaseUser");
    var number = appCtrl.storage.read("number");
    log("number : $number");
    appCtrl.isOnboard = onBoard;
    appCtrl.envConfig = appCtrl.storage.read(session.envConfig) ?? environment;

    dynamic selectedImage = appCtrl.storage.read("backgroundImage")?? appArray.backgroundList[0];
    appCtrl.storage.write("backgroundImage", selectedImage);

    log("SPLASH BG : $selectedImage");

    if (!appCtrl.isGuestLogin && userName != null) {
      await FirebaseFirestore.instance
          .collection("userSubscribe")
          .where("email", isEqualTo: appCtrl.storage.read("userName"))
          .limit(1)
          .get()
          .then((value) {
        log("DATA : ${value.docs.isEmpty}");
        if (value.docs.isNotEmpty) {
          appCtrl.envConfig["chatTextCount"] =
          value.docs[0].data()["chatCount"];
          appCtrl.envConfig["imageCount"] = value.docs[0].data()["imageCount"];
          appCtrl.envConfig["textCompletionCount"] =
          value.docs[0].data()["textCompletionCount"];
          appCtrl.storage.write(session.envConfig, appCtrl.envConfig);
          appCtrl.envConfig = appCtrl.storage.read(session.envConfig);
        } else {
          appCtrl.envConfig =
              appCtrl.storage.read(session.envConfig) ?? environment;
        }
      });
    } else {
      appCtrl.storage.write(session.envConfig, appCtrl.envConfig);
      appCtrl.envConfig = appCtrl.storage.read(session.envConfig);
    }

    Future.delayed(const Duration(seconds: 3), () {
      if (onBoard) {
        if (isGuestLogin) {
          appCtrl.isGuestLogin = isGuestLogin;
          appCtrl.storage.write(session.isGuestLogin, isGuestLogin);
          Get.toNamed(routeName.dashboard);
        } else {
          appCtrl.isGuestLogin = false;
          appCtrl.storage.write(session.isGuestLogin, false);

          if (isLoginSave) {
            if (isBiometricSave) {
              Get.offAllNamed(routeName.addFingerprintScreen);
            } else {
              Get.toNamed(routeName.dashboard);
            }
          } else {
            if (name != null || userName != null || firebaseUser != null || number != null) {
              if (isLanguageSaved) {
                if (isBiometricSave) {
                  Get.offAllNamed(routeName.addFingerprintScreen);
                } else {
                  Get.toNamed(routeName.dashboard);
                }
              } else {
                Get.toNamed(routeName.selectLanguageScreen);
              }
            } else {
              Get.toNamed(routeName.loginScreen);
            }
          }
        }
      } else {
        Get.toNamed(routeName.onBoardingScreen);
      }
      update();
    });
  }
}
