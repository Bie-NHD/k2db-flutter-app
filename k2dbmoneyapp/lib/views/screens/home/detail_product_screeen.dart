import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/core/widgets/widget_itembutton.dart';
import 'package:k2dbmoneyapp/views/widgets/dot_indicators.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({Key? key}) : super(key: key);

  static const routeName = "/detailProduct_screen";

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const PageScrollPhysics(),
          padding: const EdgeInsets.only(bottom: k24Padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 250,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index) {
                        setState(() {
                          _pageIndex = index;
                        });
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) =>
                          HelperImage.loadFromAsset(
                        HelperAssets.detailProduct,
                      ),
                    ),
                  ),
                  // Button back
                  Positioned(
                      top: k8Padding,
                      left: k12Padding,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorsApp.backgroundDark.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          iconSize: kIconSize,
                          icon: const Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: ColorsApp.backgroundLight,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      )),
                  // DotIndicator
                  Positioned(
                    bottom: k8Padding,
                    child: Row(
                      children: [
                        ...List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: k8Padding),
                            child: DotIndicator(
                              isActive: index == _pageIndex,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: k16Padding,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: k12Padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        HelperImage.loadFromAsset(
                          HelperAssets.logoBrandStore,
                          width: k24Padding,
                          height: k24Padding,
                          radius: BorderRadius.circular(kBorderRadiusMax),
                        ),
                        const SizedBox(
                          width: k8Padding / 2,
                        ),
                        Text(
                          "Bách Hóa Xanh",
                          style: TextStyles.defaultStyle.sizeMin,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: k8Padding / 2),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Kem đặc có đường Hoàn hảo lon",
                            style: TextStyles.defaultStyle.semiBold,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: k24Padding * 2),
                          padding: const EdgeInsets.symmetric(
                              vertical: k8Padding / 2, horizontal: k8Padding),
                          decoration: BoxDecoration(
                              color: ColorsApp.statusErrorColor,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(kBorderRadiusMin),
                                  bottomLeft:
                                      Radius.circular(kBorderRadiusMin)),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      ColorsApp.backgroundDark.withOpacity(0.3),
                                  offset: const Offset(1, 2),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                ),
                              ]),
                          child: Text("-20%",
                              style: TextStyles
                                  .defaultStyle.sizeMin.colorAppBarText),
                        ),
                      ],
                    ),
                    const SizedBox(height: k8Padding),
                    // description
                    Text(
                      "Sữa đặc Hoàn Hảo là dòng sữa đặc với hương vị béo, ngọt, độ sánh mịn tuyệt vời, rất phù hợp để pha cà phê, làm sinh tố, trà sữa, làm bánh flan,.. đều rất ngon. Kem đặc có đường Hoàn Hảo lon 380g lon nhỏ dễ bảo quản, tiện dùng.",
                      style: TextStyles.defaultStyle.sizeMin,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: k8Padding),
                    //  price
                    Row(
                      children: [
                        Text(80000.0.toFormatMoney(),
                            style: TextStyles.defaultStyle.colorRedText),
                        const SizedBox(width: k16Padding),
                        Text(
                          100000.0.toFormatMoney(),
                          style: TextStyles.defaultStyle.sizeMin.colorHintText
                              .copyWith(decoration: TextDecoration.lineThrough),
                        ),
                        const Spacer(),
                        const Text(
                          "Weight: 0,38 Kg",
                          style: TextStyles.defaultStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                height: k16Padding,
                thickness: k8Padding / 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: k12Padding),
                child: Column(children: [
                  Text("Detail information",
                      style: TextStyles.defaultStyle.sizeAppbar.semiBold)
                ]),
              ),
              const SizedBox(height: k8Padding),
              const ItemInformation(
                fieldInformation: "Brand",
                valueInformation: "Hoàn Hảo (Việt Nam)",
              ),
              const ItemInformation(
                fieldInformation: "Manufacture date",
                valueInformation: "28/02/2023",
              ),
              const ItemInformation(
                fieldInformation: "Expiry Date",
                valueInformation: "28/02/2024",
              ),
              const ItemInformation(
                fieldInformation: "Country of Origin",
                valueInformation: "Việt Nam",
              ),
              const ItemInformation(
                fieldInformation: "Warranty Duration",
                valueInformation: "3 Months",
              ),
              const SizedBox(height: k24Padding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: k12Padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quantity: 3654",
                      style: TextStyles.defaultStyle.bold,
                    ),
                    const SizedBox(height: k8Padding),
                    const ButtonFill(
                      text: "The store is selling this product",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemInformation extends StatelessWidget {
  final String fieldInformation;
  final String? valueInformation;
  const ItemInformation({
    Key? key,
    required this.fieldInformation,
    this.valueInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: k12Padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$fieldInformation: ",
                  style: TextStyles.defaultStyle.colorHintText),
              valueInformation != null
                  ? Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: k24Padding + 6),
                        child: Text(
                          valueInformation!,
                          style: TextStyles.defaultStyle,
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        const Divider(
          height: k24Padding,
          thickness: 1,
        ),
        // const SizedBox(height: k12Padding)
      ],
    );
  }
}
