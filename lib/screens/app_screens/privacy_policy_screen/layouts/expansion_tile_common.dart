import '../../../../config.dart';

class ExpansionTileLayout extends StatelessWidget {
  final String? title;
  final List<Widget>? widget;
  const ExpansionTileLayout({Key? key, this.title, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Theme(
            data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
                unselectedWidgetColor: appCtrl.appTheme.white,
                indicatorColor: appCtrl.appTheme.txt),
            child: ExpansionTile(
                iconColor: appCtrl.appTheme.white,
                // Text
                title: Row(children: [
                  SvgPicture.asset(eSvgAssets.arrow,
                      color: appCtrl.appTheme.white),
                  const HSpace(Sizes.s10),
                  Text(title!.toString().tr,
                      style: AppCss.outfitSemiBold16
                          .textColor(appCtrl.appTheme.white))
                ]),
                children: [
                  SingleChildScrollView(
                      child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: widget!)
                          .padding(horizontal: Insets.i15, bottom: Insets.i20))
                ]))).authBoxExtension().paddingOnly(bottom: Insets.i20);
  }
}
