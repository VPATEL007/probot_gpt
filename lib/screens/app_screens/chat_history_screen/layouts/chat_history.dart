import '../../../../config.dart';

class ChatHistory extends StatelessWidget {
  final dynamic data;
  final GestureLongPressCallback? onLongPressTap;
  final GestureTapCallback? onTap;
  final bool? isLongPress;
  final int? index;

  const ChatHistory(
      {Key? key,
      this.data,
      this.onLongPressTap,
      this.isLongPress = false,
      this.onTap,
      this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatHistoryController>(builder: (chatHistoryCtrl) {
      return Row(children: [
        Stack(alignment: Alignment.bottomRight, children: [
          SizedBox(
              height: Sizes.s44,
              width: Sizes.s50,
              child: Column(children: [
                Image.asset(data["icon"],
                    height: Sizes.s40, width: Sizes.s40, fit: BoxFit.fill)
              ])),
          if (chatHistoryCtrl.selectedIndex.contains(index))
            SvgPicture.asset(eSvgAssets.tick)
        ]),
        const HSpace(Sizes.s10),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(data["title"].toString().tr,
                style: AppCss.outfitMedium14
                    .textColor(appCtrl.appTheme.white)
                    .textHeight(1.2)),
            const VSpace(Sizes.s5),
            Text(data["subtitle"].toString().tr,
                style:
                    AppCss.outfitMedium12.textColor(appCtrl.appTheme.lightText))
          ]),
        )
      ])
          .padding(horizontal: Insets.i15, top: Insets.i15, bottom: Insets.i12)
          .inkWell(onTap: onTap)
          .decorated(
              color: const Color(0xff102A39),
              borderRadius: BorderRadius.circular(AppRadius.r10),
              boxShadow: [
                BoxShadow(
                    color: appCtrl.appTheme.primaryShadow,
                    offset: const Offset(0, 2),
                    blurRadius: 20)
              ],
              border: Border.all(
                  color: appCtrl.appTheme.radialGradient.withOpacity(.08),
                  width: 1.5))
          .paddingOnly(bottom: Insets.i15)
          .onLongPressTap(onLongPress: onLongPressTap);
    });
  }
}
