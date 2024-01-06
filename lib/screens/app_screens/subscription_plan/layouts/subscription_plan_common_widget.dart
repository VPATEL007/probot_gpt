import '../../../../config.dart';

class SubscriptionPlanCommonWidget {
  //dotted line
  Widget dottedLine() => DottedLine(
          direction: Axis.horizontal,
          lineLength: double.infinity,
          lineThickness: 1,
          dashLength: 3,
          dashColor: appCtrl.appTheme.greyLight)
      .marginSymmetric(horizontal: Insets.i15);

  //no of days left text
  Widget noOfDaysLeftText(number) => Text(appFonts.noOfDaysLeft(number),
          style: AppCss.outfitMedium14.textColor(appCtrl.appTheme.redColor))
      .marginSymmetric(horizontal: Insets.i15, vertical: Insets.i15);

  //note
  Widget noteTextWidget() =>
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Note  :",
            style:
                AppCss.outfitSemiBold12.textColor(appCtrl.appTheme.lightText)),
        const HSpace(Sizes.s6),
        Expanded(
            child: Text(
                "*If you choose to upgrade your plan, the remaining images and content will be automatically adjusted to the new plan.",
                style: AppCss.outfitSemiBold12
                    .textColor(appCtrl.appTheme.lightText)
                    .textHeight(1.5)))
      ]);
}
