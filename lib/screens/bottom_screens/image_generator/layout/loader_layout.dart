import '../../../../config.dart';

class LoaderLayout extends StatelessWidget {
  const LoaderLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(eGifAssets.loader, height: Sizes.s80),
              const VSpace(Sizes.s5),
              Text(appFonts.loading.tr,
                      style: AppCss.outfitSemiBold14
                          .textColor(appCtrl.appTheme.txt))
                  .padding(bottom: MediaQuery.of(context).size.height * 0.038)
            ])).decorated(color: appCtrl.appTheme.bg1);
  }
}
