import 'package:vibration/vibration.dart';

import '../../../../config.dart';

class ChatLayoutTextBox extends StatelessWidget {
  const ChatLayoutTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatLayoutController>(builder: (chatCtrl) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () async {
                Vibration.vibrate(duration: 200);
                chatCtrl.speechToText();
              },
              child: SvgPicture.asset(
                eSvgAssets.mic,
                height: chatCtrl.isListening.value
                    ? chatCtrl.animation!.value
                    : Sizes.s22,
                colorFilter: ColorFilter.mode(
                    chatCtrl.isListening.value
                        ? const Color(0xffA5CAC3)
                        : const Color(0xffA5CAC3),
                    BlendMode.srcIn),
              )).paddingOnly(left: 10),
          Expanded(
            child: TextFieldCommon(
              controller: chatCtrl.chatController,
              hintText: appFonts.typeHere.tr,
              focusNode: chatCtrl.focusNode,
              fillColor:
              appCtrl.isTheme ? appCtrl.appTheme.bg : const Color(0xff23313C),
              minLines: 1,
              prefixIcon: SvgPicture.asset(eSvgAssets.smile)
                  .paddingOnly(left: Insets.i18, right: Insets.i10),
            ).paddingSymmetric(horizontal: 10),

          ),
          SvgPicture.asset(eSvgAssets.send)
              .paddingAll(Insets.i6)
              .inkWell(
              onTap: () => chatCtrl.chatController.text.isNotEmpty
                  ? chatCtrl.processChat()
                  : Get.snackbar(appFonts.attention.tr,
                  appFonts.enterTextBoxValue.tr)).paddingOnly(right: 10),
        ],
      ).paddingSymmetric(vertical: 10);
    });
  }
}
