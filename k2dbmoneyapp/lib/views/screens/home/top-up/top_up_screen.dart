import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/widgets/widget_card_itemBank.dart';
import 'package:k2dbmoneyapp/core/widgets/widget_itembutton.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({Key? key}) : super(key: key);

  static const String routeName = '/top_up_screen';

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  final fieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
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
                    23239000.0.toFormatMoney(),
                    style: TextStyles.defaultStyle.sizeAppbar,
                  )
                ],
              ),
              const SizedBox(height: k8Padding),
              TransferTextField(
                controller: fieldText,
                labelText: "Amount",
                hintText: 10000.0.toFormatMoney(),
                hideCounter: true,
                keyboardType: TextInputType.number,
                validator: validateAmount,
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
                    if (fieldText.text.isEmpty) {
                      print("Field null");
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

String? validateAmount(String? value) {
  if (value == null || value == "") {
    return "Amount must be filled";
  }
  if (double.parse(value) < 10000) {
    return "Must be above " + 10000.0.toFormatMoney();
  }
  return "1q23";
}

class TransferTextField extends StatelessWidget {
  final String? hintText;
  final String labelText;
  final String? helperText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool hideCounter;
  final TextEditingController? controller;

  const TransferTextField(
      {super.key,
      this.hintText,
      required this.labelText,
      this.helperText,
      // this.initialValue,
      this.keyboardType,
      this.validator,
      this.enabled = true,
      this.hideCounter = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(k12Padding),
      child: TextFormField(
        controller: controller,
        maxLength: 100,
        enabled: enabled,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          helperText: helperText ?? "",
          hintText: hintText ?? "",
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsApp.tertiaryColors),
            borderRadius: BorderRadius.circular(kBorderRadiusMin),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorsApp.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(kBorderRadiusMin),
          ),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyles.defaultStyle.bold.sizeTitleAndButton,
          counter: hideCounter ? const SizedBox.shrink() : null,
        ),
      ),
    );
  }
}
