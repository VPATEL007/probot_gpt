import 'package:flutter_switch/flutter_switch.dart';

import '../../../../config.dart';

class CommonSwitcher extends StatelessWidget {
  final int? index;

  const CommonSwitcher({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        padding: 3,
        height: Sizes.s20,
        toggleSize: 14,
        toggleColor: const Color(0xff47FFF2),
        activeColor: const Color(0xff47FFF2),
        inactiveColor: const Color(0xff244C58),
        width: Sizes.s36,
        value: appCtrl.isRTL,
        onToggle: (val) {
          appCtrl.isRTL = !appCtrl.isRTL;
          appCtrl.update();
          Get.forceAppUpdate();
        });
  }
}
