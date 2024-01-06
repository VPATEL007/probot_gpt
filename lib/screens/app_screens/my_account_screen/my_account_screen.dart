import 'package:probot/config.dart';

class MyAccountScreen extends StatelessWidget {
  final myAccountCtrl = Get.put(MyAccountController());

  MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyAccountController>(builder: (_) {
      return Scaffold(
          appBar: AppAppBarCommon(
              title: appFonts.myAccount, leadingOnTap: () => Get.back()),
          body: SingleChildScrollView(
            child: Column(children: [
              const VSpace(Sizes.s10),
              Stack(alignment: Alignment.bottomRight, children: [
                Text(
                       myAccountCtrl.userName != null
                                ? myAccountCtrl.userName![0]
                            : "S",
                        style: AppCss.outfitExtraBold40
                            .textColor(appCtrl.appTheme.sameWhite))
                    .paddingAll(Insets.i40)
                    .decorated(
                        shape: BoxShape.circle, color: Color(0xff47FFF2)),
                SvgPicture.asset(eSvgAssets.camera, fit: BoxFit.scaleDown)
                    .paddingAll(Insets.i8)
                    .decorated(
                        shape: BoxShape.circle,
                        color: appCtrl.appTheme.sameWhite,
                        border: Border.all(
                            width: 2,
                            color: appCtrl.appTheme.primary.withOpacity(0.1)))
                    .paddingOnly(bottom: Insets.i8)
              ]),
              const VSpace(Sizes.s15),

              const AllTextForm()
                  .paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i25)
                  .decorated(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1B2831),
                    Color(0xff1C272D),
                    Color(0xff1E2329),
                  ]),),


            ])
                .paddingSymmetric(horizontal: Insets.i20)
                .alignment(Alignment.center),
          ));
    });
  }
}
