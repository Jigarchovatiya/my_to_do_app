import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_to_do_app/res/constant/app_assets.dart';
import 'package:my_to_do_app/res/constant/app_colors.dart';
import 'package:my_to_do_app/view/bottom_bar/bottom_Bar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: AppColors.materialAppColor),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  AppAssets.splashLogo,
                  height: height / 12,
                ),
              ),
              SizedBox(
                height: height / 20,
              ),
              Center(
                child: Image.asset(
                  AppAssets.splashLogoTwo,
                  height: height / 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
