import '../../config.dart';

class OnBoardingController extends GetxController {
   PageController pageCtrl = PageController();
  List onBoardingLists = [];
  bool isLastPage = false;
  int selectIndex = 0;

   @override
  void onReady() {
     onBoardingLists = appArray.onBoardingList;
     update();
    // TODO: implement onReady
    super.onReady();
  }
}