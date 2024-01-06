import 'dart:developer';

import 'package:probot/config.dart';


class ContentWriter extends StatelessWidget {
  final contentCtrl = Get.put(ContentWriterController());

  ContentWriter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContentWriterController>(builder: (_) {
      return Scaffold(
        backgroundColor: appCtrl.appTheme.bg1,
        key: contentCtrl.scaffoldKey,
        drawer: const CommonDrawer(),
        appBar: AppBar(
          leadingWidth: Sizes.s80,
          elevation: 0,
          centerTitle: true,
          // leading: const CommonMenuIcon().inkWell(
          //     onTap: () => contentCtrl.scaffoldKey.currentState!.openDrawer()),
          automaticallyImplyLeading: false,
          backgroundColor:appCtrl.appTheme.bg1,
          title: Text(appFonts.option3.tr,
              style: GoogleFonts.roboto(
                fontSize: 19,
                fontWeight: FontWeight.w100,
              )
                  .textColor(appCtrl.appTheme.sameWhite)),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: contentCtrl.isLoading.value ? Center(child: Image.asset(eGifAssets.loader,height: Sizes.s100,)) : ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentCommonWidget().commonText(appFonts.businessIdea),
                  const VSpace(Sizes.s8),
                  const BusinessIdeaDropDown().authBoxExtension(),
                  const VSpace(Sizes.s15),
                  ContentCommonWidget().commonText(appFonts.topic),
                  const VSpace(Sizes.s8),
                  TextFieldCommon(
                      controller: contentCtrl.contentController,
                      hintText: appFonts.exUiUx,
                      fillColor: appCtrl.appTheme.bg1)
                      .authBoxExtension(),
                  ButtonCommon(
                    borderColor: Colors.white,
                      title: appFonts.generateContent,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if (contentCtrl.contentController.text.isNotEmpty) {
                          contentCtrl.processContentWrite();

                        } else {

                          log("write something");
                        }
                      }).marginSymmetric(vertical: Insets.i40)
                ],
              ).marginAll(Insets.i25),
              if(contentCtrl.htmlData != null)
                const ContentDescription().paddingAll(Insets.i20).decorated(
                    color: appCtrl.appTheme.boxBg,
               //     borderRadius: BorderRadius.circular(AppRadius.r8)
                )
            ],
          ),
        ),
      );
    });
  }
}