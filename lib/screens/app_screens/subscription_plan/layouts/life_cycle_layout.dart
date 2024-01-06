import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../config.dart';

class LifeCycleLayout extends StatelessWidget {
  const LifeCycleLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(children: [
        CircularPercentIndicator(
            radius: AppRadius.r28,
            lineWidth: 2.5,
            reverse: true,
            circularStrokeCap: CircularStrokeCap.round,
            percent: 1,
            center: SvgPicture.asset(eSvgAssets.chat,
                colorFilter: ColorFilter.mode(
                    appCtrl.appTheme.primary, BlendMode.srcIn)),
            backgroundColor: appCtrl.appTheme.primaryLight1,
            progressColor: appCtrl.appTheme.primary),
        const VSpace(Sizes.s8),
        Text("Unlimited\nchat",
            textAlign: TextAlign.center,
            style: AppCss.outfitMedium14.textColor(appCtrl.appTheme.txt))
      ]),
      Column(children: [
        CircularPercentIndicator(
            radius: AppRadius.r28,
            lineWidth: 2.5,
            reverse: true,
            circularStrokeCap: CircularStrokeCap.round,
            percent: 0.7,
            center: SvgPicture.asset(eSvgAssets.gallery,
                colorFilter: ColorFilter.mode(
                    appCtrl.appTheme.primary, BlendMode.srcIn)),
            backgroundColor: appCtrl.appTheme.primaryLight1,
            progressColor: appCtrl.appTheme.primary),
        const VSpace(Sizes.s8),
        Text("18 images\nremaining",
            textAlign: TextAlign.center,
            style: AppCss.outfitMedium14.textColor(appCtrl.appTheme.txt))
      ]),
      Column(children: [
        CircularPercentIndicator(
            radius: AppRadius.r28,
            lineWidth: 3.0,
            reverse: true,
            circularStrokeCap: CircularStrokeCap.round,
            percent: .5,
            center: SvgPicture.asset(eSvgAssets.content,
                colorFilter: ColorFilter.mode(
                    appCtrl.appTheme.primary, BlendMode.srcIn)),
            backgroundColor: appCtrl.appTheme.primaryLight1,
            progressColor: appCtrl.appTheme.primary),
        const VSpace(Sizes.s8),
        Text("10 topics\nremaining",
            textAlign: TextAlign.center,
            style: AppCss.outfitMedium14.textColor(appCtrl.appTheme.txt))
      ])
    ]).marginSymmetric(horizontal: Insets.i20, vertical: Insets.i20);
  }
}
