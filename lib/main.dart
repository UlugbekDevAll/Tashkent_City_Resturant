import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tashkentcityresturant/firebase/firebas_api.dart';
import 'package:tashkentcityresturant/pages/splash/splash_page.dart';
import 'package:tashkentcityresturant/services/address.dart';
import 'package:hive_flutter/hive_flutter.dart';


Future<void> main() async {



  // Initialize Hive

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();

  Hive.registerAdapter(AddressAdapter());
  await Hive.initFlutter();

  // Register the AddressAdapter

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(ProviderScope(child:MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.blue,
    // ));

    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: false,
              fontFamily: 'Adonis',
              // primaryColor: LightColors.labelsPrimary,
              // textSelectionTheme: const TextSelectionThemeData(cursorColor: LightColors.labelsPrimary, selectionHandleColor: Colors.transparent),
              // progressIndicatorTheme: const ProgressIndicatorThemeData(color: LightColors.labelsPrimary),
              // scaffoldBackgroundColor: LightColors.backgroundsPrimary,
              appBarTheme: AppBarTheme(
                elevation: 0,
                titleSpacing: 0,
                // backgroundColor: LightColors.backgroundsPrimary,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.dark,
                ),
                iconTheme: IconThemeData(
                  // color: LightColors.labelsSecondary,
                  size: 27.w,
                ),
              ),
              // iconTheme: IconThemeData(color: LightColors.labelsSecondary, size: 18.w),
            ),
            home: const SplashPage(),
          );
        });
  }
}
