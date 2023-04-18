import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/dimension.dart';
import '../../../core/constant/text.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;


// ignore: camel_case_types
class Statistical_Chart extends StatefulWidget {
  const Statistical_Chart({Key? key}) : super(key: key);
  @override
  State<Statistical_Chart> createState() => _Statistical_ChartState();
}

// ignore: camel_case_types
class _Statistical_ChartState extends State<Statistical_Chart> {
  late List<charts.Series<dynamic, String>> seriesList;
  static List<charts.Series<Sales, String>> _createRandomData(){
    final random = Random();
    final desktopSalesData = [
      Sales('2015', random.nextInt(150)),
      Sales('2016', random.nextInt(150)),
      Sales('2017', random.nextInt(150)),
      Sales('2018', random.nextInt(150)),
      Sales('2019', random.nextInt(150)),
      Sales('2020', random.nextInt(150)),
    ];

    final tabletSalesData = [
      Sales('2015', random.nextInt(100)),
      Sales('2016', random.nextInt(100)),
      Sales('2017', random.nextInt(100)),
      Sales('2018', random.nextInt(100)),
      Sales('2019', random.nextInt(100)),
      Sales('2020', random.nextInt(100)),
    ];
    return [charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: desktopSalesData,
        fillColorFn: (Sales sale, _){
          return charts.MaterialPalette.blue.shadeDefault;
        }
    ),
      charts.Series<Sales, String>(
          id: 'Sales',
          domainFn: (Sales sales, _) => sales.year,
          measureFn: (Sales sales, _) => sales.sales,
          data: tabletSalesData,
          fillColorFn: (Sales sale, _){
            return charts.MaterialPalette.red.shadeDefault;
          }
      )
    ];
  }

  barChart(){
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
    );
  }

  @override
  void initState(){
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsApp.backgroundLight,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsApp.primaryColor,
        title: Text("Statistical Chart",
          style: TextStyles.defaultStyle.semiBold.sizeAppbar.colorAppBarText,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.012,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: size.width * 0.45,
                height: size.height * 0.09,
                decoration: BoxDecoration(
                  color: ColorsApp.primaryColor,
                  borderRadius: BorderRadius.circular(kBorderRadiusMax),
                  border: Border.all(color: ColorsApp.hintTextColor, width: 0.2),
                ),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.01,),
                    Text('Thu',
                        style: TextStyles.defaultStyle.regular.sizeAppbar.colorAppBarText
                    ),
                    Text('+120000',
                        style: TextStyles.defaultStyle.semiBold.sizeHeading.colorGreenText
                    )
                  ],
                ),
              ),
              Container(
                width: size.width * 0.45,
                height: size.height * 0.09,
                decoration: BoxDecoration(
                  color: ColorsApp.primaryColor,
                  borderRadius: BorderRadius.circular(kBorderRadiusMax),
                  border: Border.all(color: ColorsApp.hintTextColor, width: 0.2),
                ),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.01,),
                    Text('Chi',
                      style: TextStyles.defaultStyle.regular.sizeAppbar.colorAppBarText,
                    ),
                    Text('-120000',
                      style: TextStyles.defaultStyle.semiBold.sizeHeading.colorRedText,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Container(
          //   alignment: Alignment.center,
          //   width: size.width * 0.95,
          //   height: size.height * 0.09,
          //   decoration: BoxDecoration(
          //     // color: ColorsApp.primaryColor,
          //     borderRadius: BorderRadius.circular(kBorderRadiusMax),
          //     border: Border.all(color: ColorsApp.hintTextColor, width: 0.2),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Column(
          //           children: [
          //             SizedBox(height: size.height * 0.01,),
          //             Text('Thu',
          //                 style: TextStyles.defaultStyle.regular.sizeAppbar.colorAppBarText
          //             ),
          //             Text('+120000',
          //                 style: TextStyles.defaultStyle.semiBold.sizeHeading.colorGreenText
          //             )
          //           ],
          //         ),
          //       Column(
          //           children: [
          //             SizedBox(height: size.height * 0.01,),
          //             Text('Chi',
          //               style: TextStyles.defaultStyle.regular.sizeAppbar.colorAppBarText,
          //             ),
          //             Text('-120000',
          //               style: TextStyles.defaultStyle.semiBold.sizeHeading.colorRedText,
          //             ),
          //           ],
          //         ),
          //     ],
          //   ),
          // ),
          const SizedBox(height: k12Margin,),
          SizedBox(
            width: size.width * 0.95,
            height: size.height * 0.53,
            child: barChart(),
          ),
          const SizedBox(height: k12Margin),
          Container(
            width: size.width * 0.95,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(k8Padding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: ColorsApp.hintTextColor
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tổng quan', style: TextStyles.defaultStyle.semiBold.sizeTitleAndButton.colorDefaultText,),
                const Divider(thickness: k8Margin / 4, height: k8Margin / 2,),
                Text('1. Tháng chi nhiều nhất: ', style: TextStyles.defaultStyle.colorDefaultText.regular.sizeDefault,),
                Text('2. Tháng chi ít nhất:', style: TextStyles.defaultStyle.colorDefaultText.regular.sizeDefault,),
                Text('3. Tổng chi trung bình:', style: TextStyles.defaultStyle.colorDefaultText.regular.sizeDefault,),
                Text('4. Tháng nạp nhiều nhất:', style: TextStyles.defaultStyle.colorDefaultText.regular.sizeDefault,),
                Text('5. Tháng nạp ít nhất:', style: TextStyles.defaultStyle.colorDefaultText.regular.sizeDefault,),
                Text('6. Tổng nạp trung bình:', style: TextStyles.defaultStyle.colorDefaultText.regular.sizeDefault,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Sales{
  final String year;
  final int sales;

  Sales(this.year, this.sales);
}