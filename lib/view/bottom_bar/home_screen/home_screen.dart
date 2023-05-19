import 'package:flutter/material.dart';
import 'package:my_to_do_app/res/common/checkbox_list_tile.dart';
import 'package:my_to_do_app/res/constant/app_colors.dart';
import 'package:my_to_do_app/res/constant/app_strings.dart';
import 'package:my_to_do_app/view/bottom_bar/profile_screen/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../res/constant/app_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences? sharedPreferences;

  setInstant() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool select = true;
  int selectedIndex = 0;
  double progressValue = 0.0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          AppStrings.appBar,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        leading: Container(
          margin: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                });
              },
              child: Image.asset(
                fit: BoxFit.cover,
                AppAssets.profile,
                height: height / 8,
              ),
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              AppStrings.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: height / 30),
            SizedBox(
              width: 331,
              height: 8,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: LinearProgressIndicator(
                  value: boolList[0] == true
                      ? boolList[1] == true
                          ? boolList[2] == true
                              ? 0.30
                              : 0.20
                          : 0.10
                      : progressValue,
                  color: AppColors.materialAppColor,
                  backgroundColor: const Color(0xffF0F0F2),
                ),
              ),
            ),
            SizedBox(height: height / 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                2,
                (index) => GestureDetector(
                  onTap: () {
                    selectedIndex = index;
                    setState(() {});
                  },
                  child: Container(
                    width: 124,
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: selectedIndex == index ? AppColors.materialAppColor : AppColors.deActiveIcon,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        index == 0 ? AppStrings.priority : AppStrings.nonPriority,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: selectedIndex == index ? AppColors.white : AppColors.deselectTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Task list",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            selectedIndex == 0 ? const CheckboxListTileScreen() : const CheckboxListTileScreen(),
          ],
        ),
      ),
    );
  }
}
