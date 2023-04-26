import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/views/screens/user/Modal/User.dart';

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
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          stops: [0.45, 1],
          colors: [
            ColorsApp.backgroundLight,
            ColorsApp.statusNoteColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: ColorsApp.backgroundLight.withOpacity(0.5),
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
                style: TextStyles
                    .defaultStyle.sizeDefault.colorAppBarText.semiBold,
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(k24Padding),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: k24Padding * 3,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                            user.userAvatar,
                            semanticLabel: "User avatar",
                            // cacheHeight: k24Padding.toInt(),
                          ),
                        ),
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: k12Margin,
                  ),
                  Text(
                    "User Information",
                    style: TextStyles
                        .defaultStyle.colorDeepBlueText.sizeHeading.bold,
                  ),
                  const SizedBox(
                    height: k12Margin,
                  ),
                  Text("isSaved = ${widget.isSaved}"),

                  // User name
                  TextFormField(
                    initialValue: widget.user.userName,
                    decoration: InputDecoration(
                      label: Text(
                        "Username",
                        style: TextStyles.defaultStyle.colorDeepBlueText.bold
                            .sizeTitleAndButton,
                      ),
                      prefixIcon: const Icon(FontAwesomeIcons.user),
                      focusColor: ColorsApp.primaryColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: ColorsApp.primaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(kBorderRadiusMin),
                      ),
                    ),
                    validator: (value) => (value != null && value.isNotEmpty)
                        ? null
                        : "Must not be empty",
                    onSaved: (value) {
                      user.userName = value!;
                    },
                    onChanged: (value) {
                      _onChanged();
                    },
                  ),

                  // Gender Dropdown
                  DropdownButtonFormField(
                    items: genderMenuItem,
                    value: dropdownGenderValue,
                    decoration: InputDecoration(
                      label: Text(
                        "Gender",
                        style: TextStyles.defaultStyle.colorDeepBlueText.bold
                            .sizeTitleAndButton,
                      ),
                      prefixIcon: const Icon(FontAwesomeIcons.genderless),
                      focusColor: ColorsApp.primaryColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: ColorsApp.primaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(kBorderRadiusMin),
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
                  TextFormField(
                    initialValue: user.security.phoneNum,
                    decoration: InputDecoration(
                      label: Text(
                        "Phone Number",
                        style: TextStyles.defaultStyle.colorDeepBlueText.bold
                            .sizeTitleAndButton,
                      ),
                      prefixIcon: const Icon(FontAwesomeIcons.phone),
                      focusColor: ColorsApp.primaryColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: ColorsApp.primaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(kBorderRadiusMin),
                      ),
                    ),
                    validator: (value) {
                      UserController.validatePhoneNum(value!);
                    },
                    onSaved: (value) {
                      user.security.phoneNum = value!;
                    },
                    onChanged: (_) {
                      _onChanged();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
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

  _onSave() {
    final FormState form = formKey.currentState!;

    if (form.validate()) {
      setState(() {
        widget.isSaved = !widget.isSaved;
      });
      form.save();
    }
  }

  _onChanged() {
    widget.isSaved = !widget.isSaved;
  }
  //
  // _change_isSaved() {
  //   setState(() {
  //     widget.isSaved = !widget.isSaved;
  //   });
  // }
  //
  // _textField_onChange() {
  //   isSaved ? _change_isSaved() : null;
  // }
  // void callback()
}
