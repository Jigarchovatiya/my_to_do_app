import 'package:flutter/material.dart';
import 'package:my_to_do_app/res/common/checkbox_list_tile.dart';
import 'package:my_to_do_app/res/constant/app_colors.dart';
import 'package:my_to_do_app/res/constant/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              borderRadius: BorderRadius.circular(150),
              child: Image.asset(
                "assets/images/profile_pic.png",
              ),
            ),
          ),
          actions: const [
            Icon(Icons.more_vert),
          ]),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              AppStrings.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 331,
              height: 11,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: LinearProgressIndicator(
                  value: boolList[0] == true
                      ? boolList[1] == true
                          ? 0.20
                          : 0.10
                      : progressValue,
                  color: AppColors.materialAppColor,
                  backgroundColor: const Color(0xffF0F0F2),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                      borderRadius: BorderRadius.circular(8),
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
