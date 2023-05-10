import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';

import 'package:k2dbmoneyapp/views/widgets/widget_card_gift.dart';

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
                giftDescription: "Quà tặng của chương trình khuyến mãi là gói ưu đãi giảm giá lên đến 50% tối đa 100.000đ cho đơn hàng từ 100.000đ. Đây là cơ hội tuyệt vời để khách hàng tiết kiệm chi phí mua sắm và trải nghiệm sản phẩm chất lượng từ cửa hàng của chúng tôi. Đồng thời, chúng tôi cũng muốn gửi tới khách hàng những lời cảm ơn chân thành vì đã tin tưởng và lựa chọn sản phẩm của chúng tôi.",
                usingGift: "Để sử dụng khuyên mãi.Bạn hãy đến cửa hàng và chọn sản phẩm bạn muốn mua có hỗ trợ áp dụng ưu đãi. Giá sản phẩm sẽ tự động được giảm theo chương trình khuyến mãi của cửa hàng mà không cần thông báo cho nhân viên.",
              ),
            ],
          ),
        ),
    );
  }
}