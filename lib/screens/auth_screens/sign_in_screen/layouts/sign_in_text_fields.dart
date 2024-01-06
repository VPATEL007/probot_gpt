import 'dart:io';

import 'package:probot/widgets/common_social_login.dart';

import '../../../../config.dart';

class SignInTextField extends StatelessWidget {
  const SignInTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (signInCtrl) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(appFonts.welcomeBack.tr,
            style: AppCss.outfitSemiBold22.textColor(appCtrl.appTheme.white)),
        const VSpace(Sizes.s10),
        Text(appFonts.fillTheBelow.tr,
            style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.lightText)),
        const DottedLines().paddingOnly(top: Insets.i20, bottom: Insets.i15),
        Text(appFonts.email.tr,
            style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.white)),
        const VSpace(Sizes.s10),
        TextFieldCommon(
            validator: (email) => Validation().emailValidation(email),
            controller: signInCtrl.emailController,
            hintText: appFonts.enterEmail.tr),
        const VSpace(Sizes.s15),
        Text(appFonts.password.tr,
            style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.white)),
        const VSpace(Sizes.s10),
        TextFieldCommon(
            suffixIcon: SvgPicture.asset(
              signInCtrl.obscureText ? eSvgAssets.eyeSlash : eSvgAssets.eye,
              fit: BoxFit.scaleDown,
            ).inkWell(onTap: () => signInCtrl.onObscure()),
            obscureText: signInCtrl.obscureText,
            validator: (password) => Validation().passValidation(password),
            controller: signInCtrl.passwordController,
            hintText: appFonts.enterPassword.tr),
        const VSpace(Sizes.s10),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(appFonts.resetPassword.tr,
                  style:
                      AppCss.outfitMedium14.textColor(appCtrl.appTheme.primary))
              .inkWell(onTap: () => Get.toNamed(routeName.restPasswordScreen))
        ]),
        const VSpace(Sizes.s40),
        ButtonCommon(
            title: appFonts.signIn, onTap: () => signInCtrl.signInMethod()),
        const VSpace(Sizes.s15),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(
                      text: appFonts.dontHaveAnAccount.tr,
                      style: AppCss.outfitMedium16
                          .textColor(appCtrl.appTheme.lightText),
                      children: [
                    TextSpan(
                        text: appFonts.signUp.tr,
                        style: AppCss.outfitMedium16
                            .textColor(appCtrl.appTheme.white))
                  ])).inkWell(onTap: () => Get.to(const SignUpScreen()))
            ]),
        const OrLayout().alignment(Alignment.center),

             Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonSocialLogin(
                      image: eSvgAssets.google,
                      name: appFonts.google,
                      onTap: () => signInCtrl.signInWithGoogle()),
                  CommonSocialLogin(
                      image: eSvgAssets.mobile,
                      name: appFonts.phone  ,
                      onTap: () => Get.toNamed(routeName.mobileLogin)),
                  if(Platform.isIOS)
                  CommonSocialLogin(
                      image: eSvgAssets.apple,
                      name: appFonts.apple,
                      onTap: () => signInCtrl.signInWithApple()),
                ],
              )

      ])
          .paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i25)
          .authBoxExtension();
    });
  }
}
