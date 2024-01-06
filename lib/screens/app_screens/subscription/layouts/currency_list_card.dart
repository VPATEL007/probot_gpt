import 'dart:developer';
import '../../../../config.dart';

class CurrencyListCard extends StatelessWidget {
  final dynamic data;
  final int? index;

  const CurrencyListCard({Key? key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(builder: (subscribeCtrl) {
      return Column(
        children: [
          ListTile(
              trailing: CurrencyRadioButton(
                  data: data,
                  selectIndex: subscribeCtrl.selectIndex,
                  index: index
                 ),
              contentPadding: EdgeInsets.zero,
              title: Text(data["title"].toString().tr,
                  style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.txt)),
              leading: SvgPicture.asset(data["icon"].toString())
                  .paddingSymmetric(
                      vertical: Insets.i12, horizontal: Insets.i15)
                  .decorated(
                      color: const Color.fromRGBO(53, 193, 255, 0.1),
                      shape: BoxShape.circle)
                  .height(Sizes.s40)
                  .width(Sizes.s40), onTap: () async {
            log(" data : $data");
            appCtrl.priceSymbol = data["symbol"].toString();
            subscribeCtrl.selectIndex = index!;
            appCtrl.currency = await appCtrl.storage.read("currency");
            await appCtrl.storage.write("currency", data);
            if (appCtrl.currency != data) {
              appCtrl.currencyVal = double.parse(
                  appCtrl.currency[data["code"]].toString());

              await appCtrl.storage
                  .write("currencyCode", appCtrl.currency);

              appCtrl.update();
              subscribeCtrl.update();

              Get.forceAppUpdate();
            }
            appCtrl.update();
            Get.forceAppUpdate();
            Get.back();
          }),
          if (index != appArray.currencyList.length - 1)
            const Divider(color: Color.fromRGBO(50, 52, 68, 0.08), height: 0)
                .marginSymmetric(vertical: Insets.i12)
        ]
      ).marginSymmetric(horizontal: Insets.i15);
    });
  }
}
