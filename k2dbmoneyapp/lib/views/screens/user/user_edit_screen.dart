import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/screens/user/Modal/User.dart';

class UserEditScreen extends StatefulWidget {
  UserEditScreen({super.key, required this.user});

  final User user;
  final bool isSaved = true;
  static const routeName = "/infoEdit_screen";

  // bool get isSaved => _isSaved;

  @override
  State<UserEditScreen> createState() => _UserEditScreenState();
}

class _UserEditScreenState extends State<UserEditScreen> {
  // _UserEditScreenState():isSaved = false;
  late bool isSaved;
  late List<Item> list;

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
          stops: [0.05, 0.45, 0.75, 1],
          colors: [
            ColorsApp.secondaryColor,
            ColorsApp.backgroundLight,
            ColorsApp.statusNoteColor,
            ColorsApp.primaryColor
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: ColorsApp.backgroundLight.withOpacity(0.5),
        appBar: AppBar(
          backgroundColor: ColorsApp.backgroundDark.withOpacity(0.5),
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
              isSaved
                  ? Navigator.pop(context)
                  : showDialog(
                      context: context,
                      builder: ((context) => showExitDialog(context)));
            },
          ),
          actions: [
            TextButton.icon(
              onPressed: () {
                if (isSaved) {
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
              icon: const Icon(
                FontAwesomeIcons.solidFloppyDisk,
                color: ColorsApp.backgroundLight,
              ),
              label: Text(
                "Save",
                style: TextStyles
                    .defaultStyle.sizeDefault.colorAppBarText.semiBold,
              ),
            ),
            const SizedBox(
              width: k12Padding,
            )
          ],
        ),
        body:
            // Container(
            //   padding: const EdgeInsets.only(
            //     top: k24Padding,
            //     left: k24Padding,
            //     right: k24Padding,
            //   ),
            // child:
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     for
            //   ],
            // ),
            SafeArea(
          child: Stack(
            children: [
              // Expanded(
              // child:
              ListView(
                children: [
                  Text(isSaved.toString()),
                  // Iterable.generate(list.length,(index)=>EditItem(item: list[index]))
                  for (Item index in list) EditItem(item: index)
                ],
                // )
              )
            ],
          ),
        ),
        // )
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
                  onPressed: () async {
                    await _onSave();
                    Navigator.of(context, rootNavigator: true).pop();
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
    setState(() {
      _change_isSaved();
    });
  }

  _change_isSaved() {
    setState(() {
      isSaved = !isSaved;
    });
  }

  _textField_onChange() {
    isSaved ? _change_isSaved() : null;
  }
  // void callback()

  @override
  void initState() {
    super.initState();
    // widget.isSaved = true;
    isSaved = widget.isSaved;
    // isSaved = true;

    list = [
      Item(
        content: widget.user.userName.toString(),
        icon: FontAwesomeIcons.user,
        user: widget.user,
        onChanged: _textField_onChange(),
        labelText: "Your name",
      ),
      Item(
          user: widget.user,
          icon: FontAwesomeIcons.genderless,
          content: widget.user.gender.toString(),
          onChanged: _textField_onChange())
    ];
  }
}

class Item {
  Item({
    required this.user,
    this.labelText,
    required this.icon,
    this.onChanged,
    this.notBlank = false,
    required this.content,
  });
  late final User user;
  final String? labelText;
  final IconData icon;
  bool notBlank;
  final onChanged;
  final String content;
}

class EditItem extends StatefulWidget {
  EditItem({Key? key, required this.item}) : super(key: key);

  Item item;

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(k8Margin),
      padding: const EdgeInsets.symmetric(
          horizontal: k12Padding, vertical: k8Padding),
      decoration: BoxDecoration(
        color: ColorsApp.backgroundLight,
        borderRadius: BorderRadius.circular(kBorderRadiusMin),
        border: Border.all(color: ColorsApp.primaryColor, width: 1.5),
        boxShadow: [
          BoxShadow(
              color: ColorsApp.statusNoteColor.withOpacity(0.5),
              offset: const Offset(5, 5),
              blurRadius: 3,
              spreadRadius: 5)
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.item.icon,
            size: kIconSize,
            color: ColorsApp.defaultTextColor,
          ),
          const SizedBox(
            width: k8Padding,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: k12Padding, vertical: k8Padding),
              decoration: BoxDecoration(
                  color: ColorsApp.tertiaryColors.withOpacity(0.5)),
              child: TextField(
                controller: widget.item.content.isEmpty
                    ? TextEditingController()
                    : TextEditingController.fromValue(
                        TextEditingValue(text: widget.item.content),
                      ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(k8Padding),
                  label: Text(
                    widget.item.labelText ?? "",
                    style: TextStyles
                        .defaultStyle.sizeTitleAndButton.colorDefaultText,
                  ),
                  helperText: widget.item.notBlank ? "Must not be blank" : null,
                ),
                onChanged: (value) {
                  widget.item.onChanged;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
