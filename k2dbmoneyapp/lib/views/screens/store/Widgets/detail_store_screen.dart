import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/views/screens/store/Widgets/detail_products_store_screen.dart';
import 'package:k2dbmoneyapp/views/screens/store/Widgets/typical_products.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailStoreScreen extends StatefulWidget {
  const DetailStoreScreen({Key? key}) : super(key: key);
  static const routeName = "/detailStore_screen";
  @override
  State<DetailStoreScreen> createState() => _DetailStoreScreenState();
}

class _DetailStoreScreenState extends State<DetailStoreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){},
          child: Scaffold(
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 300,
                         width: 500,
                         child:Container(
                           child : HelperImage.loadFromAsset(
                             HelperAssets.detailProduct,
                             fit: BoxFit.cover,
                           ),
                         )
                        ),
                      Positioned(
                        top: k20Padding,
                        right: k12Padding,
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
                  ],
                ),
                  const ItemDetailStore(
                    nameStore: "Điện máy xanh",
                    addressStore: "451 Lê Văn Việt, Tăng Nhơn Phú A, Tp Thủ Đức, Tp Hồ Chí Minh 451 Lê Văn Việt, Tăng Nhơn Phú A, Tp Thủ Đức, Tp Hồ Chí Minh",
                    telNumber: "0901933559",
                    timeStart: "7:00",
                    timeEnd: "11:00",
                  ),
                  const SizedBox(height: k12Padding,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: k12Padding),
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sản phẩm tiêu biểu"),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushNamed(DetailProductsStoreScreen.routeName);
                            },
                            child: Text("Xem tất cả"),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: k24Padding,),
                  Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                            height: 140,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        right: k8Padding,
                                        left: index == 0 ? k8Padding : 0),
                                    child: TypicalProducts(
                                            imgProduct: HelperAssets.logoBrandStore,
                                            nameProduct: "Sữa ông thọ",
                                            discountPrice: 200000,
                                            price: 100000,
                                            discountPercent: 20,
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed(DetailStoreScreen.routeName);
                                      },
                                    ),
                                  );
                                }),
                          )),
                    ],
                  ),
              ],
                ),
            ),
    ),
    );
  }
}

class ItemDetailStore extends StatelessWidget {
  final String nameStore;
  final String timeStart;
  final String timeEnd;
  final String addressStore;
  final String  telNumber;
  const ItemDetailStore({
    Key? key,
    required this.nameStore,
    required this.timeStart,
    required this.timeEnd,
    required this.addressStore,
    required this.telNumber,
  }) : super(key: key);
  Future<void> _makePhoneCall() async {
    if (await launch('tel://$telNumber')) {
      await launch('tel://$telNumber');
    } else {
      throw 'Could not launch phone call';
    }
  }
  void _showConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Make phone call?'),
        content: Text('Do you want to call $nameStore at $telNumber?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _makePhoneCall();
              Navigator.pop(context);
            },
            child: Text('Call'),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: k14Padding,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: k12Padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$nameStore: "),
              Text("Giờ mở cửa : $timeStart - $timeEnd"),
            ],
          ),
        ),
        SizedBox(height: k12Padding,),
        ListTile(
          leading: Icon(Icons.add_location_sharp),
          title: Text(addressStore.length<=82? "$addressStore" : addressStore.substring(0,81).padRight(82+3,'.')),
          onTap:  () { },
        ),
        const Divider(
          indent: k12Padding,
          endIndent: k12Padding,
          height: k24Padding,
          thickness: 1,
        ),
        ListTile(
          leading: Icon(Icons.add_circle),
          title: Text("Thêm vào danh sách ưu thích "),
          onTap:  () { },
        ),
        const Divider(
          indent: k12Padding,
          endIndent: k12Padding,
          height: k24Padding,
          thickness: 1,
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text("Liên hệ $nameStore :$telNumber"),
            onTap: (){_showConfirmDialog(context);},
        ),
        const Divider(
          indent: k12Padding,
          endIndent: k12Padding,
          height: k24Padding,
          thickness: 1,
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text("Chia sẻ với bạn bè "),
          onTap:  () { },
        ),
        const Divider(
          indent: k12Padding,
          endIndent: k12Padding,
          height: k24Padding,
          thickness: 1,
        ),
      ],
    );
  }
}
