


import '../../../../config.dart';

class CurrencyList extends StatelessWidget {
  const CurrencyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(builder: (subscribeCtrl) {
      return Material(
        color: appCtrl.appTheme.trans,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonPopUpTitle(title: appFonts.changeCurrency),
            DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 1,
                dashLength: 3,
                dashColor: appCtrl.appTheme.txt.withOpacity(.1)),
            const VSpace(Sizes.s25),
            ...appArray.currencyList
                .asMap()
                .entries
                .map((e) => CurrencyListCard(index: e.key,data: e.value,))
                .toList(),

            const VSpace(Sizes.s25)
          ],
        )
            .decorated(
                color: appCtrl.appTheme.white,
                borderRadius: BorderRadius.circular(AppRadius.r10))
            .marginSymmetric(horizontal: Insets.i20),
      );
    });
  }
}
