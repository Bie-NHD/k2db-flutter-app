import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/dimension.dart';
import '../../../core/extensions/extension_textstyle.dart';
import '../../../../core/constant/text.dart';

class PromotionScreen extends StatelessWidget {
  static const routeName = "/promotion_screen";

  const PromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        title: const Center(
          child: Text("Promotion",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(k12Padding),
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.solidCircleQuestion,
              size: kIconSize - 2,
            ),
            tooltip: "Help",
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 24, 12, 12),
                  child: Container(
                    width: 366,
                    height: 90,
                    decoration: BoxDecoration(
                      color: ColorsApp.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(1, -1),
                          child: Container(
                            width: 210,
                            height: 46,
                            decoration: const BoxDecoration(
                              color: ColorsApp.statusNoteColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(90),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1, -1),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                            child: Text(
                                'Accumulated points',
                                style: TextStyle(
                                  fontSize: TextStyles.defaultStyle.bold.fontSize,
                                  fontWeight: TextStyles.defaultStyle.bold.fontWeight,
                                  color: ColorsApp.backgroundLight,
                                )
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1, 1),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 12),
                            child: Text(
                              "7.000.000.000.000.000.000 Point",
                              style: TextStyle(
                                  fontSize: TextStyles.defaultStyle.fontDefault.fontSize,
                                  color: ColorsApp.backgroundLight,
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget> [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: k12Padding),
                  child: Column(
                    children: [
                      Container(
                        width: 173,
                        height: 64,
                        decoration: BoxDecoration(
                          color: ColorsApp.backgroundLight,
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1, -1),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 0, 0),
                                child: Text(
                                  'MY GIFT',
                                  style: TextStyle(
                                    fontSize: TextStyles.defaultStyle.fontDefault.fontSize,
                                    fontWeight: TextStyles.defaultStyle.bold.fontWeight,
                                    color: ColorsApp.defaultTextColor,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1, 1),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
                                child: Text(
                                  'Promotions are available',
                                  style: TextStyle(
                                    fontSize: TextStyles.defaultStyle.fontMin.fontSize,
                                    fontWeight: TextStyles.defaultStyle.extraLight.fontWeight,
                                    color: ColorsApp.defaultTextColor,
                                  ),
                                ),
                              ),
                            ),
                            const Align(
                              alignment: AlignmentDirectional(1, -1),
                              child: Icon(
                                Icons.local_offer,
                                size: kIconSize,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: k12Padding),
                  child: Column(
                    children: [
                      Container(
                        width: 173,
                        height: 64,
                        decoration: BoxDecoration(
                          color: ColorsApp.backgroundLight,
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1, -1),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 0, 0),
                                child: Text(
                                  'EXCHANGE GIFTS',
                                  style: TextStyle(
                                    fontSize: TextStyles.defaultStyle.fontDefault.fontSize,
                                    fontWeight: TextStyles.defaultStyle.bold.fontWeight,
                                    color: ColorsApp.defaultTextColor,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1, 1),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
                                child: Text(
                                  'Use points to exchange gifts',
                                  style: TextStyle(
                                    fontSize: TextStyles.defaultStyle.fontMin.fontSize,
                                    fontWeight: TextStyles.defaultStyle.extraLight.fontWeight,
                                    color: ColorsApp.defaultTextColor,
                                  ),
                                ),
                              ),
                            ),
                            const Align(
                              alignment: AlignmentDirectional(1, -1),
                              child: Icon(
                                FontAwesomeIcons.gift,
                                size: kIconSize - 2,
                              ),
                            )
                          ],
                        ),
                      ),
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
