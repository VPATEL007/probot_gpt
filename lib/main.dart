import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:probot/controllers/common_controllers/in_app_controller.dart';
import 'common/languages/index.dart';
import 'config.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: const Color(0xff12171A), // navigation bar color
    statusBarColor: appCtrl.appTheme.main, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(InAppController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    lockScreenPortrait();
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("config").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            appCtrl.firebaseConfigModel =
                FirebaseConfigModel.fromJson(snapshot.data!.docs[0].data());
            Stripe.publishableKey =
                appCtrl.firebaseConfigModel!.stripePublishKey!;
            appCtrl.storage
                .write(session.firebaseConfig, snapshot.data!.docs[0].data());
            appCtrl.update();
          }
          return GetMaterialApp(
              themeMode: ThemeService().theme,
              theme: AppTheme.fromType(ThemeType.light).themeData,
              darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
              locale: const Locale('en', 'US'),
              translations: Language(),
              fallbackLocale: const Locale('en', 'US'),
              home: SplashScreen(),
              getPages: appRoute.getPages,
              debugShowCheckedModeBanner: false);
        });
  }

  lockScreenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
