import 'dart:ui';
import '../../../config.dart';
import 'layout/filter_layout.dart';
import 'layout/loader_layout.dart';
import 'layout/page_and_grid_view.dart';
import 'layout/top_layout.dart';

class ImageGenerator extends StatelessWidget {
  final imageGeneratorCtrl = Get.put(ImageGeneratorController());

  ImageGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImageGeneratorController>(builder: (_) {
      return Stack(children: [
        Scaffold(
            key: imageGeneratorCtrl.scaffoldKey,
            // drawer: const CommonDrawer()
            resizeToAvoidBottomInset: false,

            appBar: AppBar(
                backgroundColor: appCtrl.appTheme.bg1,
                elevation: 0,
                toolbarHeight: 10,
                centerTitle: true,
                leadingWidth: Sizes.s70,
                // leading: const CommonMenuIcon().inkWell(
                //     onTap: () => imageGeneratorCtrl.scaffoldKey.currentState!.openDrawer()),
                automaticallyImplyLeading: false,
                title: Text(

                    appFonts.nothing.tr,
                    style: TextStyle(fontFamily: 'Roboto',
                      fontSize: 5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,))),
            body: Stack(alignment: Alignment.center, children: [
              Stack(alignment: Alignment.bottomCenter, children: [
                SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: const [
                          TopLayout(),
                          VSpace(Sizes.s20),
                          PageAndGridView()
                        ])
                      ]).paddingSymmetric(
                      horizontal: Insets.i20, vertical: Insets.i20),
                )).height(MediaQuery.of(context).size.height),
                ButtonCommon(
                  title: appFonts.generateImage,
                  onTap: () => imageGeneratorCtrl.imageTextController.text.isNotEmpty ? imageGeneratorCtrl.onTabMethod() : Get.snackbar(appFonts.attention.tr, appFonts.enterTextBoxValue.tr)
                ).paddingOnly(
                    bottom: Insets.i15, right: Insets.i20, left: Insets.i20)
              ]),
              if (imageGeneratorCtrl.isLoader) const LoaderLayout()
            ])),
        if (imageGeneratorCtrl.isFilter)
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(color: appCtrl.appTheme.sameWhite.withOpacity(0.6))),
        if (imageGeneratorCtrl.isFilter) const FilterLayout()
      ]);
    });
  }
}
