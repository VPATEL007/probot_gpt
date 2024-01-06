import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../config.dart';

class ChatScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  const ChatScreenAppBar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatLayoutController>(builder: (chatCtrl) {
      return AppBar(
          toolbarHeight: 80,
          titleSpacing: 0,
          elevation: 0,
          leading: const Icon(Icons.arrow_left_sharp,
                  size: 42, color: Color(0xffCAF8EF))
              .inkWell(onTap: () {
            Get.back();
            chatCtrl.clearData();
          }),
          // leading: SvgPicture.asset(
          //   eSvgAssets.leftArrow,
          //   fit: BoxFit.scaleDown,
          //   colorFilter:
          //       ColorFilter.mode(appCtrl.appTheme.sameWhite, BlendMode.srcIn),
          // ).inkWell(onTap: () {
          //   Get.back();
          //   chatCtrl.clearData();
          // }),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff0d2235),
          actions: [
            chatCtrl.isLongPress
                ? Row(
                    children: [
                      chatCtrl.selectedIndex.length > 1
                          ? Container()
                          : ChatCommonWidget()
                              .commonSvgIcon(eSvgAssets.rotate)
                              .inkWell(onTap: () {
                              chatCtrl.chatController.text =
                                  chatCtrl.selectedData[0];
                              chatCtrl.processChat();
                            }),
                      const HSpace(Sizes.s17),
                      ChatCommonWidget().commonSvgIcon(eSvgAssets.copy).inkWell(
                          onTap: () {
                        Clipboard.setData(ClipboardData(
                            text: chatCtrl.selectedData.toString()));
                      }),
                      const HSpace(Sizes.s17),
                      ChatCommonWidget()
                          .commonSvgIcon(eSvgAssets.share)
                          .inkWell(onTap: () {
                        Share.share(chatCtrl.selectedData.toString(),
                            subject: "I'm sharing Conversation with ASKQ");
                      }),
                      const HSpace(Sizes.s17),
                    ],
                  )
                : const MoreOption()
          ],
          title: Text(
              title?.isNotEmpty ?? false
                  ? title.toString()
                  : appCtrl.selectedCharacter["title"].toString().tr,
              style: AppCss.outfitExtraBold22
                  .textColor(appCtrl.appTheme.sameWhite)
                  .copyWith(
                fontSize: 15,
                color: const Color(0xffffffff),
                shadows: [
                  const Shadow(
                    blurRadius: 5.0,
                    color: Color(0xff11AEAC),
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              )));
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
