import '../../../../config.dart';

class UserLayout extends StatelessWidget {
  final dynamic data;
  const UserLayout({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SvgPicture.asset(data["icon"],
              height: Sizes.s20,
              width: Sizes.s20,
              colorFilter:
                  ColorFilter.mode(appCtrl.appTheme.txt, BlendMode.srcIn))
          .paddingAll(Insets.i10)
          .decorated(color: const Color(0xffC0D9DA), shape: BoxShape.circle),
      const HSpace(Sizes.s12),
      Text(data["title"].toString().tr,
          style: AppCss.outfitMedium16.textColor(const Color(0xffC0D9DA)))
    ]);
  }
}
