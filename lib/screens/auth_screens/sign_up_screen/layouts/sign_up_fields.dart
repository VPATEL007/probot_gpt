import '../../../../config.dart';

class SignUpField extends StatelessWidget {
  const SignUpField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpCtrl) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(appFonts.createANewAccount.tr,
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
            controller: signUpCtrl.emailController,
            hintText: appFonts.enterEmail.tr),
        const VSpace(Sizes.s15),
        Text(appFonts.password.tr,
            style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.white)),
        const VSpace(Sizes.s10),
        TextFieldCommon(
            suffixIcon: SvgPicture.asset(
                    signUpCtrl.obscureText
                        ? eSvgAssets.eyeSlash
                        : eSvgAssets.eye,
                    fit: BoxFit.scaleDown)
                .inkWell(onTap: () => signUpCtrl.onObscure()),
            obscureText: signUpCtrl.obscureText,
            validator: (password) => Validation().passValidation(password),
            controller: signUpCtrl.passwordController,
            hintText: appFonts.enterPassword.tr),
        const VSpace(Sizes.s15),
        Text(appFonts.confirmPassword.tr,
            style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.white)),
        const VSpace(Sizes.s10),
        TextFieldCommon(
            suffixIcon: SvgPicture.asset(
                    signUpCtrl.obscureText2
                        ? eSvgAssets.eyeSlash
                        : eSvgAssets.eye,
                    fit: BoxFit.scaleDown)
                .inkWell(onTap: () => signUpCtrl.onObscure2()),
            obscureText: signUpCtrl.obscureText2,
            validator: (cfm) {
              if (signUpCtrl.passwordController.text !=
                  signUpCtrl.confirmPasswordController.text) {
                return appFonts.passwordNotSame.tr;
              }
              if (cfm!.isEmpty) {
                return appFonts.pleaseEnterPassword.tr;
              }
              return null;
            },
            controller: signUpCtrl.confirmPasswordController,
            hintText: appFonts.reEnterPassword.tr),
       //    backgroundColor(Colors.black),
        const VSpace(Sizes.s40),
        ButtonCommon(
            title: appFonts.signUp, onTap: () => signUpCtrl.signUpMethod()),
        const VSpace(Sizes.s15),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          RichText(
              text: TextSpan(
                  text: appFonts.alreadyHaveAnAccount.tr,
                  style: AppCss.outfitMedium16
                      .textColor(appCtrl.appTheme.lightText),
                  children: [
                TextSpan(
                    text: appFonts.signIn.tr,
                    style:
                        AppCss.outfitMedium16.textColor(appCtrl.appTheme.white))
              ])).inkWell(onTap: () => Get.back())
        ])
      ]).paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i25);
    });
  }
}
