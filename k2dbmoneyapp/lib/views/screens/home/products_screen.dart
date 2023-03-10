import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/widgets/widget-text-field-search.dart';
import 'package:k2dbmoneyapp/core/widgets/widget_card_itemproduct.dart';

import '../../../core/helpers/helper_asset.dart';
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: k8Padding,
                    mainAxisSpacing: k16Padding,
                    childAspectRatio: 4 / 5,
                  ),
                  itemBuilder: (context, index) => CardItemProduct(
                    imgProduct: HelperAssets.product,
                    nameProduct: "Lê Hàn Quốc siêu rẻ, siêu ngon bao ăn",
                    imgStore: HelperAssets.logoBrandStore,
                    nameStore: "Bách Hóa Xanh",
                    price: 100000,
                    quantity: 12500,
                    discountPercent: 20,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(DetailProductScreen.routeName);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
