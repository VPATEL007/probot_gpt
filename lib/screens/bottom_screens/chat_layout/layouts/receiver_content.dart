import '../../../../config.dart';

class ReceiverContent extends StatelessWidget {
  final String? text;
  final Widget? row;
  const ReceiverContent({Key? key,this.text,this.row}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Insets.i10, vertical: Insets.i12),
        decoration: BoxDecoration(
            color:  const Color(0xff20323E),

          //  boxShadow: appCtrl.isTheme ? null :   [
          //    BoxShadow(
          //        color: appCtrl.appTheme.primaryShadow,
                 // offset: const Offset(0, 10),
         //         blurRadius: 20)
           // ],
            borderRadius:
           BorderRadius.circular(AppRadius.r6
        )),
        child: Column(
          children: [
            Text(
              text!,
              overflow: TextOverflow.clip,
              style: GoogleFonts.roboto(
                fontSize: 17,
                fontWeight: FontWeight.w100,
              )
                  .textColor(appCtrl.appTheme.white)
                  .textHeight(1.2),
            ),
            row!
          ],
        ));
  }
}
