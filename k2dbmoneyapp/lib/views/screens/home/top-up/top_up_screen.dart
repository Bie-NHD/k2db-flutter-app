import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_validation.dart';
import 'package:k2dbmoneyapp/core/widgets/widget_itembutton.dart';
import 'package:k2dbmoneyapp/views/screens/authen/success_page.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_custom_textformfield.dart';

import 'package:k2dbmoneyapp/core/model/user.dart';

import '../../../../core/helpers/helper_image.dart';

class TopUpScreen extends StatefulWidget {
  TopUpScreen({Key? key}) : super(key: key);

  static const String routeName = '/top_up_screen';
  final User user = User.base;

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  // VARIABLES
  final TextEditingController fieldText = TextEditingController();
  final List<String> _titles = ["Top up", "Confirm"];
  int _selectedIndex = 0;
  double amount = 0;
  String nameBank = "";
  final PageController pageController = PageController();
  late ValueNotifier<int> valueNotifier = ValueNotifier<int>(_selectedIndex);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = pageController.initialPage.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsApp.backgroundLight,
        appBar: AppBar(
          backgroundColor: ColorsApp.backgroundLight,
          centerTitle: true,
          elevation: 0,
          title: Text(
            _titles[_selectedIndex],
            style: TextStyles.defaultStyle.sizeAppbar.semiBold,
          ),
          leading: IconButton(
            onPressed: () {
              if (_selectedIndex != 0) {
                pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                setState(() {
                  _selectedIndex = _selectedIndex - 1;
                });
              } else {
                Navigator.pop(context);
              }
            },
            icon: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black,
            ),
          ),
        ),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            _AmountPage(
              userBalance: widget.user.userBalance,
              nextPage: nextPage,
              setAmount: setAmount,
              setBank: setBank,
            ),
            _ConfirmPage(
              user: widget.user,
              amount: amount,
              nextPage: nextPage,
              nameBank: nameBank,
            )
          ],
        ));
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void setAmount(double amount) {
    setState(() {
      this.amount = amount;
    });
  }

  void setBank(String name) {
    setState(() {
      nameBank = name;
    });
  }
}

class _AmountPage extends StatefulWidget {
  final double userBalance;
  final Function nextPage;
  final Function(double) setAmount;
  final Function setBank;

  const _AmountPage(
      {required this.userBalance,
      required this.nextPage,
      required this.setAmount,
      required this.setBank});

  @override
  State<_AmountPage> createState() => _AmountPageState();
}

class _AmountPageState extends State<_AmountPage> {
  FormState? formState;

  final TextEditingController textEditingController = TextEditingController();

  Map<String, String> bankProfiles = {
    'Vietcombank': HelperAssets.imgVietcombank,
    'Agribank': HelperAssets.imgAgribank,
    'Techcombank': HelperAssets.imgTechcombank
  };

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(k12Padding),
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
                  widget.userBalance.toFormatMoney(),
                  style: TextStyles.defaultStyle.sizeAppbar,
                )
              ],
            ),
            const SizedBox(height: k8Padding),
            Form(
              child: Builder(builder: (context) {
                formState = Form.maybeOf(context);
                return CustomTextFormField(
                  controller: textEditingController,
                  labelText: "Amount",
                  hintText: 10000.0.toFormatMoney(),
                  keyboardType: TextInputType.number,
                  validator: (value) => HelperValidation.validateAmount(value,
                      userBalance: widget.userBalance),
                );
              }),
            ),
            Text("Account/Card",
                style: TextStyles
                    .defaultStyle.sizeAppbar.semiBold.colorDeepBlueText),
            Expanded(
              child: ListView.builder(
                  itemCount: bankProfiles.keys.toList().length,
                  itemBuilder: (context, index) {
                    MapEntry entry = bankProfiles.entries.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: _BankTile(
                        widget: widget,
                        imgBank: entry.value,
                        nameBank: entry.key,
                        isSelected: selectedIndex == index,
                      ),
                    );
                  }),
            ),
            ButtonFill(
              text: "Continue",
              onTap: () {
                if (formState!.validate()) {
                  widget.setAmount(double.parse(textEditingController.text));
                  widget.setBank(bankProfiles.keys.elementAt(selectedIndex));
                  widget.nextPage();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class _BankTile extends StatefulWidget {
  _BankTile(
      {required this.widget,
      required this.imgBank,
      required this.nameBank,
      required this.isSelected});

  final _AmountPage widget;
  final String imgBank;
  final String nameBank;
  bool isSelected;

  @override
  State<_BankTile> createState() => _BankTileState();
}

class _BankTileState extends State<_BankTile> {
  Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(seconds: 0),
        margin: const EdgeInsets.symmetric(vertical: k8Margin),
        padding: const EdgeInsets.all(k12Padding),
        decoration: BoxDecoration(
            color: widget.isSelected
                ? ColorsApp.statusNoteColor.withOpacity(0.5)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(kBorderRadiusMin),
            border: Border.all(
                color: widget.isSelected
                    ? Colors.transparent
                    : ColorsApp.tertiaryColors)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          HelperImage.loadFromAsset(widget.imgBank,
              // height: k24Padding,
              width: 24,
              radius: BorderRadius.circular(kBorderRadiusMax)),
          const SizedBox(width: k8Padding),
          Text(
            widget.nameBank,
            style: TextStyles.defaultStyle.sizeTitleAndButton.semiBold,
          )
        ]));
  }
}

class _ConfirmPage extends StatefulWidget {
  final User user;
  final double amount;
  final double fee;
  final Function nextPage;
  final String nameBank;

  const _ConfirmPage(
      {Key? key,
      required this.user,
      required this.amount,
      this.fee = 0,
      required this.nextPage,
      required this.nameBank})
      : super(key: key);

  @override
  State<_ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<_ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> data = {
      'amount': widget.amount.toFormatMoney(),
      'bank': widget.nameBank,
      'fee': widget.fee.toFormatMoney()
    };
    final int length = data.keys.toList().length;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(k12Padding),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: length,
                itemBuilder: (context, index) {
                  final MapEntry entry = data.entries.elementAt(index);
                  return Container(
                    margin: const EdgeInsets.all(k8Padding),
                    padding: const EdgeInsets.all(k12Padding),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: ColorsApp.primaryColor, width: 1),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(kBorderRadiusMin))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          entry.key.toUpperCase(),
                          style: TextStyles.defaultStyle.semiBold,
                        ),
                        Text(entry.value ?? "None")
                      ],
                    ),
                  );
                }),
          ),
          ButtonFill(
              text: "Confirm",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SuccessPage(
                              message: "Your action is successfuly executed!",
                            )));
              })
        ],
      ),
    ));
  }
}
