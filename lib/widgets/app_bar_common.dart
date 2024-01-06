import '../config.dart';

class AppAppBarCommon extends StatelessWidget with PreferredSizeWidget {
  final GestureTapCallback? actionOnTap, leadingOnTap;
  final String? title, actionIcon;
  final bool isAction;

  const AppAppBarCommon(
      {Key? key,
        this.title,
        this.actionOnTap,
        this.actionIcon,
        this.leadingOnTap,
        this.isAction = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: Sizes.s70,
        backgroundColor: appCtrl.appTheme.bg1,
        actions: [
          if (isAction)
            SvgPicture.asset(actionIcon!)
                .paddingSymmetric(horizontal: Insets.i20)
                .inkWell(onTap: actionOnTap)
        ],
        title: Row(children: [
          const HSpace(Sizes.s10),
          SvgPicture.asset(eSvgAssets.leftArrow,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                  appCtrl.isTheme
                      ? appCtrl.appTheme.sameWhite
                      : appCtrl.appTheme.white,
                  BlendMode.srcIn))
             
              .inkWell(onTap: leadingOnTap),
          const HSpace(Sizes.s17),
          Text(title!.tr,
              style:
              AppCss.outfitSemiBold22.textColor(appCtrl.appTheme.sameWhite))
        ]));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}