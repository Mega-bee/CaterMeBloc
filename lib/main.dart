import 'dart:async';
import 'package:cater_me_bloc/utils/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'abstracts/module/rout_module.dart';
import 'di/di_config.dart';
import 'hive/hive.dart';
import 'home_page/homepage_module.dart';
import 'home_page/homepage_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveSetUp.init();

//  ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
//  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    FlutterError.onError = (FlutterErrorDetails details) async {
      Logger().error('Main', details.toString(), StackTrace.current);
    };
    runZonedGuarded(() async {
      configureDependencies();
      // Your App Here
      await GetStorage.init();
      runApp(getIt<MyApp>());
    }, (error, stackTrace) {
      Logger().error(
          'Main', error.toString() + stackTrace.toString(), StackTrace.current);
    });
  });
}

@injectable
class MyApp extends StatefulWidget {
  // final NavigatorModule _navigatorModule;
  final HomePageModule _homePageModule;

  MyApp(
    this._homePageModule,
  );

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeData activeThem;
  late String lang;

  @override
  Widget build(BuildContext context) {
    return getConfiguredApp(RoutModule.RoutesMap);
  }

  Widget getConfiguredApp(
    Map<String, WidgetBuilder> fullRoutesList,
  ) {
    return MaterialApp(
      theme: ThemeData(
        // primaryColor: PrimaryColor,
        // primarySwatch: PrimaryColor,
        fontFamily: 'Roboto',
      ),

      debugShowCheckedModeBanner: false,

      locale: Locale.fromSubtags(
        languageCode: "en",
      ),

      title: 'CaterMe',
      routes: fullRoutesList,
      initialRoute: HomePageRoutes.homePage,
    );
  }
}
