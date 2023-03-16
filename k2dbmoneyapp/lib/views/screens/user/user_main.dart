import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import 'Modal/User.dart';
import 'Widgets/main_body.dart';

class UserScreen extends StatefulWidget {
  static const routeName = "/user_screen";

  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen>
    with SingleTickerProviderStateMixin {
  final bool isShowingBalance = false;
  late TabController _tabController;
  User user = User.base();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primaryColor,
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: UserMainBody(
        user: user,
        isShowingBalance: isShowingBalance,
        tabController: _tabController,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
    );
  }
}
