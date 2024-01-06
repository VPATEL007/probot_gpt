import 'dart:convert';
import 'dart:developer';
import '../../config.dart';
import 'package:http/http.dart' as http;

class ImageGeneratorController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List imageSizeLists = [];
  List viewTypeLists = [];
  List imageLists = [];
  List noOfImagesLists = [];
  List imageStyleLists = [];
  List moodLists = [];
  List imageColorLists = [];

  bool isFilter = false, isLoader = false;

  String? imageValue;
  String? viewValue;
  String? noOfImagesValue;
  String? imageStyleValue;
  String? moodValue;
  String? imageColorValue;
  ImageModel? imageGPTModel;
  RxInt count = 0.obs;

  var url = Uri.parse('https://api.openai.com/v1/images/generations');

  final TextEditingController imageTextController = TextEditingController();

  Future getGPTImage(
      {required String imageText, String? size = "256x256"}) async {
    log("imageText: $imageText");
    try {
      int imageCount = int.parse(appCtrl.envConfig["imageCount"].toString());
      if (imageCount == 0) {
        Get.snackbar(appFonts.attention.tr, appFonts.yourImageGenerator.tr);
      } else {
        imageCount = imageCount - 1;
        Get.snackbar(appFonts.generated.tr, appFonts.pleaseWaitFor.tr);
        appCtrl.envConfig["imageCount"] = imageCount.toString();
        appCtrl.storage.write(session.envConfig, appCtrl.envConfig);
        appCtrl.envConfig = appCtrl.storage.read(session.envConfig);
        update();
        var request = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${appCtrl.firebaseConfigModel!.chatGPTKey}',
          },
          body: jsonEncode(
            {
              'prompt': imageText,
              'n': 5,
              "size": size,
            },
          ),
        );
        log(request.body);
        if (request.statusCode == 200) {
          addCountImage();
          imageGPTModel = ImageModel.fromJson(jsonDecode(request.body));
          update();
          Get.forceAppUpdate();
        } else {
          debugPrint(jsonDecode(request.body));
        }
        if (appCtrl.envConfig["imageCount"] != "unlimited") {
          final subscribeCtrl =
              Get.isRegistered<SubscriptionFirebaseController>()
                  ? Get.find<SubscriptionFirebaseController>()
                  : Get.put(SubscriptionFirebaseController());
          await subscribeCtrl.addUpdateFirebaseData();
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  addCountImage() async {
    count.value++;
    // LocalStorage.saveImageCount(count: count.value);
  }

  onTapFilter() {
    isFilter = !isFilter;
    update();
  }

  // on tap method
  onTabMethod() async {
    isLoader = true;
    FocusScope.of(Get.context!).unfocus();
    await getGPTImage(imageText: imageTextController.text.trim());

    isLoader = false;
  }

  @override
  void onReady() {
    imageLists = appArray.imageGeneratorList;
    imageSizeLists = appArray.imageSizeList;
    viewTypeLists = appArray.viewTypeList;

    noOfImagesLists = appArray.noOfImagesList;
    imageStyleLists = appArray.imageStyleList;
    moodLists = appArray.moodList;
    imageColorLists = appArray.imageColorList;

    update();
    // TODO: implement onReady
    super.onReady();
  }
}
