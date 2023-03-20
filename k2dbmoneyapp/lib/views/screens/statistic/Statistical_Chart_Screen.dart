import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/dimension.dart';
import '../../../core/constant/text.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;


class Statistical_Chart extends StatefulWidget {
  Statistical_Chart({Key? key}) : super(key: key);
  @override
  State<Statistical_Chart> createState() => _Statistical_ChartState();
}

class _Statistical_ChartState extends State<Statistical_Chart> {
  late List<charts.Series<dynamic, String>> seriesList;
  static List<charts.Series<Sales, String>> _createRandomData(){
    final ramdom = Random();
    final destopSalesData = [
      Sales('2015', ramdom.nextInt(100)),
      Sales('2016', ramdom.nextInt(100)),
      Sales('2017', ramdom.nextInt(100)),
      Sales('2018', ramdom.nextInt(100)),
      Sales('2019', ramdom.nextInt(100)),
      Sales('2020', ramdom.nextInt(100)),
    ];

    final tabletSalesData = [
      Sales('2015', ramdom.nextInt(100)),
      Sales('2016', ramdom.nextInt(100)),
      Sales('2017', ramdom.nextInt(100)),
      Sales('2018', ramdom.nextInt(100)),
      Sales('2019', ramdom.nextInt(100)),
      Sales('2020', ramdom.nextInt(100)),
    ];
    return [charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: destopSalesData,
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
        // elevation: 0,
        // automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: ColorsApp.primaryColor,
        title: Text("Statistical Chart",
          style: TextStyles.defaultStyle.semiBold.sizeAppbar.colorAppBarText,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.02,),
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
          const SizedBox(height: k12Margin,),
          Container(
            width: size.width,
            height: size.height * 0.55,
            child: barChart(),
          ),
          const SizedBox(height: k12Margin),
          Row(
            children: [
              const SizedBox(width: k8Margin * 2,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tổng quan', style: TextStyles.defaultStyle.semiBold.sizeTitleAndButton.colorDefaultText,),
                  Text('Tháng chi nhiều nhất: '),
                  Text('Tháng chi ít nhất:'),
                  Text('Tổng chi trung bình:'),
                  Text('Tháng nạp nhiều nhất:'),
                  Text('Tháng nạp ít nhất:'),
                  Text('Tổng nạp trung bình:'),
                ],
              ),
            ],
          )
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