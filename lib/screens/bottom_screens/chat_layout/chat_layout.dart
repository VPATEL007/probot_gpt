import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:probot/config.dart';

class ChatLayout extends StatelessWidget {
  final chatCtrl = Get.put(ChatLayoutController());

  ChatLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("image: ${chatCtrl.selectedImage}");
    return GetBuilder<ChatLayoutController>(builder: (_) {
      return DirectionalityRtl(
        child: WillPopScope(
          onWillPop: () async {
            chatCtrl.speechStopMethod();
            chatCtrl.clearData();
            Get.offNamed(routeName.dashboard);

            return true;
          },
          child: Scaffold(
              key: chatCtrl.scaffoldKey,
              // drawer: const CommonDrawer(),

              appBar: ChatScreenAppBar(title: chatCtrl.argumentTitle.value),
              backgroundColor: appCtrl.appTheme.bg1,
              body: SafeArea(
                child: InkWell(
                  onTap: () {
                    chatCtrl.isLongPress = false;
                    chatCtrl.selectedData = [];
                    chatCtrl.selectedIndex = [];

                    chatCtrl.update();
                  },
                  child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification:
                          (OverscrollIndicatorNotification overscroll) {
                        overscroll.disallowIndicator();
                        return true;
                      },
                      child: Container(
                        color: appCtrl.appTheme.bg1,
                        child: Column(
                          children: [
                            Text(
                                "Today, ${DateFormat("hh:mm a").format(DateTime.now())}",
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  color: Colors.white,
                                )).marginOnly(top: Insets.i15),
                            const VSpace(Sizes.s13),
                            Expanded(
                                flex: 5,
                                child:
                                    ChatList(image: chatCtrl.argumentimage())),
                            Container(),
                            const Expanded(flex: 0, child: ChatTextBox()),
                          ],
                        ),
                      )
                      // .backgroundImage(DecorationImage(
                      //     image: AssetImage(appCtrl.isTheme ? chatCtrl.selectedImage["darkImage"] : chatCtrl.selectedImage["image"]),
                      //     fit: BoxFit.fill)),
                      ),
                ),
              )),
        ),
      );
    });
  }
}
