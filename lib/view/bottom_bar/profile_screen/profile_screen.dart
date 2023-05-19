import 'package:flutter/material.dart';
import 'package:my_to_do_app/res/constant/app_assets.dart';
import 'package:my_to_do_app/res/constant/app_colors.dart';
import 'package:my_to_do_app/res/constant/app_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List profileList = [
    {
      "leading": Icons.edit,
      "title": "Edit profile",
    },
    {
      "leading": Icons.lock,
      "title": "Change Password",
    },
    {
      "leading": Icons.notifications_active,
      "title": "Notification",
    },
    {
      "leading": Icons.settings,
      "title": "Settings",
    },
    {
      "leading": Icons.logout,
      "title": "Logout",
    },
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Image.asset(
                  AppAssets.profile,
                  height: height / 8,
                ),
              ),
            ),
            const Text(
              AppStrings.profileText,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                fontSize: 20,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) => GestureDetector(
                child: ListTile(
                  leading: Icon(
                    profileList[index]["leading"],
                  ),
                  title: Text(profileList[index]["title"]),
                  trailing: index == 4 ? SizedBox() : Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
