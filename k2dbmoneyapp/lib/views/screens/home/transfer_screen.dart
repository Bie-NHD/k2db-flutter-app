import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_horizontal_button.dart';
import '../../../core/constant/text.dart';
import '../user/Modal/User.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key, required this.user}) : super(key: key);

  static const routeName = "/transfer_screen";
  final User user;

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late User user = widget.user;

  // If user phone num found in db -> auto fill name and disable text-field
  bool enableUserName = true;

  // VALUES
  // final Map<String, TextEditingController> controllers = {
  //   'phone number': TextEditingController(),
  //   'name': TextEditingController(),
  //   'amount': TextEditingController(),
  //   'message': TextEditingController(),
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundLight,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        centerTitle: true,
        title: Text(
          "Transfer",
          style: TextStyles.defaultStyle.sizeAppbar.colorAppBarText,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Form(
                    key: formKey,
                    onChanged: onChanged,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(k12Padding),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 2, left: 2, bottom: 2),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorsApp.secondaryColor),
                                child: const Center(
                                  child: Icon(
                                    FontAwesomeIcons.exclamation,
                                    color: ColorsApp.backgroundLight,
                                    size: kIconSize,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: k8Padding,
                              ),
                              Text(
                                "Please check information before confirm",
                                style: TextStyles.defaultStyle.colorGrayText,
                              ),
                            ],
                          ),
                        ),
                        TransferTextField(
                          // controller: controllers['phone number'],
                          labelText: "Phone Number",
                          helperText: "The recipient's phone number",
                          hintText: "09XXXXXXX",
                          keyboardType: TextInputType.number,
                          hideCounter: true,
                          validator: validatePhoneNum,
                        ),
                        TransferTextField(
                          // controller: controllers['name'],
                          labelText: "Name",
                          hintText: user.userName.toUpperCase(),
                          helperText: "The recipient's name",
                          enabled: enableUserName,
                          hideCounter: true,
                          validator: (value) {},
                        ),
                        TransferTextField(
                          // controller: controllers['amount'],
                          labelText: "Amount",
                          hintText: 20000.0.toFormatMoney(),
                          helperText: "The recipient's name",
                          keyboardType: TextInputType.number,
                          hideCounter: true,
                          validator: validateAmount,
                        ),
                        TransferTextField(
                          // controller: controllers['message'],
                          labelText: "Message",
                          hintText: user.userName.toUpperCase(),
                          helperText: "Message to the recipient",
                          initialValue:
                              "${user.userName.toUpperCase()} chuyen tien",
                          validator: (value) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(k12Padding),
                  child: HorizontalButtonLinkFill(
                    text: 'Confirm',
                    color: ColorsApp.primaryColor,
                    textColor: ColorsApp.backgroundLight,
                    hasAngleSymbol: false,
                    centerText: true,
                    onTap: () {
                      // showDialog(
                      //   context: context,
                      //   builder: ((context) => showConfirmDialog(context)),
                      // );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onChanged() {
    formKey.currentState!.validate();
  }

  String? validatePhoneNum(String? value) {
    if (UserController.validatePhoneNum(value!) == false) {
      return "Wrong phone number format";
    }
    return null;
  }

  String? validateAmount(String? value) {
    if (value == null || value == "") {
      return "Amount must be filled";
    }
    if (double.parse(value) > user.userBalance) {
      return "Amount exceeds current balance";
    }

    return null;
  }

  // showConfirmDialog(BuildContext context) {
  //   return BackdropFilter(
  //     filter: ImageFilter.blur(
  //       sigmaX: 5,
  //       sigmaY: 5,
  //     ),
  //     child: SimpleDialog(
  //       backgroundColor: ColorsApp.backgroundLight,
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(kBorderRadiusMax)),
  //       title: Column(
  //         children: const [
  //           Text("Confirmation"),
  //           Text("Please review your transaction info")
  //         ],
  //       ),
  //       children: [
  //         for (MapEntry e in controllers.entries)
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text("${e.key.toUpperCase()}: "),
  //               Text(e.value?.text ?? ""),
  //             ],
  //           )
  //       ],
  //     ),
  //   );
  // }
}

class TransferTextField extends StatelessWidget {
  const TransferTextField(
      {super.key,
      this.hintText,
      required this.labelText,
      this.helperText,
      this.initialValue,
      this.keyboardType,
      this.validator,
      this.enabled = true,
      this.hideCounter = false,
      this.controller});

  final String? hintText;
  final String labelText;
  final String? helperText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool hideCounter;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(k12Padding),
      child: TextFormField(
        controller: controller,
        maxLength: 100,
        enabled: enabled,
        validator: validator,
        initialValue: initialValue ?? "",
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
