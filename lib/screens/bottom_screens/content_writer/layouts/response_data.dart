
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../../config.dart';

class ResponseData extends StatelessWidget {
  const ResponseData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContentWriterController>(
      builder: (contentCtrl) {
        return RawScrollbar(
          controller: contentCtrl.scrollController,
          trackColor: appCtrl.appTheme.bg1,
          thumbColor: appCtrl.appTheme.linerGradiant,
        radius: const Radius.circular(AppRadius.r10),
    //      thickness: 3,
          child: ListView(
              controller: contentCtrl.scrollController,
              padding: EdgeInsets.zero,
              children: [
                HtmlWidget(
                  contentCtrl.htmlData,
                  textStyle: GoogleFonts.roboto(
                    fontWeight: FontWeight.w100,
                    fontSize: 19,


                  )
                      .textColor(appCtrl.appTheme.white)
                      .textHeight(1.5),
                ).paddingOnly(top:10, bottom: 80, right: 10,left: 10).decorated(
                    color: appCtrl.appTheme.bg1,
                    borderRadius: BorderRadius.circular(AppRadius.r6)),
              ]).height(contentCtrl.htmlData.length > 450
              ? Sizes.s450
              : contentCtrl.htmlData.length > 300
              ? Sizes.s280
              : Sizes.s200),
        );
      }
  //        .marginOnly(bottom: Insets.i150)
   // ).marginSymmetric(horizontal: Sizes.s5
    );
  }
}
