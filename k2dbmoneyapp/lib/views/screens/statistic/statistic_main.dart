import 'dart:math' as math;

// import 'package:charts_flutter/flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/views/screens/statistic/Transaction_search.dart';
import '../../../core/helpers/help_random.dart';
import '../../widgets/widget_item_history.dart';
import 'statistical_chart_screen.dart';
import 'package:k2dbmoneyapp/core/model/user.dart';

class Statistic extends StatefulWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  final User user = User.base;
  //
  // Map<String, List<int>> data = {
  //   'income': List.generate(
  //     12,
  //     (index) => HelperRNG.nextInt(1000000),
  //   ),
  //   'spent': List.generate(
  //     12,
  //     (index) => HelperRNG.nextInt(1000000),
  //   )
  // };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorsApp.backgroundLight,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsApp.primaryColor,
          automaticallyImplyLeading: false,
          title: Text(
            "Statistics",
            style:
                TextStyles.defaultStyle.bold.colorAppBarText.sizeTitleAndButton,
          ),
          actions: [
            IconButton(
              padding: const EdgeInsets.all(k12Padding),
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             Statistical_Chart()));
              },
              icon: const Icon(
                FontAwesomeIcons.chartSimple,
                size: kIconSize,
                color: Colors.white,
              ),
              tooltip: "...",
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: k12Padding),
              child: Stack(
                children: [
                  CustomPaint(
                    painter: _SemiCircle(),
                    size: Size(size.width, size.height * 0.3),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: MediaQuery.of(context).size.height * 0.02,
                    child: _UserCard(
                      user: user,
                      sumIncome: HelperRNG.randInt(200),
                      sumSpent: HelperRNG.randInt(200),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(k12Padding),
              child: const AspectRatio(
                aspectRatio: 1,
                child: _ChartSection(),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomPaint(
                    painter: _RoundedColoredLabel(ColorsApp.statusSuccessColor),
                    size: Size(20, 15),
                  ),
                  const SizedBox(
                    width: k8Padding,
                  ),
                  Text(
                    "Income",
                    style: TextStyles.defaultStyle.semiBold,
                  ),
                  const SizedBox(
                    width: k12Padding,
                  ),
                  const CustomPaint(
                    painter: _RoundedColoredLabel(ColorsApp.statusErrorColor),
                    size: Size(20, 15),
                  ),
                  const SizedBox(
                    width: k8Padding,
                  ),
                  Text(
                    "Spent",
                    style: TextStyles.defaultStyle.semiBold,
                  ),
                ],
              ),
            )
          ],
        )));
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    super.key,
    required this.user,
    this.sumIncome = 0,
    this.sumSpent = 0,
  });

  final User user;
  final int sumIncome;
  final int sumSpent;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(k12Padding),
        // width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            color: ColorsApp.backgroundLight,
            // border: Border.all(color: Colors.red)
            borderRadius: BorderRadius.circular(kBorderRadiusMin),
            boxShadow: [
              BoxShadow(
                  color: ColorsApp.primaryColor.withOpacity(0.6),
                  offset: const Offset(5, 5),
                  blurRadius: 10)
            ]),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: kIconSize * 1.5,
                  child: HelperImage.loadFromAsset(user.userAvatar,
                      radius: BorderRadius.circular(kBorderRadiusIcon)),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(user.userName!.toUpperCase(),
                    style: TextStyles
                        .defaultStyle.semiBold.sizeHeading.colorDefaultText),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: k12Margin),
                  padding: const EdgeInsets.symmetric(
                      horizontal: k24Padding, vertical: k12Padding),
                  color: ColorsApp.statusSuccessColor,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Income",
                        style: TextStyles.defaultStyle.semiBold
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        "+${sumIncome.toDouble().toFormatMoney()}",
                        style: TextStyles.defaultStyle.bold.sizeTitleAndButton
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: k12Margin),
                  padding: const EdgeInsets.symmetric(
                      horizontal: k24Padding, vertical: k12Padding),
                  color: ColorsApp.statusErrorColor,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Spent",
                        style: TextStyles.defaultStyle.semiBold
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        "-${sumSpent.toDouble().toFormatMoney()}",
                        style: TextStyles.defaultStyle.bold.sizeTitleAndButton
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SemiCircle extends CustomPainter {
  _SemiCircle() : super();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = ColorsApp.primaryColor;
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width / 2, Size.zero.height),
            width: size.width,
            height: size.height),
        math.pi,
        -math.pi,
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _RoundedColoredLabel extends CustomPainter {
  final Color color;

  const _RoundedColoredLabel(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    canvas.drawRect(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _ChartSection extends StatefulWidget {
  const _ChartSection({
    Key? key,
    // required this.income, required this.spent
  }) : super(key: key);

  // final  List<int> income, spent;

  @override
  State<_ChartSection> createState() => _ChartSectionState();
}

class _ChartSectionState extends State<_ChartSection> {
  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
        borderData: FlBorderData(
          border: const Border(
            top: BorderSide.none,
            right: BorderSide.none,
            left: BorderSide(width: 1, color: ColorsApp.primaryColor),
            bottom: BorderSide(width: 1, color: ColorsApp.primaryColor),
          ),
        ),
        groupsSpace: 10,
        barGroups: buildBars(),
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: bottomTitles,
              // reservedSize: 42,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              // interval: 10,
              getTitlesWidget: (value, meta) => SideTitleWidget(
                axisSide: meta.axisSide,
                space: 2, //margin top
                child: Text(
                  value.toInt().toString(),
                  style: TextStyles.defaultStyle,
                ),
              ),
            ),
          ),
        )));
  }

  List<BarChartGroupData> buildBars() => List.generate(
      12,
      (index) => BarChartGroupData(x: index, barRods: [
            BarChartRodData(
              toY: HelperRNG.randInt(200).toDouble(),
              width: 12,
              color: ColorsApp.statusErrorColor,
              borderRadius: BorderRadius.circular(4),
            ),
            BarChartRodData(
              toY: HelperRNG.randInt(200).toDouble(),
              width: 12,
              color: ColorsApp.statusSuccessColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ]));

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>[
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    final Widget text =
        Text(titles[value.toInt()], style: TextStyles.defaultStyle.sizeMin);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2, //margin top
      child: text,
    );
  }
}
