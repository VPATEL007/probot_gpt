import 'package:probot/controllers/app_pages_controllers/privacy_policy_controller.dart';
import '../../../config.dart';
import 'layouts/expansion_tile_common.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  final privacyPolicyCtrl = Get.put(PrivacyPolicyController());

  PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyPolicyController>(builder: (_) {
      return Scaffold(
          backgroundColor: appCtrl.appTheme.bg1,
          appBar: AppAppBarCommon(title: appFonts.privacyTerm),
          body: Column(children: [
            ExpansionTileLayout(title: appFonts.description, widget: [
              const DottedLines(),
              const VSpace(Sizes.s15),
              Text(appFonts.thisPrivacyPolicy,
                  style: AppCss.outfitMedium14
                      .textColor(appCtrl.appTheme.white)
                      .textHeight(1.3))
            ]),
            ExpansionTileLayout(
                title: appFonts.interpretationDefinitions,
                widget: [
                  const DottedLines(),
                  const VSpace(Sizes.s15),
                  Text(appFonts.thisPrivacyPolicy,
                      style: AppCss.outfitMedium14
                          .textColor(appCtrl.appTheme.white)
                          .textHeight(1.3))
                ]),
          ]).paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i25));
    });
  }
}
