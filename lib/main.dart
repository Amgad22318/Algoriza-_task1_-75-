import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:task1/data/data_provider/local/cache_helper.dart';
import 'package:task1/presentation/router/app_router.dart';
import 'package:task1/presentation/styles/colors.dart';
import 'package:task1/presentation/styles/themes.dart';

import 'data/data_provider/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(DevicePreview(
      enabled: true,
      isToolbarVisible: true,
      builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: defaultAppColor, //or set color with: Color(0xFF0000FF)
    ));
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
