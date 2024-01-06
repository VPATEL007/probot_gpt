import 'package:probot/config.dart';

class OptionCard extends StatelessWidget {
  final HomeOptionModel? homeOptionModel;
  final Function()? onTap;
  final Function(bool)? onHighlightChanged;
  final bool isSelected;
  const OptionCard(
      {Key? key,
      this.homeOptionModel,
      this.onTap,
      this.onHighlightChanged,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHighlightChanged: onHighlightChanged,
      child: Container(
          constraints: const BoxConstraints(minWidth: 400),
          width: Sizes.s400,
          decoration: BoxDecoration(

              color: isSelected
                  ? const Color(0xff12171A)
                  : const Color(0xff132a3c),
              borderRadius: BorderRadius.circular(AppRadius.r10),
              border: Border.all(
                  color: appCtrl.appTheme.radialGradient.withOpacity(.08),
                  width: 1)),
          padding: const EdgeInsets.only(right: Insets.i15),
          child: Row(
            children: [
              SvgPicture.asset(homeOptionModel!.image.toString(),
                height: Sizes.s165,
                width: 140,
                fit: BoxFit.fitWidth,
              ).paddingOnly(top: 20),
              // SvgPicture.asset(homeOptionModel!.image.toString(),
              //         height: Sizes.s28,
              //         colorFilter: ColorFilter.mode(
              //             appCtrl.appTheme.sameWhite, BlendMode.srcIn))
              //     .paddingAll(Insets.i13)
              //     .decorated(
              //         color: appCtrl.appTheme.primary,
              //         borderRadius: BorderRadius.circular(AppRadius.r8)),
              const HSpace(Sizes.s11),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(homeOptionModel!.title.toString().tr,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )),
                  const VSpace(Sizes.s14),
                  Text(homeOptionModel!.desc.toString().tr,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                      )),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff2A7678)),
                            borderRadius: BorderRadius.circular(25),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff297684),
                                  Color(0xff112B3A),
                                  Color(0xff112B3A),
                                  Color(0xff297684),
                                ]),
                            color: const Color(0xff112B3A)),
                        child: Text(homeOptionModel!.chat.toString().tr,
                            style: AppCss.outfitMedium16
                                .textColor(const Color(0xff7AE3E2))
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15))),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
