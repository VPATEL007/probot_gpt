import '../../../../config.dart';

class TabCommon extends StatelessWidget {
  final int? index;
  final String? title, sImage, usImage;

  const TabCommon({Key? key, this.title, this.index, this.sImage, this.usImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (dashboardCtrl) {
      return Column(children: [
        SvgPicture.asset(
            dashboardCtrl.selectedIndex == index ? sImage! : usImage!,
            color: dashboardCtrl.selectedIndex == index
                ? const Color(0xff47FFF2)
                : null,
            height:
                dashboardCtrl.selectedIndex == index ? Sizes.s55 : Sizes.s35,
            width: dashboardCtrl.selectedIndex == index ? Sizes.s14 : Sizes.s20,
            fit: BoxFit.fill),
        const VSpace(Sizes.s5),
        Text(dashboardCtrl.selectedIndex == index ? title!.toString().tr : '',
            style: dashboardCtrl.selectedIndex == index
                ? AppCss.outfitRegular14.textColor(const Color(0xff47FFF2))
                : AppCss.outfitRegular13.textColor(appCtrl.appTheme.lightText)),
        const VSpace(Sizes.s10),
      ]).inkWell(onTap: () => dashboardCtrl.onBottomTap(index));
    });
  }
}
