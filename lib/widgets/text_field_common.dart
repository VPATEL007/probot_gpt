import '../config.dart';

class TextFieldCommon extends StatelessWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon, prefixIcon;
  final Color? fillColor;
  final bool obscureText;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final int? maxLength,minLines;

  const TextFieldCommon(
      {Key? key,
      required this.hintText,
      this.validator,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.border,
      this.obscureText = false,
      this.fillColor,
      this.keyboardType,
      this.focusNode,
      this.onChanged,
      this.maxLength,this.minLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Text field common
    return TextFormField(
      style: GoogleFonts.roboto(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.blue,
      ),
   //   AppCss.outfitSemiBold14.textColor(Colors.blue),
      focusNode: focusNode,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        minLines: minLines,
        maxLength: maxLength,
        decoration: InputDecoration(
            fillColor: fillColor ?? appCtrl.appTheme.textField,
            filled: true,
            border:
                const OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(AppRadius.r8)),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none)),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: Insets.i15, vertical: Insets.i10),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintStyle:
                GoogleFonts.roboto(
                  fontSize: 16,
                  color: appCtrl.appTheme.lightText,
                  fontWeight: FontWeight.w100
                ),

          //  AppCss.outfitMedium14.textColor(appCtrl.appTheme.lightText),
            hintText: hintText.tr));
  }
}
