import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/services/web_socket.dart';
import 'package:k2dbmoneyapp/views/screens/authen/main_page.dart';
import 'package:k2dbmoneyapp/views/screens/authen/onbroading_screen.dart';
import 'package:k2dbmoneyapp/views/screens/authen/sign_in.dart';
import 'package:k2dbmoneyapp/views/screens/authen/splash_screen.dart';
import 'package:k2dbmoneyapp/views/screens/home/detail_product_screeen.dart';
import 'package:k2dbmoneyapp/views/screens/home/home_main.dart';
import 'package:k2dbmoneyapp/views/screens/home/notfication_screen.dart';
import 'package:k2dbmoneyapp/views/screens/home/products_screen.dart';
import 'package:k2dbmoneyapp/views/screens/home/top-up/top_up_screen.dart';
import 'package:k2dbmoneyapp/views/screens/promotion/detail_exchange_gift.dart';
import 'package:k2dbmoneyapp/views/screens/promotion/exchange_gift.dart';
import 'package:k2dbmoneyapp/views/screens/promotion/gift.dart';
import 'package:k2dbmoneyapp/views/screens/promotion/help_promotion.dart';
import 'package:k2dbmoneyapp/views/screens/promotion/my_gift.dart';
import 'package:k2dbmoneyapp/views/screens/promotion/promotion_main.dart';
import 'package:k2dbmoneyapp/views/screens/store/Widgets/map_screen.dart';
import 'package:k2dbmoneyapp/views/screens/store/Widgets/detail_products_store_screen.dart';
import 'package:k2dbmoneyapp/views/screens/store/Widgets/detail_store_screen.dart';
import 'package:k2dbmoneyapp/views/screens/store/store_main.dart';
import 'package:k2dbmoneyapp/views/screens/user/user_main.dart';

final Map<String, WidgetBuilder> routes = {
  WebSocket.routeName: (context) => const WebSocket(),
  OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
  MainPage.routeName: (context) => const MainPage(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  UserScreen.routeName: (context) => UserScreen(),
  PromotionScreen.routeName: (context) => const PromotionScreen(),
  StoreScreen.routeName: (context) => const StoreScreen(),
  MapScreen.routeName: (context) => const MapScreen(),
  DetailStoreScreen.routeName: (context) => const DetailStoreScreen(),
  DetailProductsStoreScreen.routeName: (context) =>
      const DetailProductsStoreScreen(),
  DetailProductScreen.routeName: (context) => const DetailProductScreen(),
  MyGiftScreen.routeName: (context) => const MyGiftScreen(),
  ExchangeGiftScreen.routeName: (context) => const ExchangeGiftScreen(),
  DetailGiftScreen.routeName: (context) => const DetailGiftScreen(),
  DetailExchangeGiftScreen.routeName: (context) =>
      const DetailExchangeGiftScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ProductsScreen.routeName: (context) => const ProductsScreen(),
  HelpPromotionScreen.routeName: (context) => const HelpPromotionScreen(),
  TopUpScreen.routeName: (context) => const TopUpScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen()
};
