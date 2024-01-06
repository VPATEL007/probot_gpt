// Scaffold Messenger Common
import '../config.dart';

snackBarMessengers({message,color}) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(message.toString().tr,
          style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.sameWhite)),
      backgroundColor: color ?? appCtrl.appTheme.error));
}
