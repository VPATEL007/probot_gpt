import '../../../config.dart';

class SelectCharacterScreen extends StatefulWidget {
  const SelectCharacterScreen({Key? key}) : super(key: key);

  @override
  State<SelectCharacterScreen> createState() => _SelectCharacterScreenState();
}

class _SelectCharacterScreenState extends State<SelectCharacterScreen> {
  final selectCharacterCtrl = Get.put(SelectCharacterController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectCharacterController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leadingWidth: MediaQuery.of(context).size.width,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('AI CHAT',
                    style: AppCss.outfitSemiBold22
                        .textColor(appCtrl.appTheme.white)),
                const Spacer(),
                Image.asset(
                  'assets/images/gift.png',
                  width: 35,
                  height: 30,
                )
              ],
            ).paddingSymmetric(horizontal: 25),
          ),
          // appBar: const AppBarCommon(isSystemNavigate: true),
          body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.03),
                  SizedBox(
                    height: Get.height * 0.60,
                    child: PageView.builder(
                        controller: selectCharacterCtrl.pageController,
                        itemCount: appArray.selectCharacterList.length,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (value) {
                          selectCharacterCtrl.selectedPageIndex(value);
                        },
                        itemBuilder: (context, index) => Column(
                              children: [
                                CustomPaint(
                                  painter: customStyleArrow(),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    child: Text(
                                        "${appArray.selectCharacterList[index]['title']}",
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        )),
                                  ),
                                ).paddingSymmetric(
                                    horizontal: Get.width * 0.10),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.45,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    Positioned(
                                      left: 10,
                                      right: 40,
                                      top: 0,
                                      bottom: 0,
                                      child: SvgPicture.asset(
                                        '${appArray.selectCharacterList[index]['image']}',
                                        height: Get.height * 0.45,
                                        width: 190,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      top: Sizes.s120,
                                      left: 0,
                                      child: InkWell(
                                        onTap: () {
                                          selectCharacterCtrl.pageController
                                              .previousPage(
                                                  duration: const Duration(
                                                      milliseconds: 200),
                                                  curve: Curves.bounceIn);
                                        },
                                        child: const Icon(
                                          Icons.arrow_left_sharp,
                                          shadows: <Shadow>[
                                            Shadow(
                                                offset: Offset(0, 3),
                                                color: Color(0xffB6FBFF),
                                                blurRadius: 20.0),
                                          ],
                                          size: 70,
                                          color: Color(0xffB6FBFF),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: Sizes.s120,
                                      right: 0,
                                      child: InkWell(
                                        onTap: () {
                                          selectCharacterCtrl.pageController
                                              .nextPage(
                                                  duration: const Duration(
                                                      milliseconds: 200),
                                                  curve: Curves.bounceIn);
                                        },
                                        child: const Icon(
                                          Icons.arrow_right_sharp,
                                          shadows: <Shadow>[
                                            Shadow(
                                                offset: Offset(0, 3),
                                                color: Color(0xffB6FBFF),
                                                blurRadius: 25.0),
                                          ],
                                          size: 70,
                                          color: Color(0xffB6FBFF),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )),
                  ),
                  Align(
                    child: GestureDetector(
                      onTap: () {
                        Get.offNamed(routeName.chatLayout, arguments: [
                          appArray.selectCharacterList[
                              selectCharacterCtrl.selectedPageIndex()]['image'],
                          appArray.selectCharacterList[
                              selectCharacterCtrl.selectedPageIndex()]['title'],
                          '1515125'
                        ]);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff2A7678)),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: appCtrl.appTheme.white,
                                  offset: const Offset(0, 0),
                                  blurRadius: 15,
                                  spreadRadius: -12,
                                )
                              ],
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff297684),
                                    Color(0xff101D26),
                                    Color(0xff112B3A),
                                    Color(0xff297684),
                                  ]),
                              color: const Color(0xff112B3A)),
                          child: Column(
                            children: [
                              Text(appFonts.chatnow.toUpperCase(),
                                  style: AppCss.outfitMedium16
                                      .textColor(const Color(0xff7AE3E2))
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text('Free message this week: 0',
                                  style: AppCss.outfitMedium16
                                      .textColor(const Color(0xff7AE3E2))
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12)),
                            ],
                          )),
                    ),
                  ).paddingOnly(bottom: Get.height * 0.12)
                ]).paddingOnly(
                // top: Insets.i15,
                ),
          ));
    });
  }
}

class customStyleArrow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xff233340)
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    const double triangleH = 10;
    final double triangleW = 25.0;
    final double width = size.width;
    final double height = size.height;

    final Path trianglePath = Path()
      ..moveTo(40, height)
      ..lineTo(48, 20 + height - 5)
      ..lineTo(60, height)
      ..lineTo(width / 2 - triangleW / 2, height);
    canvas.drawPath(trianglePath, paint);
    final BorderRadius borderRadius = BorderRadius.circular(15);
    final Rect rect = Rect.fromLTRB(0, 0, width, height);
    final RRect outer = borderRadius.toRRect(rect);
    canvas.drawRRect(outer, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
