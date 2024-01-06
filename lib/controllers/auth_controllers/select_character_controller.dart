import '../../config.dart';

class SelectCharacterController extends GetxController {
  List selectCharacterLists = [];
  PageController pageController = PageController();
  RxInt selectedPageIndex = 0.obs;

  //on character tap
  onCharacterChange(index, data) async {
    appCtrl.selectedCharacter = data;
    appCtrl.characterIndex = index;
    await appCtrl.storage.write(session.selectedCharacter, data);
    await appCtrl.storage.write(session.characterIndex, index);
    await appCtrl.storage.write("character", index);
    await appCtrl.storage.write(session.isCharacter, appCtrl.isCharacter);
    update();
  }

  //continue tap
  onContinue() async {
    appCtrl.isCharacter = true;
    await appCtrl.storage.write(session.isCharacter, appCtrl.isCharacter);
    Get.back();
    update();
  }

  @override
  void onReady() {
    selectCharacterLists = appArray.selectCharacterList;
    update();
    // TODO: implement onReady
    super.onReady();
  }
}
