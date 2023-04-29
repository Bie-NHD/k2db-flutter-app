import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';

import '../../../core/helpers/helper_asset.dart';
import '../../widgets/widget_card_gift.dart';

class DetailGiftScreen extends StatefulWidget {
  const DetailGiftScreen({Key? key}) : super(key: key);
  static const routeName = "/detail_gift_screen";

  @override
  State<DetailGiftScreen> createState() => _DetailGiftScreenState();
}

class _DetailGiftScreenState extends State<DetailGiftScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height*0.25), // Chiều cao tùy chỉnh của AppBar
            child: AppBar(
              backgroundColor: Colors.transparent, // Cho phép hiển thị ảnh nền
              elevation: 0, // Không có đường viền bóng ở phía dưới của AppBar
              flexibleSpace: Image.asset(
                HelperAssets.bannerProductPromotion,
                fit: BoxFit.cover,
              ),
              leading: Padding(
                padding: const EdgeInsets.only(left: k12Padding, top: k12Padding),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), // độ cong của border
                    border: Border.all(color: ColorsApp.backgroundDark, width: 1),
                    color: ColorsApp.backgroundLight,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      size: kIconSize - 2,
                    ),
                    color: ColorsApp.backgroundDark,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          ),
          body: ListView(
            children: const [
              CardGift(
                titleGift:
                "Giảm đến 45% cho các thiết bị gia dụng",
                timeGift: "Thời gian: 31/13/2023 - 32/13/2023",
                giftDetailTime:
                "Thời gian: Từ  7h00 ngày 31/13/2023 đến 17h00 ngày 32/13/2023",
                giftDetailObject:
                "Đối tượng: Khách hàng lần đầu thanh toán hóa đươn bằng AmazonPay",
                giftDetailGift:
                "Quà tặng: Gói ưu đãi giảm giá lên đến 50% tối đa 100.000đ cho đơn hàng từ 100.000đ + FreeShip ",
                giftDescription: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                usingGift: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: ColorsApp.backgroundLight, // màu của chân trang
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/help_promotion_screen");
                    // xử lý sự kiện khi nhấn nút bấm
                  },
                  child: Container(
                    height: size.height* 0.05,
                    // margin: const EdgeInsets.symmetric(horizontal: 0, vertical: k8Margin/2),
                    padding: const EdgeInsets.symmetric(horizontal: k24Padding*3, vertical: k8Padding),
                    decoration: BoxDecoration(
                      color: ColorsApp.secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "USE",
                      style: TextStyles.defaultStyle.sizeAppbar.colorDefaultText.bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // vị trí của nút bấm
        ),
    );
  }
}