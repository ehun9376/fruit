import 'package:flutter/material.dart';
import 'package:fruit/config.dart';
import 'package:fruit/get_it/get_it_service.dart';
import 'package:fruit/model/app_user.dart';
import 'package:fruit/pages/cart_page.dart';
import 'package:fruit/pages/coupon_page.dart';
import 'package:fruit/pages/detail_item_page.dart';
import 'package:fruit/pages/main_home_page.dart';
import 'package:fruit/pages/loading_page.dart';
import 'package:fruit/pages/login_page.dart';
import 'package:fruit/pages/user_info.dart';
import 'package:fruit/routes.dart';
import 'package:fruit/shared_model/app_environment_model.dart';
import 'package:fruit/shared_model/cart_items_model.dart';
import 'package:fruit/shared_model/track_items_model.dart';
import 'package:provider/provider.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  final AppEnvironmentModel appEnvironmentModel = getIt<AppEnvironmentModel>();
  final TrackItemsModol trackItemsModol = getIt<TrackItemsModol>();
  final CartItemsModel cartItemsModel = getIt<CartItemsModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppEnvironmentModel>.value(
              value: appEnvironmentModel),
          ChangeNotifierProvider<TrackItemsModol>.value(value: trackItemsModol),
          ChangeNotifierProvider<CartItemsModel>.value(value: cartItemsModel),
        ],
        child: Selector<AppEnvironmentModel, AppUser?>(
          selector: (context, model) => model.currentUser,
          builder: (context, user, child) {
            debugPrint("######DDDD===>> user: $user");
            var initPage = const LoadingPage();

            return MaterialApp(
              key: UniqueKey(),
              debugShowCheckedModeBanner: false,
              // localizationsDelegates: context.localizationDelegates,
              // locale: context.locale,
              home: initPage,
              routes: {
                loginPageRoute: (context) => const LoginPage(),
                loadingPageRoute: (context) => const LoadingPage(),
                mainHomePageRoute: (context) => const MainHomePage(),
                userInfoPageRoute: (context) => const UserInfoPage(),
                detailItemPageRoute: (context) => const DetailItemPage(),
                cartItemPageRoute: (context) => const CartPage(),
                couponPageRoute: (context) => CouponPage(),
              },
              navigatorKey: navigatorKey,
            );
          },
        ));
  }
}
