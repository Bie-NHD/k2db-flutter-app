import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import '../../../core/constant/text.dart';
import '../../../core/widgets/widget_itembutton.dart';
import '../../widgets/widget_custom_textformfield.dart';
import '../user/Modal/User.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_validation.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key, required this.user}) : super(key: key);

  static const routeName = "/transfer_screen";
  final User user;

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final User user = widget.user;

  // If user phone num found in db -> auto fill name and disable text-field
  bool enableUserName = true;

  // VALUES
  late final Map<String, TextEditingController> controllers = {
    'phone number': TextEditingController(),
    'name': TextEditingController(),
    'amount': TextEditingController(),
    'message': TextEditingController.fromValue(
        TextEditingValue(text: "${user.userName.toUpperCase()} chuyen tien")),
  };

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
                    onChanged: _onChanged,
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
                              const Text(
                                "Please check information before confirm",
                                style: TextStyles.defaultStyle,
                              ),
                            ],
                          ),
                        ),
                        CustomTextFormField(
                          controller: controllers['phone number'],
                          labelText: "Phone Number",
                          helperText: "The recipient's phone number",
                          hintText: "09XXXXXXX",
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              HelperValidation.validatePhoneNum(value),
                        ),
                        CustomTextFormField(
                            controller: controllers['name'],
                            labelText: "Name",
                            hintText: user.userName.toUpperCase(),
                            helperText: "The recipient's name",
                            enabled: enableUserName,
                            validator: (value) =>
                                HelperValidation.validateTextField(value,
                                    message: "Name must be filled")),
                        CustomTextFormField(
                            controller: controllers['amount'],
                            labelText: "Amount",
                            hintText: 20000.0.toFormatMoney(),
                            helperText: "The recipient's name",
                            keyboardType: TextInputType.number,
                            validator: (value) =>
                                HelperValidation.validateAmount(value,
                                    userBalance: user.userBalance)),
                        CustomTextFormField(
                          controller: controllers['message'],
                          labelText: "Message",
                          hintText: user.userName.toUpperCase(),
                          helperText: "Message to the recipient",
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
                  child: ButtonFill(
                    text: 'Confirm',
                    color: ColorsApp.primaryColor,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        _showConfirmDialog(context);
                      }
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

  void _onChanged() {
    formKey.currentState!.validate();
  }

  String? _validateName(String? value) {
    if (value == null || value == "") {
      return "Name must be filled";
    }
    return null;
  }

  Future _showConfirmDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          String content(MapEntry<String, TextEditingController> e) {
            switch (e.key) {
              case ('phone number'):
                return paddingPhoneNum(e.value.text)!;
              case ('name'):
                return e.value.text.toUpperCase();
              case ('amount'):
                return double.parse(e.value.text).toFormatMoney();
              case ('message'):
                if (e.value.text.isEmpty) return "None";
            }
            return (e.value.text.length > 15)
                ? '${e.value.text.substring(0, 12)}...'
                : e.value.text;
          }

          return BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: SimpleDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadiusMin)),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("CONFIRMATION"),
                      Text(
                        "Please review your transaction info",
                        style: TextStyles.defaultStyle.sizeMin,
                      )
                    ],
                  ),
                  children: [
                    for (MapEntry<String, TextEditingController> e
                        in controllers.entries)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: k16Padding, vertical: k8Padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${e.key.toUpperCase()}: ",
                              style: TextStyles.defaultStyle.semiBold,
                            ),
                            Text(content(e)),
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(k12Padding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(k12Padding),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorsApp.backgroundDark),
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadiusMin)),
                              child: const Text("Cancel"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              //TODO Navigate to transaction screen
                            },
                            child: Container(
                              padding: const EdgeInsets.all(k12Padding),
                              decoration: BoxDecoration(
                                color: ColorsApp.secondaryColor,
                                borderRadius:
                                    BorderRadius.circular(kBorderRadiusMin),
                              ),
                              child: Text(
                                "Confirm",
                                style: TextStyles.defaultStyle.colorAppBarText,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]));
        });
  }

  String? paddingPhoneNum(String? str) {
    return str?.replaceRange(4, str.length, "*" * (str.length - 4));
  }
}
