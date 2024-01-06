import 'package:flutter_switch/flutter_switch.dart';
import '../../../../config.dart';

class BottomLayout extends StatelessWidget {
  const BottomLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      DottedLine(
          direction: Axis.horizontal,
          lineLength: double.infinity,
          lineThickness: 1,
          dashLength: 3,
          dashColor: appCtrl.appTheme.txt.withOpacity(.2))
          .marginSymmetric(vertical: Insets.i20),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(appFonts.darkTheme.tr,
            style:
            AppCss.outfitMedium16.textColor(Color(0xff47FFF2))),
        FlutterSwitch(
            value: appCtrl.isTheme,
            padding: 4,
            height: Sizes.s20,
            toggleSize: 12,
            toggleColor: const Color(0xff47FFF2),
            activeColor: const Color(0xff47FFF2),
            inactiveColor: const Color(0xff244C58),
            width: Sizes.s32,
            onToggle: (val) {
              appCtrl.isTheme = val;
              appCtrl.update();
              ThemeService().switchTheme(appCtrl.isTheme);
              Get.forceAppUpdate();
            })
      ])
    ]).marginOnly(
        left: Insets.i30, bottom: Insets.i50, right: Insets.i30);
  }
}
