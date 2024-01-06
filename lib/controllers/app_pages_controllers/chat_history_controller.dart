import 'package:probot/config.dart';

class ChatHistoryController extends GetxController {
  List chatHistoryLists = [];
  bool isLongPress = false;
  List selectedIndex = [];
  List selectedData = [];

  @override
  void onReady() {
    chatHistoryLists = appArray.chatHistoryList;
    update();
    super.onReady();
  }
}
