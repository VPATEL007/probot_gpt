import '../../../../config.dart';

class HomeTopLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  const HomeTopLayout({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: const EdgeInsets.only(top: Insets.i100),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    focalRadius: 1,
                    radius: 1,
                    center: const Alignment(-0.1, 0.1),
                    colors: [
                      appCtrl.appTheme.primary,
                      appCtrl.appTheme.radialGradient
                    ])),
            child: Image.asset(
              eImageAssets.homeAppBar,
            ).paddingSymmetric(
                vertical: Insets.i20, horizontal: Insets.i35)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CommonMenuIcon().inkWell(
                onTap: onTap),
            Image.asset(eImageAssets.logo1, width: Sizes.s106),
            SvgPicture.asset(eSvgAssets.bell)
                .paddingSymmetric(horizontal: Insets.i20)
          ],
        ).paddingSymmetric(vertical: Insets.i55)
      ],
    );
  }
}
