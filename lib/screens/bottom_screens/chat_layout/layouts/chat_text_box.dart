import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../config.dart';

class ChatTextBox extends StatelessWidget {
  const ChatTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatLayoutController>(builder: (chatCtrl) {
      return GetBuilder<AppController>(builder: (appCtrl) {
        return Container(
          color: Colors.black,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("userSubscribe")
                  .where("email", isEqualTo: appCtrl.storage.read("userName"))
                  .limit(1)
                  .snapshots(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  if (snapShot.data!.docs.isNotEmpty) {
                    return UnlimitedSubscribeTextBox(snapShot: snapShot);
                  } else {
                    return const SubscribeTextBox();
                  }
                } else {
                  return const SubscribeTextBox();
                }
              }),
        );
      });
    });
  }
}
