import 'package:pinput/pinput.dart';

import '../../../../config.dart';

class OtpLayout extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final PinTheme? errorPinTheme, defaultPinTheme, focusedPinTheme;
  const OtpLayout({Key? key,this.validator, this.controller, this.onSubmitted,this.defaultPinTheme,this.errorPinTheme,this.focusedPinTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Sizes.s60,
        child: Pinput(
            keyboardType: TextInputType.number,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            length: 6,
            controller: controller,
            focusNode: FocusNode(),
            defaultPinTheme: defaultPinTheme,
            onCompleted: (pin) {},
            focusedPinTheme: focusedPinTheme,
            errorPinTheme: errorPinTheme)
            );
  }
}
