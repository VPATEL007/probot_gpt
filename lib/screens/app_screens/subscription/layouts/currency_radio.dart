
import '../../../../config.dart';

class CurrencyRadioButton extends StatelessWidget {
  final dynamic data;
  final int? index, selectIndex;

  const CurrencyRadioButton(
      {Key? key, this.data, this.selectIndex, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: const EdgeInsets.all(Insets.i3),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: selectIndex == index
                    ? appCtrl.appTheme.primary
                    : appCtrl.appTheme.lightText
            )),
        child: Icon(
            Icons.circle,size: 10,
            color: selectIndex == index
                ? appCtrl.appTheme.primary
                : appCtrl.appTheme.trans
        )
    );
  }
}
