import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_validation.dart';
import 'package:k2dbmoneyapp/core/widgets/widget_card_itemBank.dart';
import 'package:k2dbmoneyapp/core/widgets/widget_itembutton.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_custom_textformfield.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({Key? key}) : super(key: key);

  static const String routeName = '/top_up_screen';

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  // VARIABLES
  final fieldText = TextEditingController();
  var userBalance = 39000.0;
  FormState? formState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        centerTitle: true,
        title: Text(
          "Top up",
          style: TextStyles.defaultStyle.colorAppBarText.sizeAppbar.semiBold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            k12Padding, k16Padding, k12Padding, k16Padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Current balance:",
                  style: TextStyles.defaultStyle.semiBold,
                ),
                const SizedBox(
                  width: k8Padding / 2,
                ),
                Text(
                  userBalance.toFormatMoney(),
                  style: TextStyles.defaultStyle.sizeAppbar,
                )
              ],
            ),
            const SizedBox(height: k8Padding),
            Form(
              child: Builder(builder: (context) {
                formState = Form.maybeOf(context);
                return CustomTextFormField(
                  labelText: "Amount",
                  hintText: 10000.0.toFormatMoney(),
                  keyboardType: TextInputType.number,
                  validator: (value) => HelperValidation.validateAmount(value,
                      userBalance: userBalance),
                );
              }),
            ),
            Text("Account/Card",
                style: TextStyles
                    .defaultStyle.sizeAppbar.semiBold.colorDeepBlueText),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => CardItemBank(
                      imgBank: HelperAssets.imgVietcombank,
                      nameBank: "Techcombank")),
            ),
            ButtonFill(
                text: "Continue",
                onTap: () {
                  formState?.validate();
                })
          ],
        ),
      ),
    );
  }
}
