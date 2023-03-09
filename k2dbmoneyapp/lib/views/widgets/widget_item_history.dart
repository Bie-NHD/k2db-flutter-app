
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import '../../core/constant/color.dart';
import '../../core/constant/dimension.dart';
import '../../core/constant/text.dart';
import '../../core/widgets/icon_textlink.dart';

class Transaction_History extends StatelessWidget {
  final String? title;
  final double price;
  final DateTime dateTime;
  final bool? isBuying;
  final Function() onTap;
  const Transaction_History({Key? key, required this.dateTime, this.title, required this.price, this.isBuying, required this.onTap})
      : super(key: key);
  getStateIsBuying() => isBuying;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child:  Column(
        children: [
          const Divider(
            height: 0,
            thickness: k8Padding / 4,
            indent: 0,
            endIndent: k12Padding,
          ),
          const SizedBox(height: k8Margin),
          Row(
            children: [
              (isBuying??false) ? const Icon(
                    FontAwesomeIcons.store,
                    size: kIconSize,
                    color: ColorsApp.primaryColor,
                  ) : const SizedBox(width: kIconSize, height: kIconSize),
              const SizedBox(width: k14Padding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime),
                    style: TextStyles.defaultStyle.sizeTitleAndButton.colorHintText.regular,
                  ),
                  SizedBox(
                    width: size.width * 0.55,
                    child: Text(title ?? '...',
                      style: TextStyles.defaultStyle.regular.sizeTitleAndButton.regular,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: k8Margin),
                ],
              ),
              const Spacer(),
              Text(price.toFormatMoney(),
                style: TextStyles.defaultStyle.bold.sizeTitleAndButton.colorRedText,
              ),
              const SizedBox(width: k8Margin / 2),
              IconTextLink(title: '', onTap: () {}, sizeIcon: kIconSize,)
            ],
          ),
        ],
      ),
    );
  }
}


class BottomSheetHelper{
  static  showBottomSheet(BuildContext context){
    return  showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return const ModalBottomSheet();
        }
    );
  }
}

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.xmark, color: ColorsApp.hintTextColor, size: kIconSize * 0.8)),
            Text('Lịch sử giao dịch', style: TextStyles.defaultStyle.semiBold.colorDefaultText.sizeAppbar,),
            Visibility(visible: false,child: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back))),
          ],
        ),
        const Divider(
          thickness: k8Margin / 3 ,
          height: 0,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: k8Margin, horizontal: k12Margin),
            alignment: Alignment.centerLeft,
            child: const Text('Mã hóa đơn: 0000'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: k12Padding, vertical: k8Margin / 2),
          child: Column(
            children: const [
              ProductHistory(account: 1, nameProduct:' Xoai thai', price: 10000),
              ProductHistory(account: 1, nameProduct:' Mit to nu sieu ngon', price: 100000),
              ProductHistory(account: 3, nameProduct:' Sau rieng thuong hang mui to', price: 100000),
            ],
          ),
        )
      ],
    );
  }
}

class ProductHistory extends StatelessWidget {
  final int account;
  final String nameProduct;
  final double price;
  final double? total;
  const ProductHistory({Key? key, required this.account, required this.nameProduct, required this.price, this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width:size.width * 0.5,
          alignment: Alignment.centerLeft,
            child: Text('$account * $nameProduct', style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.regular, overflow: TextOverflow.ellipsis,),
        ),
        Container(
            width: size.width * 0.2,
          alignment: Alignment.centerRight,
            child: Text(price.toFormatMoney(), style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.regular, ),
        ),
        Container(
            width: size.width * 0.2,
            alignment: Alignment.centerRight,
            child: Text((price * account).toFormatMoney(), style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.regular,),
        )
      ],
    );
  }
}

