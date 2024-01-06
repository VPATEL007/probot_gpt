

import '../config.dart';

class CommonSubscribeTitle extends StatelessWidget {
  final SubscribeModel? subscribeModel;
  const CommonSubscribeTitle({Key? key,this.subscribeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(subscribeModel!.type == "weekly" ? eSvgAssets.star1  : subscribeModel!.type == "monthly" ?eSvgAssets.crown  : eSvgAssets.medal),
        const HSpace(Sizes.s8),
        RichText(
            text: TextSpan(
                text: "${subscribeModel!.planName!.tr.toUpperCase()} / ",
                style: AppCss.outfitSemiBold14
                    .textColor(appCtrl.appTheme.primary),
                children: <TextSpan>[
                  TextSpan(
                      text: subscribeModel!.type!.tr.toUpperCase(),
                      style: AppCss.outfitMedium14
                          .textColor(appCtrl.appTheme.primary)),
                ]))
      ],
    ).paddingSymmetric(vertical: Insets.i15).decorated(
        color: const Color.fromRGBO(53, 193, 255, 0.2),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(AppRadius.r10),
            topLeft: Radius.circular(AppRadius.r10)));
  }
}
