import 'dart:developer';

import '../../../../config.dart';

class Receiver extends StatelessWidget {
  final ChatMessage? chatListModel;
  final int? index;
  final String? image;

  const Receiver({
    Key? key,
    this.chatListModel,
    this.index,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatLayoutController>(builder: (chatCtrl) {
      return Align(
              alignment: Alignment.centerLeft,
              child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    ChatCommonWidget().userImage(image),
                    const HSpace(Sizes.s6),
                    chatListModel!.chatMessageType == ChatMessageType.loading
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Insets.i10,
                            ),
                            decoration: BoxDecoration(
                                color: const Color(0xff20323E),
                                boxShadow: appCtrl.isTheme
                                    ? null
                                    : [
                                        const BoxShadow(
                                            offset: Offset(0, 10),
                                            blurRadius: 20)
                                      ],
                                borderRadius:
                                    BorderRadius.circular(AppRadius.r6)),
                            child: Image.asset(
                              eGifAssets.loading,
                              height: Sizes.s40,
                            ))
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    chatListModel!.text!.length > 40
                                        ? ReceiverWidthText(
                                            text: chatListModel!.text!,
                                            row: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ChatCommonWidget()
                                                    .timeTextLayout(
                                                        chatListModel!.time!
                                                            .toString()),
                                                SvgPicture.asset(
                                                        eSvgAssets.volume)
                                                    .inkWell(onTap: () {
                                                  String code = appCtrl
                                                              .languageVal ==
                                                          "en"
                                                      ? "US"
                                                      : appCtrl.languageVal ==
                                                              "fr"
                                                          ? "CA"
                                                          : appCtrl.languageVal ==
                                                                  "ge"
                                                              ? "GE"
                                                              : appCtrl.languageVal ==
                                                                      "hi"
                                                                  ? "IN"
                                                                  : appCtrl.languageVal ==
                                                                          "it"
                                                                      ? "IT"
                                                                      : appCtrl.languageVal ==
                                                                              "ja"
                                                                          ? "JP"
                                                                          : "US";
                                                  chatCtrl.speechMethod(
                                                      chatListModel!.text!,
                                                      '${appCtrl.languageVal}-$code');
                                                })
                                              ],
                                            ),
                                          )
                                        : ReceiverContent(
                                            text: chatListModel!.text!,
                                            row: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ChatCommonWidget()
                                                    .timeTextLayout(
                                                        chatListModel!.time!
                                                            .toString()),
                                                SvgPicture.asset(
                                                        eSvgAssets.volume)
                                                    .inkWell(onTap: () {
                                                  String code = appCtrl
                                                              .languageVal ==
                                                          "en"
                                                      ? "US"
                                                      : appCtrl.languageVal ==
                                                              "fr"
                                                          ? "CA"
                                                          : appCtrl.languageVal ==
                                                                  "ge"
                                                              ? "GE"
                                                              : appCtrl.languageVal ==
                                                                      "hi"
                                                                  ? "IN"
                                                                  : appCtrl.languageVal ==
                                                                          "it"
                                                                      ? "IT"
                                                                      : appCtrl.languageVal ==
                                                                              "ja"
                                                                          ? "JP"
                                                                          : "US";
                                                  chatCtrl.speechMethod(
                                                      chatListModel!.text!,
                                                      '${appCtrl.languageVal}-$code');
                                                })
                                              ],
                                            ),
                                          ),
                                    const HSpace(Sizes.s5),
                                  ],
                                ),
                                const VSpace(Sizes.s3),
                              ]).inkWell(onTap: () {
                            if (chatCtrl.isLongPress) {
                              if (!chatCtrl.selectedIndex.contains(index)) {
                                chatCtrl.selectedIndex.add(index);
                                chatCtrl.selectedData
                                    .add(chatCtrl.selectedMessages[index!]);
                                chatCtrl.update();
                              } else {
                                if (chatCtrl.selectedIndex.contains(index)) {
                                  chatCtrl.selectedIndex.remove(index);
                                  chatCtrl.selectedData.remove(
                                      chatCtrl.selectedMessages[index!]);
                                  chatCtrl.update();
                                }
                              }
                            }
                          }),
                  ])
                  .marginSymmetric(horizontal: Insets.i20, vertical: Insets.i5))
          .onLongPressTap(onLongPress: () {
        log("chatCtrl.shareMessages[index!] : ${chatCtrl.selectedMessages[index!]}");
        chatCtrl.isLongPress = true;
        if (!chatCtrl.selectedIndex.contains(index)) {
          chatCtrl.selectedIndex.add(index);
          chatCtrl.selectedData.add(chatCtrl.selectedMessages[index!]);
          chatCtrl.update();
        }
      });
    });
  }
}
