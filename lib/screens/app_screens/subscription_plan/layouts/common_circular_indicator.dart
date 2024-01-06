import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../config.dart';

class CommonCircularIndicator extends StatelessWidget {
  final double? percent;
  final String? title;
  const CommonCircularIndicator({Key? key,this.percent,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      CircularPercentIndicator(
        radius: AppRadius.r28,
        lineWidth: 2.5,
        reverse: true,
        circularStrokeCap: CircularStrokeCap.round,
        percent: percent!,
        center: SvgPicture.asset(
          eSvgAssets.chat,
          colorFilter: ColorFilter.mode(
              appCtrl.appTheme.primary, BlendMode.srcIn),
        ),
        backgroundColor: appCtrl.appTheme.primaryLight1,
        progressColor: appCtrl.appTheme.primary,
      ),
      const VSpace(Sizes.s8),
      Text(
        title.toString().tr,
        textAlign: TextAlign.center,
        style: AppCss.outfitMedium14
            .textColor(appCtrl.appTheme.txt),
      )
    ]);
  }
}
