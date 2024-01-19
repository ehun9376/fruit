import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruit/config.dart';
import 'package:fruit/get_it/get_it_service.dart';
import 'package:fruit/model/app_user.dart';
import 'package:fruit/shared_model/app_environment_model.dart';
import 'package:provider/provider.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  final AppEnvironmentModel appEnvironmentModel = getIt<AppEnvironmentModel>();

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
        ],
        child: Selector<AppEnvironmentModel, AppUser?>(
          selector: (context, model) => model.currentUser,
          builder: (context, user, child) {
            debugPrint("######DDDD===>> user: $user");
            var initPage = Container();

            return Container(
              color: Colors.white,
              child: SafeArea(
                  child: MaterialApp(
                color: Colors.white,
                key: UniqueKey(),
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                locale: context.locale,
                home: initPage,
                routes: {},
                navigatorKey: navigatorKey,
              )),
            );
          },
        ));
  }
}
