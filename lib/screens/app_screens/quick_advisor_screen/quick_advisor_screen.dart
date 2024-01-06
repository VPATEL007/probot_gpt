

// import '../../../config.dart';
// import '../../bottom_screens/home/layouts/quick_advisor_layout.dart';

// class QuickAdvisorScreen extends StatelessWidget {
//   final quickAdvisorCtrl = Get.put(QuickAdvisorController());
//    QuickAdvisorScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<QuickAdvisorController>(
//       builder: (quickAdvisorCtrl) {
//         return Scaffold(
//            appBar: AppAppBarCommon(title: appFonts.quickAdvice,leadingOnTap: ()=> Get.back()),
//           body:  GridView.builder(
//               padding: EdgeInsets.zero,
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: quickAdvisorCtrl.quickAdvisorLists.length,
//               gridDelegate:
//               const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisSpacing: 20,
//                   childAspectRatio: 1,
//                   mainAxisSpacing: 15,
//                   mainAxisExtent: 105,
//                   crossAxisCount: 3),
//               itemBuilder: (context, index) {
//                 return QuickAdvisorLayout(
//                     data: quickAdvisorCtrl.quickAdvisorLists[index]);
//               }).paddingAll(Insets.i20),
//         );
//       }
//     );
//   }
// }
