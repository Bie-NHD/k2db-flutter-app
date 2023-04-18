import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/widgets/widget-text-field-search.dart';
import 'package:k2dbmoneyapp/core/widgets/widget_itembutton.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/text.dart';

class Transaction_search extends StatefulWidget {
  const Transaction_search({Key? key}) : super(key: key);

  @override
  State<Transaction_search> createState() => _Transaction_searchState();
}
enum selection{All, In, Out}
class _Transaction_searchState extends State<Transaction_search> {
  final TextEditingController searchController = TextEditingController();
  selection? _select = selection.All;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsApp.backgroundLight,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsApp.primaryColor,
        title: Text("Transaction Search",
          style: TextStyles.defaultStyle.semiBold.sizeAppbar.colorAppBarText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(k12Padding, k20Padding, k12Padding, 0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            TextFieldSearch(fieldText: searchController),
            SizedBox(height: k16Padding,),
            Text('Thời gian', style: TextStyles.defaultStyle.colorDefaultText.semiBold.sizeTitleAndButton,),
            SizedBox(
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.8,
                      child: TextFormField(
                        decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            labelText: 'Chọn khoảng thời gian'
                        ),
                        style: TextStyles.defaultStyle.regular.colorHintText.sizeTitleAndButton,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.calendar)),
                  ],
                ),
              ),
            ),
            Divider(thickness: k8Margin / 4, height: k8Margin / 6, ),
            SizedBox(height: k16Padding ),
            Text('Nhập khoảng giá trị', style: TextStyles.defaultStyle.colorDefaultText.semiBold.sizeTitleAndButton,),
            SizedBox(
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: size.width * 0.4,
                        child: TextFormField(
                          initialValue: "0",
                          style: TextStyles.defaultStyle.regular.colorDefaultText.sizeTitleAndButton,
                        )
                    ),
                    Text('-'),
                    SizedBox(
                        width: size.width * 0.4,
                        child: TextFormField(
                          initialValue: "5000000",
                          style: TextStyles.defaultStyle.regular.colorDefaultText.sizeTitleAndButton,
                        )
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: k16Padding ),
            Text('Loại giao dịch', style: TextStyles.defaultStyle.colorDefaultText.semiBold.sizeTitleAndButton,),
            SizedBox(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.3,
                    height: size.height * 0.05,
                    child:
                    ListTile(
                      title: Text('All', style: TextStyles.defaultStyle.regular.colorDefaultText.sizeTitleAndButton,),
                      leading: Radio<selection>(
                        value: selection.All,
                        groupValue: _select,
                        onChanged: (selection? value) {
                          setState(() {
                            _select = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                    height: size.height * 0.05,
                    child: ListTile(
                      title: Text('In', style: TextStyles.defaultStyle.regular.colorDefaultText.sizeTitleAndButton,),
                      leading: Radio<selection>(
                        value: selection.In,
                        groupValue: _select,
                        onChanged: (selection? value) {
                          setState(() {
                            _select = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                    height: size.height * 0.05,
                    child: ListTile(
                      title: Text('Out', style: TextStyles.defaultStyle.regular.colorDefaultText.sizeTitleAndButton,),
                      leading: Radio<selection>(
                        value: selection.Out,
                        groupValue: _select,
                        onChanged: (selection? value) {
                          setState(() {
                            _select = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.4,),
            ButtonOutline(
              text: 'Tìm kiếm',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

