
import '../../../../config.dart';

class PaymentMethodList extends StatelessWidget {
  final dynamic data;
  final int? index;

  const PaymentMethodList({Key? key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(builder: (subscribeCtrl) {
      return Column(
        children: [
          ListTile(
              trailing: CurrencyRadioButton(
                  data: data,
                  selectIndex: subscribeCtrl.selectIndexPayment,
                  index: index
              ),
              contentPadding: EdgeInsets.zero,
              title: Text(data["title"].toString().tr,
                  style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.txt)),
              leading: Image.asset(data["icon"].toString())
                  .paddingSymmetric(
                  vertical: Insets.i11, horizontal: Insets.i11)
                  .decorated(
                  color: const Color.fromRGBO(53, 193, 255, 0.1),
                  shape: BoxShape.circle)
                  .height(Sizes.s40)
                  .width(Sizes.s40),onTap: () {
            subscribeCtrl.selectIndexPayment = index!;
            subscribeCtrl.update();
          }),
          if (index != appArray.paymentMethodList.length - 1)
            const Divider(color: Color.fromRGBO(50, 52, 68, 0.08), height: 0)
                .marginSymmetric(vertical: Insets.i12),
        ],
      ).marginSymmetric(horizontal: Insets.i20);
    });
  }
}
