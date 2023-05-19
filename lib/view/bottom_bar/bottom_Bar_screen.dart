import 'package:flutter/material.dart';
import 'package:my_to_do_app/res/constant/app_colors.dart';
import 'package:my_to_do_app/view/bottom_bar/home_screen/home_screen.dart';
import 'package:my_to_do_app/view/bottom_bar/profile_screen/profile_screen.dart';
import 'package:my_to_do_app/view/bottom_bar/task_screen/task_screen.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  final List screenList = [
    const HomeScreen(),
    const TaskScreen(),
    const ProfileScreen(),
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF4),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          backgroundColor: AppColors.materialAppColor,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, color: AppColors.white),
              icon: Icon(Icons.home, color: AppColors.deActiveIcon),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
                child: const Icon(
                  Icons.add,
                  color: AppColors.materialAppColor,
                ),
              ),
              icon: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.deActiveIcon),
                child: const Icon(
                  Icons.add,
                  color: AppColors.materialAppColor,
                ),
              ),
              label: 'Task',
            ),
            const BottomNavigationBarItem(
              activeIcon: Icon(Icons.person, color: AppColors.white),
              icon: Icon(Icons.person, color: AppColors.deActiveIcon),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.deActiveIcon,
          onTap: (value) => setState(() {
            selectedIndex = value;
          }),
        ),
      ),
      body: screenList.elementAt(selectedIndex),
    );
  }
}
