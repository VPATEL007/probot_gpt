import '../../../../config.dart';
import '../../../../utils/general_utils.dart';

class DrawerListCommon extends StatelessWidget {
  final dynamic data;
  final int? index;
  const DrawerListCommon({Key? key,this.data,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: Insets.i20, vertical: Insets.i2),
        horizontalTitleGap: 0,
        minVerticalPadding: 0,
        onTap: () => appCtrl.onDrawerTap(index,data),
        leading: SvgPicture.asset(data["icon"],
            colorFilter: const ColorFilter.mode(
               Color(0xff47FFF2), BlendMode.srcIn)),
        title: Text(trans(data["title"]),
            style: AppCss.outfitRegular16
                .textColor(const Color(0xff47FFF2))));
  }
}
