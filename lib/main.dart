import 'package:flutter/material.dart';
import 'package:my_to_do_app/res/constant/color_constant.dart';
import 'package:my_to_do_app/view/to_do_screen/to_do_screen.dart';

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
        fontFamily: "IBM_Plex_Mono",
        primarySwatch: AppColors.materialAppColor,
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      home: const ToDoScreen(),
      // routes: appRoutes,
      // initialRoute: RoutesName.splashScreen,
    );
  }
}
