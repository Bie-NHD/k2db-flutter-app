import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/core/widgets/widget_card_itemproduct.dart';
import 'package:k2dbmoneyapp/views/screens/home/detail_product_screeen.dart';

class DetailProductsStoreScreen extends StatefulWidget {
  const DetailProductsStoreScreen({Key? key}) : super(key: key);
  static const routeName = "/detailProductsStore_screen";
  @override
  State<DetailProductsStoreScreen> createState() => _DetailProductsStoreScreenState();
}

class _DetailProductsStoreScreenState extends State<DetailProductsStoreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: (){},
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Stack(
                 children: [
                   Positioned(
                       top: k20Padding,
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
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       ItemDetailProductsStore(nameStore: "Điện máy xanh",timeEnd: "11:00",timeStart: "7:00",addressStore: "451 Lê Văn Việt, Tăng Nhơn Phú A, Tp Thủ Đức, Tp Hồ Chí Minh"),
                       Container(
                         padding: const EdgeInsets.all(
                             k8Padding),
                         margin: const EdgeInsets.only(
                             bottom: k12Padding),
                         decoration: BoxDecoration(
                            color: ColorsApp.backgroundLight,
                           borderRadius: BorderRadius.circular(kBorderRadiusMin),
                         ),
                         child: Row(
                           children: [
                             ClipRRect(
                               borderRadius: BorderRadius.circular(kBorderRadiusMax),
                               child: Image.asset(
                                 HelperAssets.logoBrandStore,
                                 width: 190,
                                 height: 150,
                                 fit: BoxFit.cover,
                                 alignment: Alignment.center,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   )
                 ],
               ),
               Container(
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.fill)),
                       TextButton(
                         onPressed: () {},
                         child: Wrap(
                           direction: Axis.horizontal,
                           spacing: k8Padding,
                           children: [
                             const Icon(
                               FontAwesomeIcons.fire,
                               size: kIconSize,
                               color: ColorsApp.statusErrorColor,
                             ),
                             Text("Best Selling",
                               style: TextStyle(
                                 color: ColorsApp.primaryColor,
                               ),
                             )
                           ],
                         ),
                       ),
                       TextButton(
                         onPressed: () {},
                         child: Wrap(
                           direction: Axis.horizontal,
                           spacing: k8Padding,
                           children: [
                             const Icon(
                               FontAwesomeIcons.fire,
                               size: kIconSize,
                               color: ColorsApp.statusErrorColor,
                             ),
                             Text("Price",
                               style: TextStyle(
                                 color: ColorsApp.primaryColor,
                               ),
                             )
                           ],
                         ),
                       ),
                       TextButton(
                         onPressed: () {},
                         child: Wrap(
                           direction: Axis.horizontal,
                           spacing: k8Padding,
                           children: [
                             const Icon(
                               FontAwesomeIcons.fire,
                               size: kIconSize,
                               color: ColorsApp.statusErrorColor,
                             ),
                             Text("Price",
                               style: TextStyle(
                                 color: ColorsApp.primaryColor,
                               ),
                             )
                           ],
                         ),
                       ),
                       TextButton(
                         onPressed: () {},
                         child: Wrap(
                           direction: Axis.horizontal,
                           spacing: k8Padding,
                           children: [
                             const Icon(
                               FontAwesomeIcons.fire,
                               size: kIconSize,
                               color: ColorsApp.statusErrorColor,
                             ),
                             Text("All",
                               style: TextStyle(
                                 color: ColorsApp.primaryColor,
                               ),
                             )
                           ],
                         ),
                       ),
                     ],
               )),
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
                   itemBuilder: (context, index) {
                     return Padding(
                         padding: EdgeInsets.only(
                         right: k8Padding,
                         left: index == 0 ? k8Padding : 0),
                     child:CardItemProduct(
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
class ItemDetailProductsStore extends StatelessWidget {
  final String nameStore;
  final String timeStart;
  final String timeEnd;
  final String addressStore;
  const ItemDetailProductsStore({
    Key? key,
    required this.nameStore,
    required this.timeStart,
    required this.timeEnd,
    required this.addressStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: k14Padding,vertical: k24Padding*7/2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$nameStore ",style: TextStyle(color: Colors.deepOrangeAccent,fontSize: k24Padding)),
              Text(addressStore.length<=25? addressStore : addressStore.substring(0,24).padRight(25+3,'.')),
              Text("Giờ mở cửa : $timeStart - $timeEnd"),
            ],
          ),
        ),
      ],
    );
  }
}