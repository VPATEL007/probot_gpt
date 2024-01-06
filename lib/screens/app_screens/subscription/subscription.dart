import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../config.dart';

class Subscription extends StatelessWidget {
  final subscribeCtrl = Get.put(SubscriptionController());

  Subscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(builder: (_) {
      return Scaffold(
          backgroundColor: appCtrl.appTheme.bg1,
          // appBar: AppAppBarCommon(
          //   title: appFonts.subscriptionPlan,
          //   actionIcon: eSvgAssets.currency,
          //   isAction: true,
          //   leadingOnTap: () => Get.back(),
          //   actionOnTap: () => subscribeCtrl.currencyListDialog(),
          // ),
          body: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("subscriptionPlan")
                      .orderBy("price", descending: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Container();
                    } else if (!snapshot.hasData) {
                      return Center(
                          child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            appCtrl.appTheme.primary),
                      )).height(MediaQuery.of(context).size.height);
                    } else {
                      log("has : ${snapshot.data!.docs}");
                      SubscribeModel subscribe = SubscribeModel.fromJson(
                          snapshot.data?.docs.first.data()
                              as Map<String, dynamic>);

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Text(appFonts.restore,
                                  style: AppCss.outfitMedium14
                                      .textColor(Colors.white.withOpacity(0.30))
                                      .textHeight(1.3)
                                      .copyWith(fontWeight: FontWeight.w600))
                            ],
                          ).paddingOnly(right: 20, top: 20),
                          Text('AI Chat',
                              style: AppCss.outfitSemiBold22
                                  .textColor(const Color(0xffA8BD87))
                                  .copyWith(shadows: [
                                const Shadow(
                                  color: Color(0xffA8BD87),
                                  blurRadius: 10,
                                  offset: Offset(0, 1),
                                )
                              ])).paddingOnly(left: 25, top: 20),
                          SizedBox(height: Get.height * 0.04),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: SvgPicture.asset(
                                  eSvgAssets.third,
                                  height: Get.height * 0.41,
                                  width: Get.width * 0.50,
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
                                            fontWeight: FontWeight.w600),
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
                                            fontWeight: FontWeight.w600),
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
                                            fontWeight: FontWeight.w600),
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
                                            fontWeight: FontWeight.w600),
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
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  )
                                ],
                              ).paddingOnly(top: Get.height * 0.03)
                            ],
                          ),
                          SizedBox(height: Get.height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    subscribeCtrl.paymentDialog(
                                        (SubscribeModel.fromJson(
                                                snapshot.data?.docs[0].data()
                                                    as Map<String, dynamic>))
                                            .price,
                                        subscribe);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Get.height * 0.03,
                                        horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: const Color(0xff2C2C2C),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Text(
                                          (SubscribeModel.fromJson(
                                                  snapshot.data?.docs[0].data()
                                                      as Map<String, dynamic>))
                                              .type
                                              .toString()
                                              .toUpperCase(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "\$${double.parse(SubscribeModel.fromJson(snapshot.data?.docs[0].data() as Map<String, dynamic>).price.toString()).toStringAsFixed(2)}",
                                          style: GoogleFonts.poppins(
                                              color: Colors.yellow.shade600,
                                              fontWeight: FontWeight.bold),
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
                                        (SubscribeModel.fromJson(
                                                snapshot.data?.docs[1].data()
                                                    as Map<String, dynamic>))
                                            .price,
                                        subscribe);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Get.height * 0.03,
                                        horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: const Color(0xff2C2C2C),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Text(
                                          (SubscribeModel.fromJson(
                                                  snapshot.data?.docs[1].data()
                                                      as Map<String, dynamic>))
                                              .type
                                              .toString()
                                              .toUpperCase(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "\$${double.parse(SubscribeModel.fromJson(snapshot.data?.docs[1].data() as Map<String, dynamic>).price.toString()).toStringAsFixed(2)}",
                                          style: GoogleFonts.poppins(
                                              color: Colors.yellow.shade600,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ).paddingSymmetric(
                              vertical: Get.height * 0.02, horizontal: 20),
                          GestureDetector(
                            onTap: () {
                              subscribeCtrl.paymentDialog(
                                  (SubscribeModel.fromJson(
                                          snapshot.data?.docs[2].data()
                                              as Map<String, dynamic>))
                                      .price,
                                  subscribe);
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: EdgeInsets.symmetric(
                                  vertical: Get.height * 0.03, horizontal: 20),
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
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Text(
                                    (SubscribeModel.fromJson(
                                            snapshot.data?.docs[2].data()
                                                as Map<String, dynamic>))
                                        .type
                                        .toString()
                                        .toUpperCase(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "\$${double.parse(SubscribeModel.fromJson(snapshot.data?.docs[2].data() as Map<String, dynamic>).price.toString()).toStringAsFixed(2)}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
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
                      );
                      // .subscribeExtension()
                      // .marginOnly(bottom: Insets.i20);
                    }
                  })
              .marginOnly(
                  top: Insets.i20, bottom: Insets.i20, left: Insets.i20));
    });
  }
}
