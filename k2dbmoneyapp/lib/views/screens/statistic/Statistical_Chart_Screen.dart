// import 'package:flutter/material.dart';
// import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
// import '../../../core/constant/color.dart';
// import '../../../core/constant/dimension.dart';
// import '../../../core/constant/text.dart';
// import 'dart:math';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'dart:math';
//
//
// // ignore: camel_case_types
// class Statistical_Chart extends StatefulWidget {
//   const Statistical_Chart({Key? key}) : super(key: key);
//   @override
//   State<Statistical_Chart> createState() => _Statistical_ChartState();
// }
//
// // ignore: camel_case_types
// class _Statistical_ChartState extends State<Statistical_Chart> {
//   late List<charts.Series<dynamic, String>> seriesList;
//   static List<charts.Series<Sales, String>> _createRandomData(){
//     final random = Random();
//     final Data1 = [
//       Sales('Jan', random.nextInt(150)),
//       Sales('Feb', random.nextInt(150)),
//       Sales('Mar', random.nextInt(150)),
//       Sales('Apr', random.nextInt(150)),
//       Sales('May', random.nextInt(150)),
//       Sales('Jun', random.nextInt(150)),
//     ];
//
//     final Data2 = [
//       Sales('Jan', random.nextInt(100)),
//       Sales('Feb', random.nextInt(100)),
//       Sales('Mar', random.nextInt(100)),
//       Sales('Apr', random.nextInt(100)),
//       Sales('May', random.nextInt(100)),
//       Sales('Jun', random.nextInt(100)),
//     ];
//     return [charts.Series<Sales, String>(
//         id: 'Sales',
//         domainFn: (Sales sales, _) => sales.month,
//         measureFn: (Sales sales, _) => sales.sales,
//         data: Data1,
//         fillColorFn: (Sales sale, _){
//           return charts.MaterialPalette.blue.shadeDefault;
//         }
//     ),
//       charts.Series<Sales, String>(
//           id: 'Sales',
//           domainFn: (Sales sales, _) => sales.month,
//           measureFn: (Sales sales, _) => sales.sales,
//           data: Data2,
//           fillColorFn: (Sales sale, _){
//             return charts.MaterialPalette.red.shadeDefault;
//           }
//       )
//     ];
//   }
//
//   barChart(){
//     return charts.BarChart(
//       seriesList,
//       animate: true,
//       vertical: true,
//     );
//   }
//
//   @override
//   void initState(){
//     super.initState();
//     seriesList = _createRandomData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: ColorsApp.backgroundLight,
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: ColorsApp.primaryColor,
//         title: Text("Statistical Chart",
//           style: TextStyles.defaultStyle.semiBold.sizeAppbar.colorAppBarText,
//         ),
//       ),
//       body: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: size.height * 0.012,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   width: size.width * 0.45,
//                   height: size.height * 0.09,
//                   decoration: BoxDecoration(
//                     color: ColorsApp.primaryColor,
//                     borderRadius: BorderRadius.circular(kBorderRadiusMax),
//                     border: Border.all(color: ColorsApp.hintTextColor, width: 0.2),
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(height: size.height * 0.01,),
//                       Text('In',
//                           style: TextStyles.defaultStyle.regular.sizeAppbar.colorAppBarText
//                       ),
//                       Text('+120000',
//                           style: TextStyles.defaultStyle.semiBold.sizeHeading.colorGreenText
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: size.width * 0.45,
//                   height: size.height * 0.09,
//                   decoration: BoxDecoration(
//                     color: ColorsApp.primaryColor,
//                     borderRadius: BorderRadius.circular(kBorderRadiusMax),
//                     border: Border.all(color: ColorsApp.hintTextColor, width: 0.2),
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(height: size.height * 0.01,),
//                       Text('Out',
//                         style: TextStyles.defaultStyle.regular.sizeAppbar.colorAppBarText,
//                       ),
//                       Text('-120000',
//                         style: TextStyles.defaultStyle.semiBold.sizeHeading.colorRedText,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: k12Margin,),
//             Container(
//               margin: EdgeInsets.all(k12Margin),
//               padding: EdgeInsets.all(k8Padding),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(kBorderRadiusMin),
//                 border: Border.all(color: ColorsApp.tertiaryColors),
//               ),
//               child: SizedBox(
//                 width: size.width,
//                 height: size.height * 0.53,
//                 child: barChart(),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: k8Margin / 2),
//               padding: EdgeInsets.only(left: k16Padding),
//               child:Text("OverView", style: TextStyles.defaultStyle.colorDefaultText.semiBold.sizeTitleAndButton,),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: k16Padding),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: size.width - k16Padding,
//                         padding: const EdgeInsets.all(k12Padding),
//                         margin: const EdgeInsets.symmetric(vertical: k8Margin / 2),
//                         decoration: BoxDecoration(
//                           color: ColorsApp.backgroundLight,
//                           borderRadius: BorderRadius.circular(kBorderRadiusMin),
//                           border: Border.all(color: ColorsApp.tertiaryColors)
//                         ),
//                         child: Wrap(
//                           direction: Axis.horizontal,
//                           crossAxisAlignment: WrapCrossAlignment.end,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: k8Padding),
//                               child: Text("Most In", style: TextStyles.defaultStyle.semiBold.colorDefaultText.sizeDefault,),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: k8Padding),
//                               child: Text("100000000", style: TextStyles.defaultStyle.regular.colorDefaultText.sizeDefault,),
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: size.width - k16Padding,
//                         padding: const EdgeInsets.all(k12Padding),
//                         decoration: BoxDecoration(
//                             color: ColorsApp.backgroundLight,
//                             borderRadius: BorderRadius.circular(kBorderRadiusMin),
//                             border: Border.all(color: ColorsApp.tertiaryColors)),
//                         // constraints: BoxConstraints(
//                         //   maxWidth: MediaQuery.of(context).size.width),
//                         child: Wrap(
//                           direction: Axis.horizontal,
//                           crossAxisAlignment: WrapCrossAlignment.end,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: k8Padding),
//                               child: Text("Least In", style: TextStyles.defaultStyle.semiBold.colorDefaultText.sizeDefault,),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: k8Padding),
//                               child: Text("100000000", style: TextStyles.defaultStyle.regular.colorDefaultText.sizeDefault,),
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: size.width - k16Padding,
//                         padding: const EdgeInsets.all(k12Padding),
//                         margin: const EdgeInsets.symmetric(vertical: k8Margin / 2),
//                         decoration: BoxDecoration(
//                             color: ColorsApp.backgroundLight,
//                             borderRadius: BorderRadius.circular(kBorderRadiusMin),
//                             border: Border.all(color: ColorsApp.tertiaryColors)),
//                         // constraints: BoxConstraints(
//                         //   maxWidth: MediaQuery.of(context).size.width),
//                         child: Wrap(
//                           direction: Axis.horizontal,
//                           crossAxisAlignment: WrapCrossAlignment.end,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: k8Padding),
//                               child: Text("Medium In", style: TextStyles.defaultStyle.semiBold.colorDefaultText.sizeDefault,),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: k8Padding),
//                               child: Text("100000000", style: TextStyles.defaultStyle.regular.colorDefaultText.sizeDefault,),
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: size.width - k16Padding,
//                         padding: const EdgeInsets.all(k12Padding),
//                         decoration: BoxDecoration(
//                             color: ColorsApp.backgroundLight,
//                             borderRadius: BorderRadius.circular(kBorderRadiusMin),
//                             border: Border.all(color: ColorsApp.tertiaryColors)),
//                         // constraints: BoxConstraints(
//                         //   maxWidth: MediaQuery.of(context).size.width),
//                         child: Wrap(
//                           direction: Axis.horizontal,
//                           crossAxisAlignment: WrapCrossAlignment.end,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: k8Padding),
//                               child: Text("Most Out", style: TextStyles.defaultStyle.semiBold.colorDefaultText.sizeDefault,),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: k8Padding),
//                               child: Text("100000000", style: TextStyles.defaultStyle.regular.colorDefaultText.sizeDefault,),
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: size.width - k16Padding,
//                         padding: const EdgeInsets.all(k12Padding),
//                         margin: const EdgeInsets.symmetric(vertical: k8Margin / 2),
//                         decoration: BoxDecoration(
//                             color: ColorsApp.backgroundLight,
//                             borderRadius: BorderRadius.circular(kBorderRadiusMin),
//                             border: Border.all(color: ColorsApp.tertiaryColors)),
//                         // constraints: BoxConstraints(
//                         //   maxWidth: MediaQuery.of(context).size.width),
//                         child: Wrap(
//                           direction: Axis.horizontal,
//                           crossAxisAlignment: WrapCrossAlignment.end,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: k8Padding),
//                               child: Text("Least Out", style: TextStyles.defaultStyle.semiBold.colorDefaultText.sizeDefault,),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: k8Padding),
//                               child: Text("100000000", style: TextStyles.defaultStyle.regular.colorDefaultText.sizeDefault,),
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: size.width - k16Padding,
//                         padding: const EdgeInsets.all(k12Padding),
//                         margin: const EdgeInsets.only(bottom: k8Margin),
//                         decoration: BoxDecoration(
//                             color: ColorsApp.backgroundLight,
//                             borderRadius: BorderRadius.circular(kBorderRadiusMin),
//                             border: Border.all(color: ColorsApp.tertiaryColors)),
//                         // constraints: BoxConstraints(
//                         //   maxWidth: MediaQuery.of(context).size.width),
//                         child: Wrap(
//                           direction: Axis.horizontal,
//                           crossAxisAlignment: WrapCrossAlignment.end,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: k8Padding),
//                               child: Text("Medium Out", style: TextStyles.defaultStyle.semiBold.colorDefaultText.sizeDefault,),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: k8Padding),
//                               child: Text("100000000", style: TextStyles.defaultStyle.regular.colorDefaultText.sizeDefault,),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Sales{
//   final String month;
//   final int sales;
//
//   Sales(this.month, this.sales);
// }