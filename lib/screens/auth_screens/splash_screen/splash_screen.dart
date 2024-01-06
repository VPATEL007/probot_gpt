
import '../../../config.dart';


class SplashScreen extends StatelessWidget {
  final splashCtrl = Get.put(SplashController());
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) {
        return Scaffold(
          body:  Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
              ).decorated(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(13, 34, 53, 1),
                    Color.fromRGBO(14, 33, 48, 1),
                    Color.fromRGBO(13, 32, 46, 1),
                    Color.fromRGBO(14, 30, 43, 1),
                    Color.fromRGBO(14, 30, 43, 1),
                    Color.fromRGBO(15, 28, 36, 1),
                    Color.fromRGBO(18, 25, 33, 1),
                    Color.fromRGBO(18, 25, 33, 1),
                    Color.fromRGBO(19, 24, 28, 1),
                    Color.fromRGBO(19, 24, 28, 1),
                  ],
                  stops: const [
                    0.0,
                    0.1,
                    0.2,
                    0.3,
                    0.4,
                    0.5,
                    0.6,
                    0.7,
                    0.8,
                    1.0,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Image.asset(eImageAssets.logo,height: 150,width: 150),
                   ],
                 )
            ],
          )
        );
      }
    );
  }
}
