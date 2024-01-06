import '../../../../config.dart';

class LimitOverLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  const LimitOverLayout({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: Sizes.s150,
          child: Column(
            children: [
              SizedBox(
                child: SizedBox(
                  width: double.infinity,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: appFonts.youHitTheMessage.tr,
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        fontWeight: FontWeight.w100,
                      )
                          .textColor(appCtrl.appTheme.white)
                          .textHeight(1.3),
                      children: [
                        TextSpan(
                          text: appFonts.clickBelow.tr,
                        style: GoogleFonts.roboto(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        )
                        //  style: AppCss.outfitSemiBold14
                      //        .textColor(appCtrl.appTheme.error)
                      //        .textHeight(1.3),
                     //
                      ),
                        TextSpan(
                          text: appFonts.toGet.tr,
                         // style: AppCss.outfitMedium14
                   //           .textColor(appCtrl.appTheme.error)
                     //         .textHeight(1.3),
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            )
                        ),
                        TextSpan(
                          text: appFonts.reward.tr,
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                            )

                     //     style: AppCss.outfitSemiBold14
                   //           .textColor(appCtrl.appTheme.error)
                   //           .textHeight(1.3),
                        ),
                        TextSpan(
                          text: appFonts.orSelect.tr,
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            )
                      //    style: AppCss.outfitMedium14
                       //       .textColor(appCtrl.appTheme.error)
                  //            .textHeight(1.3),
                        ),
                      ],
                    ),
                  ),
                ),
              )
                  .padding(
                horizontal: Insets.i15,
                top: Insets.i12,
                bottom: Insets.i25,
              )
                  .decorated(
                color: appCtrl.appTheme.error.withOpacity(0.15),
                borderRadius:
                const BorderRadius.all(Radius.circular(AppRadius.r8)),
              ),
    //          SizedBox(
              //           width: MediaQuery.of(context).size.width * 0.33,
    //           child: Row(
    //              mainAxisAlignment: MainAxisAlignment.center,
    //              children: [
    //                SvgPicture.asset(eSvgAssets.play),
                    //                Text(
    //                  appFonts.watchVideo.tr,
    //                 style: GoogleFonts.roboto(
    //                   fontSize: 11,
    //                    fontWeight: FontWeight.w700,
    //                 )
    //                     .textColor(appCtrl.appTheme.sameWhite),
    //                ),
    //             ],
    //            )
    //                .paddingSymmetric(
    //              horizontal: Insets.i15,
    //            vertical: Insets.i8,
    //          )
    //               .inkWell(onTap: onTap)
    //               .decorated(
    //             color: appCtrl.appTheme.error,
    //            borderRadius:
    //            const BorderRadius.all(Radius.circular(AppRadius.r4)),
    //          ),
                //          ),
    //        ],
    //      ),
     //   ),
        SizedBox(
          height: Sizes.s50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Subscription()),
              );
            },
            child: Text(
              appFonts.subscribe.tr,
              style: AppCss.outfitSemiBold14
                  .textColor(appCtrl.appTheme.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: appCtrl.appTheme.linerGradiant,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.r10),
              ),
            ),
          ),
        ),
      ],
    )
              .paddingOnly(bottom: Insets.i5)
    )]);
  }
}
