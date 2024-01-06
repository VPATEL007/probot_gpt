import '../../../../config.dart';

class CommonContent extends StatelessWidget {
  final String? text;
  final int? index;
  final Widget? time;
  const CommonContent({Key? key, this.text,this.index,this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatLayoutController>(builder: (chatCtrl) {
      return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Insets.i10, vertical: Insets.i12),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff185D64),width: 1.5),
            color: const Color(0xff1D4755),
            borderRadius: BorderRadius.circular(AppRadius.r6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text!,
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w100
              )
        //      style: AppCss.outfitMedium14.textColor(appCtrl.appTheme.sameWhite),
            ),
            const VSpace(Sizes.s10),
            time!
          ],
        ),
      ).inkWell(
          onTap: () {
            if (chatCtrl.isLongPress) {
              if (!chatCtrl.selectedIndex.contains(index)) {
                chatCtrl.selectedIndex.add(index);
                chatCtrl.selectedData.add(chatCtrl.selectedMessages[index!]);
                chatCtrl.update();
              }else{
                if (chatCtrl.selectedIndex.contains(index)) {
                  chatCtrl.selectedIndex.remove(index);
                  chatCtrl.selectedData.remove(chatCtrl.selectedMessages[index!]);
                  chatCtrl.update();
                }
              }
            } else {
              if (chatCtrl.selectedIndex.contains(index)) {
                chatCtrl.selectedIndex.remove(index);
                chatCtrl.selectedData.remove(chatCtrl.selectedMessages[index!]);
                chatCtrl.update();
              }
            }
          });
    });
  }
}
