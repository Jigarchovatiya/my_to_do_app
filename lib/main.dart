import 'package:flutter/material.dart';
import 'package:my_to_do_app/res/constant/app_colors.dart';
import 'package:my_to_do_app/view/splash_screen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "inter",
        primaryColor: AppColors.materialColor,

        // primarySwatch: AppColors.materialAppColor,
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      home: const SplashScreen(),
      // routes: appRoutes,
      // initialRoute: RoutesName.splashScreen,
    );
  }
}
