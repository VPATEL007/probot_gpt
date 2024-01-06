
import '../../../config.dart';

class AllTextForm extends StatelessWidget {
  const AllTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<MyAccountController>(
      builder: (myAccountCtrl) {
        return SizedBox(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(appFonts.firstName.tr,
                      style: AppCss.outfitMedium16
                          .textColor(appCtrl.appTheme.white)),
                  const VSpace(Sizes.s10),
                  TextFieldCommon(
                      validator: (name) => Validation().emailValidation(name),
                      controller: myAccountCtrl.firstNameController,
                      hintText: appFonts.enterFirstName.tr),
                  const VSpace(Sizes.s15),
                  Text(appFonts.phone.tr,
                      style: AppCss.outfitMedium16
                          .textColor(appCtrl.appTheme.white)),
                  const VSpace(Sizes.s10),
                  TextFieldCommon(
                      validator: (name) => Validation().phoneValidation(name),
                      controller: myAccountCtrl.numberController,
                      hintText: appFonts.enterPhoneNo.tr),
                  const VSpace(Sizes.s15),
                  Text(appFonts.email.tr,
                      style: AppCss.outfitMedium16
                          .textColor(appCtrl.appTheme.white)),
                  const VSpace(Sizes.s10),
                  TextFieldCommon(
                      validator: (email) => Validation().emailValidation(email),
                      controller: myAccountCtrl.emailController,
                      hintText: appFonts.enterEmailName.tr),
                  const VSpace(Sizes.s40),
                  ButtonCommon(title: appFonts.update)
                ]));
      }
    );
  }
}
