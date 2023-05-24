import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';

import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';

import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_item_detail_exchange_gift.dart';

class DetailExchangeGiftScreen extends StatefulWidget {
  const DetailExchangeGiftScreen({Key? key}) : super(key: key);
  static const routeName = "/detail_exchange_gift_screen";

  @override
  State<DetailExchangeGiftScreen> createState() => _DetailExchangeGiftScreenState();
}

class _DetailExchangeGiftScreenState extends State<DetailExchangeGiftScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height*0.25), // Chiều cao tùy chỉnh của AppBar
          child: AppBar(
            backgroundColor: Colors.transparent, // Cho phép hiển thị ảnh nền
            elevation: 0, // Không có đường viền bóng ở phía dưới của AppBar
            flexibleSpace: Image.asset(
              HelperAssets.imgThitHeo,
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
        body: const ItemDetailExchangeGift(
          nameGift: "Thịt Heo siêu nạc",
          giftExpirationDate: "Ngày hết hạn: 31/13/2023",
          priceGift: "10000 Point",
          giftDetail: "Heo giống siêu nạc là một trong những loại thịt heo được ưa chuộng nhất trên thị trường hiện nay. Loại thịt này có đặc điểm là có tỷ lệ mỡ thấp và tỉ lệ nạc cao, cho ra sản phẩm thịt thơm ngon, mềm mại và ít mỡ hơn so với các loại thịt heo thông thường. Trên thị trường hiện nay, có một số giống heo giống siêu nạc được nhiều nhà nông lựa chọn nuôi để đáp ứng nhu cầu của thị trường. Trong số đó, giống heo Landrace là một trong những giống heo phổ biến nhất. Giống heo này có nguồn gốc từ Đan Mạch, có lông màu trắng tuyền, đầu nhỏ, tai to, mông đùi to và chân nhỏ. Heo Landrace được nuôi để cho ra sản phẩm thịt có chất lượng cao, thịt thơm ngon, ít mỡ và thịt có độ dai vừa phải.",
          conditionsOfUse: "Mỗi thành viên chỉ được đổi điểm phần quà này mỗi một lần trong một tháng. Áp dụng đối với tất cả loại heo trong cửa hàng.",
        ),
        bottomNavigationBar: BottomAppBar(
          color: ColorsApp.backgroundLight, // màu của chân trang
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          Opacity(
                            opacity: 0.7,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.black,
                            ),
                          ),
                          AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text(
                              'Successfully redeem points',
                              style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.bold,
                            ),
                            content: Text(
                              'You have successfully redeemed your points! Your points will be deducted once you have picked up the item at the store and will not incur any further costs for you once you have done so. Thank you for using our shopping service at our store! Thank you! See you again!',
                              style: TextStyles.defaultStyle.sizeDefault.colorDefaultText.regular,
                              textAlign: TextAlign.justify,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
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
                    "Change",
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