import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:probot/screens/app_screens/chat_history_screen/layouts/chat_history.dart';
import '../../../config.dart';
import 'layouts/chat_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatHistoryScreen extends StatelessWidget {
  final chatHistoryCtrl = Get.put(ChatHistoryController());

  ChatHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatHistoryController>(builder: (_) {
      return Scaffold(
          backgroundColor: appCtrl.appTheme.bg1,
          // appBar: ChatHistoryAppBar(
          //     index: chatHistoryCtrl.selectedIndex,
          //     onDeleteTap: () {
          //       FirebaseFirestore.instance
          //           .collection("users")
          //           .doc(FirebaseAuth.instance.currentUser!.uid)
          //           .collection("chats")
          //           .get()
          //           .then((value) {
          //         value.docs.asMap().entries.forEach((element) {
          //           if (chatHistoryCtrl.selectedIndex
          //               .contains(element.value.id)) {
          //             FirebaseFirestore.instance
          //                 .collection("chatHistory")
          //                 .doc(element.value.id)
          //                 .delete()
          //                 .then((value) {
          //               FirebaseFirestore.instance
          //                   .collection("users")
          //                   .doc(FirebaseAuth.instance.currentUser!.uid)
          //                   .collection("chats")
          //                   .doc(element.value.id)
          //                   .delete();
          //               chatHistoryCtrl.selectedIndex.removeWhere(
          //                   (elements) => elements == element.value.id);
          //               chatHistoryCtrl.update();
          //             });
          //           }
          //         });
          //       });
          //       chatHistoryCtrl.update();
          //     }),
          body: appCtrl.isGuestLogin
              ? SafeArea(
                  child: Container(
                    color: appCtrl.appTheme.bg1,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        ...chatHistoryCtrl.chatHistoryLists
                            .asMap()
                            .entries
                            .map((e) => ChatHistory(
                                  data: e.value,
                                  index: e.key,
                                  isLongPress: chatHistoryCtrl.isLongPress,
                                  onLongPressTap: () {
                                    chatHistoryCtrl.isLongPress = true;
                                    log("press: ${chatHistoryCtrl.isLongPress}");
                                    log("index: ${!chatHistoryCtrl.selectedIndex.contains(e.key)}");
                                    if (!chatHistoryCtrl.selectedIndex
                                        .contains(e.key)) {
                                      chatHistoryCtrl.selectedIndex.add(e.key);
                                      log("index2: ${chatHistoryCtrl.selectedIndex}");
                                      chatHistoryCtrl.update();
                                    }
                                    chatHistoryCtrl.update();
                                  },
                                  onTap: () {
                                    Get.offNamed(routeName.chatLayout,
                                        arguments: [e.value['icon'], ""]);
                                    log("message");
                                    if (chatHistoryCtrl.isLongPress) {
                                      if (!chatHistoryCtrl.selectedIndex
                                          .contains(e.key)) {
                                        chatHistoryCtrl.selectedIndex
                                            .add(e.key);
                                        chatHistoryCtrl.update();
                                      } else {
                                        if (chatHistoryCtrl.selectedIndex
                                            .contains(e.key)) {
                                          chatHistoryCtrl.selectedIndex
                                              .remove(e.key);
                                          chatHistoryCtrl.update();
                                        }
                                      }
                                    }

                                    if (chatHistoryCtrl.selectedIndex.isEmpty) {
                                      chatHistoryCtrl.isLongPress == false;
                                      chatHistoryCtrl.update();
                                    }
                                  },
                                ))
                            .toList()
                      ]).paddingSymmetric(
                          vertical: Insets.i25, horizontal: Insets.i20),
                    ),
                  ),
                )
              : StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("chats")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Container();
                    } else if (!snapshot.hasData) {
                      return Center(
                          child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            appCtrl.appTheme.primary),
                      )).height(MediaQuery.of(context).size.height);
                    } else {
                      return snapshot.data!.docs.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(eImageAssets.notification,
                                      height: Sizes.s180),
                                  const VSpace(Sizes.s20),
                                  Text(appFonts.noDataFound.tr,
                                      textAlign: TextAlign.center,
                                      style: AppCss.outfitMedium14.textColor(
                                          appCtrl.appTheme.lightText)),
                                ],
                              ),
                            ).height(MediaQuery.of(context).size.height)
                          : SingleChildScrollView(
                              child: Column(children: [
                                ...snapshot.data!.docs
                                    .asMap()
                                    .entries
                                    .map((e) => ChatHistoryLayout(
                                          data: e.value,
                                          isLongPress:
                                              chatHistoryCtrl.isLongPress,
                                          onLongPressTap: () {
                                            chatHistoryCtrl.isLongPress = true;
                                            log("press: ${chatHistoryCtrl.isLongPress}");
                                            log("index: ${!chatHistoryCtrl.selectedIndex.contains(e.value.id)}");
                                            if (!chatHistoryCtrl.selectedIndex
                                                .contains(e.value.id)) {
                                              chatHistoryCtrl.selectedIndex
                                                  .add(e.value.id);
                                              log("index2: ${chatHistoryCtrl.selectedIndex}");
                                              chatHistoryCtrl.update();
                                            }
                                            chatHistoryCtrl.update();
                                          },
                                          onTap: () {
                                            log("message ${chatHistoryCtrl.isLongPress}");
                                            if (chatHistoryCtrl.isLongPress) {
                                              if (!chatHistoryCtrl.selectedIndex
                                                  .contains(e.value.id)) {
                                                chatHistoryCtrl.selectedIndex
                                                    .add(e.value.id);
                                                chatHistoryCtrl.update();
                                              } else {
                                                if (chatHistoryCtrl
                                                    .selectedIndex
                                                    .contains(e.value.id)) {
                                                  chatHistoryCtrl.selectedIndex
                                                      .remove(e.value.id);
                                                  chatHistoryCtrl.update();
                                                }
                                              }
                                            } else {
                                              log("CH : ${e.value["chatId"]}");
                                              Get.offNamed(routeName.chatLayout,
                                                  arguments: [
                                                    e.value['avatar'],
                                                    "",
                                                    e.value["chatId"]
                                                  ]);
                                              final chatCtrl = Get.isRegistered<
                                                      ChatLayoutController>()
                                                  ? Get.find<
                                                      ChatLayoutController>()
                                                  : Get.put(
                                                      ChatLayoutController());
                                              chatCtrl.getChatId();
                                            }

                                            if (chatHistoryCtrl
                                                .selectedIndex.isEmpty) {
                                              chatHistoryCtrl.isLongPress =
                                                  false;
                                              log("selectIndex: ${chatHistoryCtrl.selectedIndex.isEmpty}");
                                              chatHistoryCtrl.update();
                                              Get.forceAppUpdate();
                                            }
                                          },
                                        ))
                                    .toList()
                              ]).paddingSymmetric(horizontal: Insets.i20),
                            );
                    }
                  }));
    });
  }
}
