import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/widgets/widget-text-field-search.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/views/screens/store/Widgets/map_screen.dart';
import 'package:k2dbmoneyapp/views/screens/store/Widgets/widget_card_itemstore.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../core/constant/text.dart';
import 'Widgets/detail_store_screen.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);
  static const routeName = "/store_screen";

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final fieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 2,
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: ColorsApp.primaryColor,
            title: Text(
              "Store",
              style:
                  TextStyles.defaultStyle.semiBold.sizeAppbar.colorAppBarText,
            ),
            actions: [
              IconButton(
                padding: const EdgeInsets.all(k12Padding),
                onPressed: () {
                  Navigator.of(context).pushNamed(MapScreen.routeName);
                },
                icon: const Icon(
                  FontAwesomeIcons.map,
                  size: kIconSize - 2,
                ),
                tooltip: "Map",
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: k12Padding, vertical: k12Padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFieldSearch(fieldText: fieldText, hintText: "Search Store"),
              const SizedBox(height: k12Padding,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                      SizedBox(width: k12Padding/2,),
                      Text("Cửa hàng gần bạn"
                        ,style: TextStyle(
                          fontSize: k14Padding,
                          fontWeight: FontWeight.bold,
                        ),)]),
                  const SizedBox(height: k12Padding,),
                  Expanded(
                    child: ListView.builder(
                    itemCount: 2,
                    itemBuilder:  (context,index)=>
                        CardItemStore(
                          imageStore: HelperAssets.logoBachHoaXanh,
                          nameStore: "Bách Hóa Xanh",
                          addressStore: "451 Lê Văn Việt, Tăng Nhơn Phú A, Tp Thủ Đức, Tp Hồ Chí Minh",
                          distanceStore: 0.01,
                          onTap: () {
                            Navigator.of(context).pushNamed(DetailStoreScreen.routeName);
                          },
                        ),
                  ),
                ),
                const SizedBox(height: k12Padding,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(width: k12Padding/2,),
                    Text("Các cửa hàng khác"
                      ,style: TextStyle(
                        fontSize: k14Padding,
                        fontWeight: FontWeight.bold,
                      ),),],),
                const SizedBox(height: k12Padding,),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder:  (context,index)=>
                        CardItemStore(
                          imageStore: HelperAssets.logoBachHoaXanh,
                          nameStore: "Bách Hóa Xanh",
                          addressStore: "451 Lê Văn Việt, Tăng Nhơn Phú A, Tp Thủ Đức, Tp Hồ Chí Minh",
                          distanceStore: 0.01,
                          onTap: () {
                             Navigator.of(context).pushNamed(DetailStoreScreen.routeName);
                          },
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
        ),
      ),
    ),
    );
  }
}
