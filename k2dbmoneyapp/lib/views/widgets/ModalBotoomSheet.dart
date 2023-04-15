import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_item_history.dart';

import '../../core/constant/color.dart';
import '../../core/constant/dimension.dart';
import '../../core/constant/text.dart';
import '../screens/statistic/statistic_main.dart';

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
            IconButton(onPressed: () {
              Navigator.pop(context, Statistic());
            }, icon: const Icon(FontAwesomeIcons.xmark, color: ColorsApp.backgroundDark, size: kIconSize)),
            Text('Lịch sử giao dịch', style: TextStyles.defaultStyle.bold.colorDefaultText.sizeAppbar,),
            Visibility(visible: false,child: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back))),
          ],
        ),
        const Divider(
          thickness: k8Margin / 5,
          height: 0,
          color: ColorsApp.primaryColor,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: k12Margin, horizontal: k12Margin),
          alignment: Alignment.centerLeft,
          child: const Text('Mã giao dịch: 0000'),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: k12Padding, vertical: k8Padding / 2),
            child: TransactionHistory(money: 521000, time: DateTime.now(), idAccountTake: "0000000",
              title: 'Vo Che Bang chuyen tien nhau hom ngay 8 thang 3 cho chi Mii iu dauuuuuuuuuuuuuuuuuu',)
        )
      ],
    );
  }
}

class TransactionHistory extends StatelessWidget {
  final String? idAccountSend;
  final String idAccountTake;
  final double money;
  final String ? title;
  final DateTime time;
  const TransactionHistory({Key? key, this.idAccountSend, required this.money, required this.time, required this.idAccountTake ,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Table(
      children: [
        TableRow(
          children: [
            Container(
              width: size.width * 0.5,
              height: size.height * 0.08,
              child: Text('Từ tài khoản', style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.regular,),
            ),
            Container(
              width: size.width * 0.5,
              child: Text(idAccountSend??"", style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.regular,),
            )
          ],
        ),
        TableRow(
          children: [
            Container(
              width: size.width * 0.5,
              height: size.height * 0.08,
              child: Text('Đến tài khoản', style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.regular,),
            ),
            Container(
              width: size.width * 0.5,
              child: Text(idAccountTake, style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.regular,),
            )
          ],
        ),
        TableRow(
          children: [
            Container(
              width: size.width * 0.5,
              height: size.height * 0.08,
              child: Text('Số tiền', style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.regular,),
            ),
            Container(
              width: size.width * 0.5,
              child: Text(money.toFormatMoney(), style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.regular,),
            )
          ],
        ),
        TableRow(
          children: [
            Container(
              width: size.width * 0.5,
              height: size.height * 0.09,
              child: Text('Nội dung', style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.regular,),
            ),
            Container(
              width: size.width * 0.5,
              height: size.height * 0.1,
              child: Text(title??'', style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.regular,maxLines: 3, overflow: TextOverflow.ellipsis,),

            )
          ],
        ),
        TableRow(
          children: [
            Container(
              width: size.width * 0.5,
              height: size.height * 0.08,
              child: Text('Thời gian', style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.regular,),
            ),
            Container(
              width: size.width * 0.5,
              child: Text(DateFormat('dd/MM/yyyy HH:mm:ss').format(time), style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.regular,),
            )
          ],
        )
      ],
    );
  }
}