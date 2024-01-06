import '../../../../config.dart';

class CountLayout extends StatelessWidget {
  const CountLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              appFonts.chatCountText.tr,
              style:
              AppCss.outfitMedium12.textColor(Colors.white),
              textAlign: TextAlign.center,
            ),
            const VSpace(Sizes.s5),
            Text(appCtrl.envConfig["chatTextCount"],
                style: AppCss.outfitSemiBold16
                    .textColor(Colors.white))
          ],
        ),
        Column(
          children: [
            Text(
              appFonts.imageCount.tr,
              style:
              AppCss.outfitMedium12.textColor(Colors.white),
              textAlign: TextAlign.center,
            ),
            const VSpace(Sizes.s5),
            Text(appCtrl.envConfig["imageCount"],
                style: AppCss.outfitSemiBold16
                    .textColor(Colors.white))
          ],
        ).paddingSymmetric(horizontal: Insets.i25).decorated(
            border: Border(
                left: BorderSide(color: appCtrl.appTheme.lightText),
                right: BorderSide(color: appCtrl.appTheme.lightText))),
        Column(
          children: [
            Text(
              appFonts.textCompletionCount.tr,
              style:
              AppCss.outfitMedium12.textColor(Colors.white),
              textAlign: TextAlign.center,
            ),
            const VSpace(Sizes.s5),
            Text(appCtrl.envConfig["textCompletionCount"],
                style: AppCss.outfitSemiBold16
                    .textColor(Colors.white))
          ],
        )
      ],
    )
        .paddingSymmetric(horizontal: Insets.i12, vertical: Insets.i15)
        .decorated(
        color: const Color(0xff1B2831),
        borderRadius: BorderRadius.circular(AppRadius.r8))
        .paddingSymmetric(horizontal: Insets.i20);
  }
}
