import '../../../../config.dart';

class SubscribeTextBox extends StatelessWidget {
  const SubscribeTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatLayoutController>(builder: (chatCtrl) {
      return Column(
        children: [
          if (int.parse(appCtrl.envConfig["chatTextCount"]) != 0)
            Column(
              children: [
                Text(
                    appFonts
                        .thereAreAwardLeft(
                            appCtrl.envConfig["chatTextCount"].toString())
                        .tr,
                    style: AppCss.outfitSemiBold14.textColor(appCtrl.isTheme
                        ? appCtrl.appTheme.lightText
                        : appCtrl.appTheme.txt)),
                const VSpace(Sizes.s10),
              ],
            ),
          if (int.parse(appCtrl.envConfig["chatTextCount"]) == 0)
            LimitOverLayout(onTap: () => appCtrl.showRewardedAd()),
          if (int.parse(appCtrl.envConfig["chatTextCount"]) != 0)
            const ChatLayoutTextBox()
        ],
      );
    });
  }
}
