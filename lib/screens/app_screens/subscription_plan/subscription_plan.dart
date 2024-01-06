import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../config.dart';

class SubscriptionPlan extends StatelessWidget {
  final subscribeCtrl = Get.put(SubscriptionController());
  SubscriptionPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0D161F),
        body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("userSubscribe")
                  .where("email", isEqualTo: appCtrl.storage.read("userName"))
                  .limit(1)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  log("DATA : ${snapshot.data!.docs[0].data()}");
                  return StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("subscriptionPlan")
                          .where("type",
                              isEqualTo: snapshot.data!.docs[0]
                                  ["subscriptionType"])
                          .limit(1)
                          .snapshots(),
                      builder: (context, snapshotData) {
                        if (snapshotData.hasData) {
                          SubscribeModel subscribeModel =
                              SubscribeModel.fromJson(
                                  snapshotData.data!.docs[0].data());
                          log("COUNT : ${appCtrl.envConfig}");
                          log("COUNT 1: ${(int.parse(snapshot.data!.docs[0]["imageCount"]))}");
                          return subscribeModel.type != null
                              ? Column(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonSubscribeTitle(
                                            subscribeModel: subscribeModel),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonCircularIndicator(
                                                  percent: double.parse((int
                                                              .parse(snapshot
                                                                      .data!
                                                                      .docs[0][
                                                                  "chatCount"]) /
                                                          int.parse(appCtrl
                                                              .envConfig[
                                                                  "chatTextCount"]
                                                              .toString()) /
                                                          100)
                                                      .toStringAsFixed(2)),
                                                  title:
                                                      "${snapshot.data!.docs[0]["chatCount"]} chat\nremaining"),
                                              CommonCircularIndicator(
                                                  percent: double.parse((int
                                                              .parse(snapshot
                                                                      .data!
                                                                      .docs[0][
                                                                  "imageCount"]) /
                                                          int.parse(appCtrl
                                                              .envConfig[
                                                                  "imageCount"]
                                                              .toString()) /
                                                          100)
                                                      .toStringAsFixed(2)),
                                                  title:
                                                      "${snapshot.data!.docs[0]["imageCount"]} images\nremaining"),
                                              CommonCircularIndicator(
                                                  percent: (int.parse(snapshot
                                                              .data!.docs[0][
                                                          "textCompletionCount"]) /
                                                      int.parse(appCtrl
                                                          .envConfig[
                                                              "textCompletionCount"]
                                                          .toString())),
                                                  title:
                                                      "${snapshot.data!.docs[0]["textCompletionCount"]} topics\nremaining")
                                            ]).marginSymmetric(
                                            horizontal: Insets.i20,
                                            vertical: Insets.i20),
                                        SubscriptionPlanCommonWidget()
                                            .dottedLine(),
                                        SubscriptionPlanCommonWidget()
                                            .noOfDaysLeftText("three"),
                                        ButtonCommon(
                                            onTap: () {},
                                            title: appFonts.renewNow.tr,
                                            margin: Insets.i15,
                                            isGradient: false,
                                            style: AppCss.outfitMedium16
                                                .textColor(
                                                    appCtrl.appTheme.primary),
                                            color: appCtrl.appTheme.trans,
                                            borderColor:
                                                appCtrl.appTheme.primary),
                                        const VSpace(Sizes.s15)
                                      ],
                                    ).subscribeExtension().marginOnly(
                                        top: Insets.i25, bottom: Insets.i15),
                                    SubscriptionPlanCommonWidget()
                                        .noteTextWidget()
                                  ],
                                ).marginSymmetric(horizontal: Insets.i20)
                              : SafeArea(
                                  child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        const Spacer(),
                                        Text(appFonts.restore,
                                            style: AppCss.outfitMedium14
                                                .textColor(Colors.white
                                                    .withOpacity(0.30))
                                                .textHeight(1.3)
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w600))
                                      ],
                                    ).paddingOnly(right: 20, top: 20),
                                    Text('AI CHAT',
                                            style: AppCss.outfitSemiBold22
                                                .textColor(
                                                    appCtrl.appTheme.white))
                                        .paddingOnly(left: 25, top: 20),
                                    const SizedBox(height: 25),
                                    Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: SvgPicture.asset(
                                            eSvgAssets.third,
                                            height: Sizes.s250,
                                            width: 130,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.check_circle,
                                                  size: 20,
                                                  color: Colors.yellow,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "VIP exculasive channel",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.check_circle,
                                                  size: 20,
                                                  color: Colors.yellow,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "Unlimited message",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ).paddingSymmetric(vertical: 10),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.check_circle,
                                                  size: 20,
                                                  color: Colors.yellow,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "Unlock all expert",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.check_circle,
                                                  size: 20,
                                                  color: Colors.yellow,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "Voice chat available",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ).paddingSymmetric(vertical: 10),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.check_circle,
                                                  size: 20,
                                                  color: Colors.yellow,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "Export chat history",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            )
                                          ],
                                        ).paddingOnly(top: 25)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              subscribeCtrl.paymentDialog(
                                                  '6.00', subscribeModel);
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15,
                                                      horizontal: 40),
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff2C2C2C),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Weekly",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "\$6.00",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors
                                                            .yellow.shade600,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              subscribeCtrl.paymentDialog(
                                                  '19.00', subscribeModel);
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15,
                                                      horizontal: 40),
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff2C2C2C),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Monthly",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "\$19.00",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors
                                                            .yellow.shade600,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ).paddingSymmetric(
                                        vertical: 15, horizontal: 20),
                                    GestureDetector(
                                      onTap: () {
                                        subscribeCtrl.paymentDialog(
                                            '139.00', subscribeModel);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 25, horizontal: 20),
                                        decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffFBC9AE),
                                                  Color(0xffE9B293),
                                                  Color(0xffC99C97),
                                                  Color(0xffCCAEBC),
                                                  Color(0xffB396B2),
                                                  Color(0xffA7BEE0),
                                                  Color(0xffA6C9E5),
                                                  Color(0xffA6C9E5),
                                                  Color(0xffB0DFDE),
                                                  Color(0xffCCE9CA),
                                                  Color(0xffE8E6B5),
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Yearly",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "\$139.00",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "Add any URL schemes passed to canLaunchUrl as LSApplicationQueriesSchemes entries in your Info.plist file, otherwise it will return false",
                                      style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ).paddingSymmetric(horizontal: 20),
                                    const Spacer(),
                                  ],
                                ).paddingOnly(left: 10));
                        } else {
                          return Container();
                        }
                      });
                } else {
                  return Container();
                }
              }),
        ));
  }
}
