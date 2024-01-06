import '../../../../config.dart';

class ChatHistoryAppBar extends StatelessWidget with PreferredSizeWidget {
  final List? index;
  final GestureTapCallback? onDeleteTap,onMenuTap;
  const ChatHistoryAppBar({Key? key,this.index,this.onDeleteTap,this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
        toolbarHeight: 70,
        titleSpacing: 0,
        leading: SvgPicture.asset(
          eSvgAssets.leftArrow,
          fit: BoxFit.scaleDown,
          colorFilter:
          ColorFilter.mode(appCtrl.appTheme.sameWhite, BlendMode.srcIn),
        ).inkWell(onTap: () {
          Get.back();
        }),
        automaticallyImplyLeading: false,
        backgroundColor: appCtrl.appTheme.primary,
        actions: [
          index!.isNotEmpty ? SvgPicture.asset(eSvgAssets.delete).paddingSymmetric(horizontal: Insets.i15).inkWell(onTap: onDeleteTap) :
          Row(
            children: [
              SvgPicture.asset(eSvgAssets.search,colorFilter: ColorFilter.mode(appCtrl.appTheme.sameWhite, BlendMode.srcIn),),
              const HSpace(Sizes.s10),
              SvgPicture.asset(eSvgAssets.more,
                  height: Sizes.s20, fit: BoxFit.fill).inkWell(onTap: onMenuTap),
              const HSpace(Sizes.s10),
            ]
          )
        ],
        title: Text( index!.isNotEmpty ? "${index!.length} Selected" : appFonts.chatHistory.tr,
            style: AppCss.outfitExtraBold22
                .textColor(appCtrl.appTheme.sameWhite)));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
}
