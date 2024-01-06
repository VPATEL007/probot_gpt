import '../../../../config.dart';

class LoginImageLayout extends StatelessWidget {
  const LoginImageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      SizedBox(
              height: Sizes.s450,
              width: double.infinity,
              child: Image.asset(eImageAssets.bg1, fit: BoxFit.cover))
          .decorated(
              gradient: RadialGradient(
                  focalRadius: 1,
                  radius: 1,
                  colors: [
                    appCtrl.appTheme.primary,
                    appCtrl.appTheme.radialGradient
                  ],
                  center: const Alignment(-0.1, 0.1))),
      Image.asset(eImageAssets.loginBot, width: Sizes.s335)
          .paddingOnly(bottom: Insets.i35)
    ]);
  }
}
