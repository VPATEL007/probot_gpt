import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pinput/pinput.dart';

import '../../config.dart';
import '../../screens/auth_screens/mobile_login/layouts/otp_layout.dart';

class MobileLoginController extends GetxController {
  GlobalKey<FormState> mobileGlobalKey = GlobalKey<FormState>();
  GlobalKey<FormState> otpGlobalKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  String? userName;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  onTapOtp() async{
    if (mobileGlobalKey.currentState!.validate()) {

      // Otp Method
      isLoading = true;
      update();
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 ${mobileController.text.toString()}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) async {
          verificationId = verificationId;
          var phoneUser =  FirebaseAuth.instance.currentUser;
          userName = phoneUser?.phoneNumber;
          isLoading = false;
          update();
          appCtrl.storage.write("number",  mobileController.text);
          showDialog(
              barrierDismissible: false,
              context: Get.context!,
              builder: (context) {
                return AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.r14))),
                    backgroundColor: appCtrl.appTheme.white,
                    content: Stack(
                      children: [
                        Stack(alignment: Alignment.topRight, children: [
                          Form(
                            key: otpGlobalKey,
                            child: Column(mainAxisSize: MainAxisSize.min, children: [
                              const VSpace(Sizes.s55),
                              Text(appFonts.weHaveSentTheCode.tr,
                                  textAlign: TextAlign.center,
                                  style: AppCss.outfitMedium16
                                      .textColor(appCtrl.appTheme.txt).textHeight(1.2)),

                              const VSpace(Sizes.s18),
                              // Number
                              Text("“${mobileController.text}“",style: AppCss.outfitSemiBold16
                                  .textColor(appCtrl.appTheme.txt)).paddingSymmetric(horizontal: Insets.i5),
                              const VSpace(Sizes.s25),
                              OtpLayout(
                                  controller: otpController,
                                  validator: (value)=> Validation().otpValidation(value),
                                  onSubmitted: (val) {
                                    otpController.text = val;
                                  },
                                  defaultPinTheme: defaultPinTheme,
                                  errorPinTheme: defaultPinTheme.copyWith(
                                      decoration: BoxDecoration(
                                          color: appCtrl.appTheme.error,
                                          borderRadius: BorderRadius.circular(AppRadius.r5))),
                                  focusedPinTheme: defaultPinTheme.copyWith(
                                      height: Sizes.s48,
                                      width: Sizes.s55,
                                      decoration: defaultPinTheme.decoration!.copyWith(
                                          color: appCtrl.appTheme.textField,
                                          border: Border.all(color: appCtrl.appTheme.primary))
                                  )),
                              const VSpace(Sizes.s25),
                              ButtonCommon(onTap: () async {
                                if (otpGlobalKey.currentState!.validate()) {

                                  try {
                                    isLoading = true;
                                    update();
                                    PhoneAuthCredential credential = PhoneAuthProvider.credential(
                                        verificationId: verificationId, smsCode: otpController.text.toString());
                                    await auth.signInWithCredential(credential);
                                    isLoading = false;
                                    update();
                                    Get.offAllNamed(routeName.selectLanguageScreen);
                                  } catch (e) {
                                    isLoading = false;
                                    update();
                                    snackBarMessengers(message: 'Invalid code');
                                  }
                                }

                              }, title: appFonts.verifyProceed),
                              const VSpace(Sizes.s15),
                              RichText(text: TextSpan(
                                  text: appFonts.dontReciveOtp,
                                  style: AppCss.outfitMedium14.textColor(appCtrl.appTheme.lightText),
                                  children: [
                                    TextSpan(
                                        text: appFonts.resendIt,
                                        style: AppCss.outfitMedium14.textColor(appCtrl.appTheme.primary)
                                    )
                                  ]
                              ))
                            ]).paddingSymmetric(horizontal: Insets.i20,vertical: Insets.i20),
                          ),
                          Column(mainAxisSize: MainAxisSize.min, children: [
                            const VSpace(Sizes.s5),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Title
                                  Text(appFonts.otpVerification,
                                      style: AppCss.outfitSemiBold20
                                          .textColor(appCtrl.appTheme.txt))
                                      .paddingSymmetric(horizontal: Insets.i20),
                                  IconButton(
                                      onPressed: () => Get.back(),
                                      icon: Icon(CupertinoIcons.multiply,
                                          size: Sizes.s20,
                                          color: appCtrl.appTheme.lightText))
                                ]),
                            const VSpace(Sizes.s5),
                            DottedLines(width: MediaQuery.of(context).size.width)
                          ])
                        ]),
                        if(isLoading == true)
                          const Center(child: CircularProgressIndicator())
                      ],
                    ));
              });
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
  }

  final defaultPinTheme =  PinTheme(
      textStyle: AppCss.outfitSemiBold18.textColor(appCtrl.appTheme.txt),
      width: Sizes.s55,
      height: Sizes.s48,
      decoration: BoxDecoration(
          color: appCtrl.appTheme.textField,
          borderRadius: BorderRadius.circular(AppRadius.r5),
          border: Border.all(color: appCtrl.appTheme.trans)
      )
  );

}
