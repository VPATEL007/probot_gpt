import 'dart:developer';
import 'dart:io';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:probot/screens/app_screens/subscription/layouts/payment_method_list.dart';
import '../../../../config.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

import '../../../../controllers/common_controllers/in_app_controller.dart';

class PaymentList extends StatelessWidget {
  final String? data;
  final SubscribeModel? subscribe;

  const PaymentList({Key? key, this.data, this.subscribe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(builder: (subscribeCtrl) {
      return Material(
          color: appCtrl.appTheme.trans,
          child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                CommonPopUpTitle(title: appFonts.payMoneyFrom.tr),
                DottedLine(
                    direction: Axis.horizontal,
                    lineLength: double.infinity,
                    lineThickness: 1,
                    dashLength: 3,
                    dashColor: appCtrl.appTheme.txt.withOpacity(.1)),
                const VSpace(Sizes.s25),
                (appCtrl.firebaseConfigModel!.isPaypal! == false &&
                        appCtrl.firebaseConfigModel!.isRazorPay! == false &&
                        appCtrl.firebaseConfigModel!.isStripe! == false)
                    ? Text(appFonts.noPaymentMethod.tr,
                            style: AppCss.outfitSemiBold16
                                .textColor(appCtrl.appTheme.error))
                        .paddingSymmetric(horizontal: Insets.i20)
                    : Column(
                        children:
                            appArray.paymentMethodList.asMap().entries.map((e) {
                        return e.value["title"] == "payPal"
                            ? appCtrl.firebaseConfigModel!.isPaypal!
                                ? PaymentMethodList(index: e.key, data: e.value)
                                : Container()
                            : e.value["title"] == "razor"
                                ? appCtrl.firebaseConfigModel!.isRazorPay!
                                    ? PaymentMethodList(
                                        index: e.key, data: e.value)
                                    : Container()
                                : e.value["title"] == "stripe"
                                    ? appCtrl.firebaseConfigModel!.isStripe!
                                        ? PaymentMethodList(
                                            index: e.key, data: e.value)
                                        : Container()
                                    : e.value["title"] == "inApp"
                                        ? appCtrl.firebaseConfigModel!.isStripe!
                                            ? PaymentMethodList(
                                                index: e.key, data: e.value)
                                            : Container()
                                        : Container();
                      }).toList()),
                const VSpace(Sizes.s35),
                (appCtrl.firebaseConfigModel!.isPaypal! == false &&
                        appCtrl.firebaseConfigModel!.isRazorPay! == false &&
                        appCtrl.firebaseConfigModel!.isStripe! == false)
                    ? Container()
                    : Row(children: [
                        Expanded(
                            child: ButtonCommon(
                                onTap: () {
                                  Get.back();
                                },
                                title: appFonts.cancel,
                                isGradient: false,
                                style: AppCss.outfitMedium16
                                    .textColor(appCtrl.appTheme.primary),
                                color: appCtrl.appTheme.trans,
                                borderColor: appCtrl.appTheme.primary)),
                        const HSpace(Sizes.s15),
                        Expanded(
                            child: ButtonCommon(
                                onTap: () {
                                  if (subscribeCtrl.selectIndexPayment == 0) {
                                    subscribeCtrl.onPaypalPayment(
                                        amount: data!, subscribe: subscribe);
                                    Get.back();
                                  } else if (subscribeCtrl.selectIndexPayment ==
                                      1) {
                                    subscribeCtrl.stripePayment(
                                        amount: data!,
                                        currency: 'INR',
                                        subscribe: subscribe);
                                    Get.back();
                                  } else if (subscribeCtrl.selectIndexPayment ==
                                      2) {
                                    subscribeCtrl.openSession(
                                        subscribe: subscribe);
                                    Get.back();
                                  } else if (subscribeCtrl.selectIndexPayment ==
                                      3) {
                                    log("DATA : ${inAppCtrl.products}");

                                    late PurchaseParam purchaseParam;
                                    final Map<String, PurchaseDetails>
                                        purchases = Map<String,
                                                PurchaseDetails>.fromEntries(
                                            inAppCtrl.purchases.map(
                                                (PurchaseDetails purchase) {
                                      if (purchase.pendingCompletePurchase) {
                                        inAppCtrl.inAppPurchase
                                            .completePurchase(purchase);
                                      }
                                      log("_purchases : ${inAppCtrl.purchases}");
                                      return MapEntry<String, PurchaseDetails>(
                                          purchase.productID, purchase);
                                    }));
                                    if (Platform.isAndroid) {
                                      // NOTE: If you are making a subscription purchase/upgrade/downgrade, we recommend you to
                                      // verify the latest status of you your subscription by using server side receipt validation
                                      // and update the UI accordingly. The subscription purchase status shown
                                      // inside the app may not be accurate.
                                      final GooglePlayPurchaseDetails?
                                          oldSubscription = _getOldSubscription(
                                              subscribe!.type == "weekly"
                                                  ? inAppCtrl.products[1]
                                                  : subscribe!.type == "monthly"
                                                      ? inAppCtrl.products[0]
                                                      : inAppCtrl.products[2],
                                              purchases);

                                      purchaseParam = GooglePlayPurchaseParam(
                                          productDetails:
                                              subscribe!.type == "weekly"
                                                  ? inAppCtrl.products[1]
                                                  : subscribe!.type == "monthly"
                                                      ? inAppCtrl.products[0]
                                                      : inAppCtrl.products[2],
                                          changeSubscriptionParam:
                                              (oldSubscription != null)
                                                  ? ChangeSubscriptionParam(
                                                      oldPurchaseDetails:
                                                          oldSubscription,
                                                    )
                                                  : null);
                                    } else {
                                      purchaseParam = PurchaseParam(
                                          productDetails:
                                              subscribe!.type == "weekly"
                                                  ? inAppCtrl.products[1]
                                                  : subscribe!.type == "monthly"
                                                      ? inAppCtrl.products[0]
                                                      : inAppCtrl.products[2]);

                                      log("IOS : $purchaseParam");
                                    }

                                    String id = subscribe!.type == "weekly"
                                        ? inAppCtrl.products[1].id
                                        : subscribe!.type == "monthly"
                                            ? inAppCtrl.products[0].id
                                            : inAppCtrl.products[2].id;

                                    if (id == kConsumableId) {
                                      inAppCtrl.inAppPurchase.buyConsumable(
                                          purchaseParam: purchaseParam,
                                          autoConsume: kAutoConsume);
                                    } else {
                                      inAppCtrl.inAppPurchase.buyNonConsumable(
                                          purchaseParam: purchaseParam);
                                    }
                                  }
                                },
                                title: appFonts.apply))
                      ]).marginSymmetric(horizontal: Insets.i15),
                const VSpace(Sizes.s25)
              ])
              .decorated(
                  color: appCtrl.appTheme.white,
                  borderRadius: BorderRadius.circular(AppRadius.r10))
              .marginSymmetric(horizontal: Insets.i20));
    });
  }

  GooglePlayPurchaseDetails? _getOldSubscription(
      ProductDetails productDetails, Map<String, PurchaseDetails> purchases) {
    GooglePlayPurchaseDetails? oldSubscription;
    return oldSubscription;
  }
}
