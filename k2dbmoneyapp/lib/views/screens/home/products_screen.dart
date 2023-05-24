import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/widgets/widget-text-field-search.dart';
import 'package:k2dbmoneyapp/core/widgets/widget_card_itemproduct.dart';

import '../../../core/helpers/help_random.dart';
import '../../../core/helpers/demo_data.dart';
import 'detail_product_screeen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  static const routeName = "/products_screen";

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          backgroundColor: ColorsApp.primaryColor,
          title: Text(
            "Products",
            style: TextStyles.defaultStyle.sizeAppbar.colorAppBarText,
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.fromLTRB(k12Padding, k24Padding, k12Padding, 0),
          child: Column(
            children: [
              TextFieldSearch(fieldText: searchController),
              const SizedBox(height: k24Padding),
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 13,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: k8Padding,
                      mainAxisSpacing: k16Padding,
                      childAspectRatio: 3.5 / 5,
                    ),
                    itemBuilder: (context, index) {
                      final MapEntry store = DemoData.demoStore.entries
                          .elementAt(
                              HelperRNG.randInt(DemoData.demoStore.length));
                      final MapEntry product = DemoData.demoProduct.entries
                          .elementAt(
                              HelperRNG.randInt(DemoData.demoProduct.length));
                      return CardItemProduct(
                        imgProduct: product.value,
                        nameProduct: product.key,
                        imgStore: store.value,
                        nameStore: store.key,
                        price: HelperRNG.randIntBetween(15, 200) * 1000,
                        quantity: HelperRNG.randInt(50),
                        discountPercent: 10 + HelperRNG.randDouble(40),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(DetailProductScreen.routeName);
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
