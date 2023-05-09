import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/screens/home/transfer_screen.dart';
import 'package:k2dbmoneyapp/views/screens/user/Modal/User.dart';

import '../../../core/helpers/helper_validation.dart';
import '../../widgets/widget_custom_textformfield.dart';

class UserEditScreen extends StatefulWidget {
  UserEditScreen({super.key, required this.user});

  final User user;
  late bool isSaved = true;
  static const routeName = "/Edit_screen";

  @override
  State<UserEditScreen> createState() => _UserEditScreenState();
}

class _UserEditScreenState extends State<UserEditScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final User user = widget.user;
  late final List<DropdownMenuItem> genderMenuItem = [
    const DropdownMenuItem(
      value: Gender.male,
      child: Text(Gender.male),
    ),
    const DropdownMenuItem(
      value: Gender.female,
      child: Text(Gender.female),
    ),
    const DropdownMenuItem(
      value: Gender.enby,
      child: Text(Gender.enby),
    ),
    const DropdownMenuItem(
      value: Gender.blank,
      child: Text("Not identifying"),
    )
  ];

  late String dropdownGenderValue = user.gender;

  //TODO: Data passing between screens behaviors

  @override
  void initState() {
    super.initState();
    widget.isSaved = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundLight,
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
            size: kIconSize,
          ),
          onPressed: () {
            widget.isSaved
                ? Navigator.pop(context)
                : showDialog(
                    context: context,
                    builder: ((context) => showExitDialog(context)),
                  );
          },
        ),
        actions: [
          TextButton.icon(
            icon: const Icon(
              FontAwesomeIcons.solidFloppyDisk,
              color: ColorsApp.backgroundLight,
            ),
            label: Text(
              "Save",
              style:
                  TextStyles.defaultStyle.sizeDefault.colorAppBarText.semiBold,
            ),
            onPressed: () {
              if (widget.isSaved) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("No changes to save"),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else {
                _onSave();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Changes Saved Successfully!"),
                    duration: Duration(seconds: 2),
                    backgroundColor: ColorsApp.statusSuccessColor,
                  ),
                );
              }
            },
          ),
          const SizedBox(
            width: k12Padding,
          )
        ],
      ),
      body: CustomScrollView(slivers: [
        SliverSafeArea(
            sliver: SliverPadding(
          padding: const EdgeInsets.all(k24Padding),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                        radius: k24Padding * 3,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          user.userAvatar,
                          semanticLabel: "User avatar",
                        )),
                    Positioned(
                      left: -0.5,
                      bottom: -0.5,
                      child: GestureDetector(
                        onTap: () {
                          //TODO change user avatar
                        },
                        child: const CircleAvatar(
                          backgroundColor: ColorsApp.backgroundLight,
                          child: Icon(
                            FontAwesomeIcons.camera,
                            color: ColorsApp.primaryColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: k12Margin,
              ),
              Text(
                "User Information",
                style:
                    TextStyles.defaultStyle.colorDeepBlueText.sizeHeading.bold,
              ),
              const SizedBox(
                height: k12Margin,
              ),
              Text("isSaved = ${widget.isSaved}"),
              Form(
                key: formKey,
                onChanged: _onChanged,
                child: Column(
                  children: [
                    CustomTextFormField(
                      labelText: "Username",
                      controller: TextEditingController.fromValue(
                          TextEditingValue(text: user.userName)),
                      validator: (value) =>
                          HelperValidation.validateTextField(value),
                      prefixIcon: FontAwesomeIcons.user,
                      onSaved: (value) {
                        user.userName = value!;
                      },
                    ),
                    // Gender Dropdown
                    Padding(
                      padding: const EdgeInsets.only(bottom: k20Padding),
                      child: DropdownButtonFormField(
                        items: genderMenuItem,
                        value: dropdownGenderValue,
                        decoration: InputDecoration(
                          label: Text(
                            "Gender",
                            style: TextStyles.defaultStyle.colorDeepBlueText
                                .bold.sizeTitleAndButton,
                          ),
                          prefixIcon: const Icon(FontAwesomeIcons.genderless),
                          focusColor: ColorsApp.primaryColor,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: ColorsApp.tertiaryColors),
                            borderRadius:
                                BorderRadius.circular(kBorderRadiusMin),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: ColorsApp.primaryColor, width: 2),
                            borderRadius:
                                BorderRadius.circular(kBorderRadiusMin),
                          ),
                        ),
                        onChanged: (value) {
                          dropdownGenderValue = value!;
                          _onChanged();
                        },
                        onSaved: (_) {
                          setState(() {
                            user.gender = dropdownGenderValue;
                          });
                        },
                      ),
                    ),

                    CustomTextFormField(
                      labelText: "Phone Number",
                      prefixIcon: FontAwesomeIcons.phone,
                      controller: TextEditingController.fromValue(
                          TextEditingValue(text: user.security.phoneNum)),
                      validator: (value) =>
                          HelperValidation.validatePhoneNum(value),
                      onSaved: (value) {
                        user.security.phoneNum = value!;
                      },
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ))
      ]),
    );
  }

  showExitDialog(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5,
        sigmaY: 5,
      ),
      child: AlertDialog(
        icon: const Icon(
          FontAwesomeIcons.circleExclamation,
          color: ColorsApp.statusErrorColor,
          size: kIconSize * 2,
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Data have not saved\nProceed to Exit?",
              style: TextStyles.defaultStyle.colorDefaultText.semiBold,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.of(context).pop(widget.user);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.circleXmark,
                    color: ColorsApp.statusErrorColor,
                    size: kIconSize,
                  ),
                  label: Text(
                    "Do not Save",
                    style: TextStyles
                        .defaultStyle.sizeDefault.colorRedText.semiBold,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    _onSave();
                    Navigator.of(context, rootNavigator: true).pop(widget.user);
                    Navigator.of(context).pop(widget.user);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Changes Saved Successfully!"),
                        duration: Duration(seconds: 2),
                        backgroundColor: ColorsApp.statusSuccessColor,
                      ),
                    );
                  },
                  icon: const Icon(
                    FontAwesomeIcons.circleCheck,
                    color: ColorsApp.statusSuccessColor,
                    size: kIconSize,
                  ),
                  label: Text(
                    "Save Changes",
                    style: TextStyles
                        .defaultStyle.sizeDefault.colorGreenText.semiBold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _onSave() async {
    await _onChanged();
    formKey.currentState!.save();
  }

  _onChanged() {
    if (formKey.currentState!.validate()) {
      setState(() {
        widget.isSaved = !widget.isSaved;
      });
    }
  }
}
