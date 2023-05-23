import 'package:flutter/material.dart';
import 'package:my_to_do_app/res/constant/app_strings.dart';

import '../../../res/constant/app_colors.dart';

class TaskScreen extends StatefulWidget {
  final Function(String)? onTab;
  const TaskScreen({Key? key, this.onTab}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: const Text(
          AppStrings.taskAppBar,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        leading: IconButton(
          onPressed: () {
            setState(
              () {
                Navigator.pop(context);
              },
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Task name",
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const TextField(
                    maxLines: 3,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Enter your name here...",
                      filled: true,
                      fillColor: AppColors.fillColor,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 30,
              ),
              SizedBox(
                height: 40,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        child: Container(
                          width: 124,
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
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: width / 8),
                    itemCount: 2),
              ),
              SizedBox(
                height: height / 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.textLabelTwo,
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const TextField(
                    maxLines: 5,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Enter task description here...",
                      filled: true,
                      fillColor: AppColors.fillColor,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 30,
              ),
              GestureDetector(
                onTap: () {
                  widget.onTab!("Task");
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.materialAppColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Center(
                    child: Text(
                      AppStrings.buttonTextOne,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 30,
              ),
              GestureDetector(
                onTap: () {
                  widget.onTab!("Task");
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5),
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Center(
                    child: Text(
                      AppStrings.buttonTextTwo,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
