import 'dart:core';
import 'dart:developer';
import 'package:probot/screens/app_screens/subscription/layouts/paypal_services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../config.dart';


class PaypalPayment extends StatefulWidget {
  final SubscribeModel? subscribe;
 const PaypalPayment({Key? key,this.subscribe}) : super(key: key);

  @override
  State<PaypalPayment> createState() => _PaypalPaymentState();

}

class _PaypalPaymentState extends State<PaypalPayment> {


  PaypalServices services = PaypalServices();

  late WebViewController controller;


  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(subscribeCtrl.checkoutUrl!))
      ..setNavigationDelegate(
          NavigationDelegate(onNavigationRequest: (NavigationRequest request) {

        log("Request: $request");
        if (request.url.contains(subscribeCtrl.returnURL)) {
          final uri = Uri.parse(request.url);
          log("URI: $uri");

          final payerID = uri.queryParameters['PayerID'];
          log("payerID: $payerID");
          if (payerID != null) {
            services
                .executePayment(subscribeCtrl.executeUrl, payerID,
                subscribeCtrl.accessToken)
                .then((id) {
                  log("Pay Id: $id");
              showDialog(
                  barrierDismissible: false,
                  context: Get.context!, builder: (context) {
                return AlertDialogCommon(
                    image: eImageAssets.paymentSuccess,
                    bText1: appFonts.okay,
                    title: appFonts.paymentSuccess,
                    subtext: appFonts.congratulation,
                    b1OnTap: ()async{
                      final firebaseCtrl =
                      Get.isRegistered<SubscriptionFirebaseController>()
                          ? Get.find<SubscriptionFirebaseController>()
                          : Get.put(SubscriptionFirebaseController());
                      firebaseCtrl.subscribePlan(subscribeModel: widget.subscribe,paymentMethod: "payPal");
                    },
                    crossOnTap: ()=> Get.back()
                );
              });
            });
            Get.back();
          } else {
            showDialog(
                barrierDismissible: false,
                context: Get.context!, builder: (context) {
              return AlertDialogCommon(
                  image: eImageAssets.paymentFailed,
                  bText1: appFonts.tryAgain,
                  title: appFonts.paymentFailed,
                  subtext: appFonts.oppsDueTo,
                  b1OnTap: ()=> Get.back(),
                  crossOnTap: ()=> Get.back()
              );
            });
          }
        } else {
          log("Something went wrong");
        }
        if (request.url.contains(subscribeCtrl.cancelURL)) {
          Get.back();
        }
        return NavigationDecision.navigate;
      }));
    setState(() {});
  }
  final subscribeCtrl = Get.put(SubscriptionController());


  @override
  Widget build(BuildContext context) {
    if (subscribeCtrl.checkoutUrl != null) {
      return GetBuilder<SubscriptionController>(builder: (context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: appCtrl.appTheme.primary,
                leading: const BackButton()),
            // Start payment process
            body: WebViewWidget(controller: controller));
      });
    } else {
      return Scaffold(
          key: subscribeCtrl.scaffoldKey,
          appBar: AppBar(
              leading: const BackButton(),
              backgroundColor: appCtrl.appTheme.white,
              elevation: 0.0),
          body: const Center(child: CircularProgressIndicator()));
    }
  }
}
