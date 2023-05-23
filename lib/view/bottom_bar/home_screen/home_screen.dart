import 'package:flutter/material.dart';
import 'package:my_to_do_app/res/constant/app_colors.dart';
import 'package:my_to_do_app/res/constant/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../res/constant/app_assets.dart';

class HomeScreen extends StatefulWidget {
  final Function(String)? onTab;
  const HomeScreen({Key? key, this.onTab}) : super(key: key);

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
  int progressIndex = 0;
  double progressValue = 0.0;

  List textList = [
    {"title": "Practice daily UI challenge", "isSelect": false},
    {"title": "Take a bath", "isSelect": false},
    {"title": "Reading for 30 minutes", "isSelect": false},
    {"title": "Post on social media", "isSelect": false},
    {"title": "Practice daily UI challenge", "isSelect": false},
    {"title": "Practice daily UI challenge", "isSelect": false},
  ];

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
                widget.onTab!("Profile");
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
            const SizedBox(
              width: 331,
              height: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: LinearProgressIndicator(
                  value: 0.5,
                  color: AppColors.materialAppColor,
                  backgroundColor: Color(0xffF0F0F2),
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
            selectedIndex == 0
                ? Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: textList.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          value: textList[index]["isSelect"],
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: AppColors.materialAppColor,
                          secondary: CloseButton(
                            onPressed: () {
                              // if (textList[index]["isSelect"]) {
                              //   progressIndex--;
                              // }

                              if (textList[index]["isSelect"]) {
                                progressValue = progressValue - (progressIndex / textList.length);
                              }
                              textList.removeAt(index);
                              setState(() {});
                            },
                          ),
                          onChanged: (value) {
                            if (!textList[index]["isSelect"]) {
                              textList[index]["isSelect"] = true;
                              progressIndex++;
                              progressValue = progressIndex / textList.length;
                            }
                            setState(() {});
                          },
                          title: Text(
                            textList[index]["title"],
                          ),
                        );
                      },
                    ),
                  )
                : Container(color: AppColors.materialAppColor, height: 200),
          ],
        ),
      ),
    );
  }
}
