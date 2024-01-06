import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:probot/config.dart';

class SubscriptionFirebaseController extends GetxController {
  //subscribe plan
  subscribePlan({SubscribeModel? subscribeModel, paymentMethod}) async {
    DateTime now = DateTime.now();
    DateTime? expiryDate;
    if (subscribeModel!.type == "weekly") {
      expiryDate = DateTime(now.year, now.month, now.day + 7);
    } else if (subscribeModel.type == "monthly") {
      expiryDate = DateTime(now.year, now.month + 1, now.day);
    } else {
      expiryDate = DateTime(now.year + 1, now.month, now.day);
    }
    log("EXPIER : $expiryDate");
    log("subscribeModel : #$subscribeModel");
    String? userName;
    userName = appCtrl.storage.read("userName");
    int id = DateTime.now().millisecondsSinceEpoch;
    log("appCtrl.envConfig: ${appCtrl.envConfig}");
    String count = "";
    if (subscribeModel.type! == "yearly") {
      count = "unlimited";
    } else {
      int chatCount = int.parse(appCtrl.envConfig["chatTextCount"].toString());
      count = (chatCount + int.parse(subscribeModel.chatCount!)).toString();
    }
    await FirebaseFirestore.instance
        .collection("userSubscribe")
        .where("email", isEqualTo: appCtrl.storage.read("userName"))
        .limit(1)
        .get()
        .then((value) async {
      if (value.docs.isEmpty) {
        await FirebaseFirestore.instance
            .collection("userSubscribe")
            .doc(id.toString())
            .set({
          "email": userName,
          "subscriptionType": subscribeModel.type,
          "isExpiry": false,
          "createdDate": DateTime.now().millisecondsSinceEpoch,
          "expiryDate": expiryDate,
          "price": subscribeModel.price!,
          "chatCount": count.toString(),
          "imageCount": subscribeModel.imageCount.toString(),
          "paymentMethod": paymentMethod,
          "textCompletionCount": subscribeModel.textCompletionCount.toString(),
        }).then((value) {
          if (subscribeModel.type! == "yearly") {
            log("appCtrl.envConfig: ${appCtrl.envConfig}");
            appCtrl.envConfig["chatTextCount"] = count;
            appCtrl.envConfig["imageCount"] = subscribeModel.imageCount;
            appCtrl.envConfig["textCompletionCount"] =
                subscribeModel.textCompletionCount;
            appCtrl.storage.write(session.envConfig, appCtrl.envConfig);
            appCtrl.envConfig = appCtrl.storage.read(session.envConfig);
            Get.back();
            Get.back();
          } else {
            log("appCtrl.envConfig: ${appCtrl.envConfig}");
            appCtrl.envConfig["chatTextCount"] = count;
            appCtrl.envConfig["imageCount"] = subscribeModel.imageCount;
            appCtrl.envConfig["textCompletionCount"] =
                subscribeModel.textCompletionCount;
            appCtrl.storage.write(session.envConfig, appCtrl.envConfig);
            appCtrl.envConfig = appCtrl.storage.read(session.envConfig);
            Get.back();
            Get.back();
            Get.toNamed(routeName.subscriptionPlan);
          }
        });
      } else {
        await FirebaseFirestore.instance
            .collection("userSubscribe")
            .doc(value.docs[0].id)
            .update({
          "email": userName,
          "subscriptionType": subscribeModel.type,
          "isExpiry": false,
          "createdDate": DateTime.now().millisecondsSinceEpoch,
          "expiryDate": expiryDate,
          "price": subscribeModel.price!,
          "chatCount": count.toString(),
          "imageCount": subscribeModel.imageCount.toString(),
          "paymentMethod": paymentMethod,
          "textCompletionCount": subscribeModel.textCompletionCount.toString(),
        }).then((value) {
          if (subscribeModel.type! == "yearly") {
            log("appCtrl.envConfig: ${appCtrl.envConfig}");
            appCtrl.envConfig["chatTextCount"] = count;
            appCtrl.envConfig["imageCount"] = subscribeModel.imageCount;
            appCtrl.envConfig["textCompletionCount"] =
                subscribeModel.textCompletionCount;
            appCtrl.storage.write(session.envConfig, appCtrl.envConfig);
            appCtrl.envConfig = appCtrl.storage.read(session.envConfig);
            Get.back();
            Get.back();
          } else {
            log("appCtrl.envConfig: ${appCtrl.envConfig}");
            appCtrl.envConfig["chatTextCount"] = count;
            appCtrl.envConfig["imageCount"] = subscribeModel.imageCount;
            appCtrl.envConfig["textCompletionCount"] =
                subscribeModel.textCompletionCount;
            appCtrl.storage.write(session.envConfig, appCtrl.envConfig);
            appCtrl.envConfig = appCtrl.storage.read(session.envConfig);
            Get.back();
            Get.back();
            Get.toNamed(routeName.subscriptionPlan);
          }
        });
      }
    });
  }

  // add or update firebase data
  addUpdateFirebaseData() {
    FirebaseFirestore.instance
        .collection("userSubscribe")
        .where("email", isEqualTo: appCtrl.storage.read("userName"))
        .limit(1)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        FirebaseFirestore.instance
            .collection("userSubscribe")
            .doc(value.docs[0].id)
            .update({
          "chatCount": appCtrl.envConfig["chatTextCount"],
          "imageCount": appCtrl.envConfig["imageCount"],
          "textCompletionCount": appCtrl.envConfig["textCompletionCount"],
        }).then((value) async {
          await FirebaseFirestore.instance
              .collection("userSubscribe")
              .where("email", isEqualTo: appCtrl.storage.read("userName"))
              .limit(1)
              .get()
              .then((value) {
            if (value.docs.isNotEmpty) {
              appCtrl.envConfig["chatTextCount"] =
                  value.docs[0].data()["chatCount"];
              appCtrl.envConfig["imageCount"] =
                  value.docs[0].data()["imageCount"];
              appCtrl.envConfig["textCompletionCount"] =
                  value.docs[0].data()["textCompletionCount"];
              appCtrl.storage.write(session.envConfig, appCtrl.envConfig);
              appCtrl.envConfig = appCtrl.storage.read(session.envConfig);
            }
          });
        });
      }
    });
  }
}
