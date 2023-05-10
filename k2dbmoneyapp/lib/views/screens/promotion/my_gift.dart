import 'package:flutter/material.dart';

import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';

import 'package:k2dbmoneyapp/core/widgets/widget-text-field-search.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_item_promotion_program.dart';


class MyGiftScreen extends StatefulWidget {
  const MyGiftScreen({Key? key}) : super(key: key);
  static const routeName = "/my_gift_screen";

  @override
  State<MyGiftScreen> createState() => _MyGiftScreenState();
}

class _MyGiftScreenState extends State<MyGiftScreen> {

  final fieldText = TextEditingController();

  List<bool> isLiked = [false, false, false, false, false, false];
  List<bool> initialIsLiked = [false, false, false, false, false, false];
  @override
  void initState() {
    super.initState();
    initialIsLiked = List.from(isLiked);
  }

  void resetIsLiked() {
    setState(() {
      isLiked = List.from(initialIsLiked);
      for (int i = 0; i < itemList.length; i++) {
        if (isLiked[i]) {
          itemList.insert(0, itemList.removeAt(i));
          isLiked.insert(0, isLiked.removeAt(i));
        }
      }
    });
  }

  List<ItemPromotionProgram> itemList = List.generate(6, (index) {
    return ItemPromotionProgram(
      onTap: () {},
      onTapHeart: () {},
      textTitle: 'Giảm giá sản phẩm',
      textDescribe: 'Giảm giá sản phẩm - Giảm 50% cho hóa đơn từ 100.000VNĐ tối đa 50.000VNĐ',
      textDate: '31/13/2023',
    );
  });

  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar: null,
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,

        centerTitle: true,
        title: Text('My gift',
            style: TextStyles.defaultStyle.colorAppBarText.sizeAppbar.bold
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: ColorsApp.primaryColor, // Set the background color here
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: k12Padding,
                  vertical: k12Padding,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      TextFieldSearch(
                        fieldText: fieldText,
                        hintText: "Search Store",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return ItemPromotionProgram(
                    onTap: () {},
                    onTapHeart: () {
                      setState(() {
                        isLiked[index] = !isLiked[index];
                        if (isLiked[index]) {
                          itemList.insert(0, itemList.removeAt(index));
                          isLiked.insert(0, isLiked.removeAt(index));
                        } else {
                          itemList.add(itemList.removeAt(index));
                          isLiked.add(isLiked.removeAt(index));
                        }
                      });
                    },
                    colorHeart: isLiked[index] ? ColorsApp.statusErrorColor : ColorsApp.backgroundDark,
                    textTitle: itemList[index].textTitle,
                    textDescribe: itemList[index].textDescribe,
                    textDate: itemList[index].textDate,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}