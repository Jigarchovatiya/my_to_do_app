import 'package:flutter/material.dart';
import 'package:my_to_do_app/res/constant/app_colors.dart';

List<bool> boolList = [
  false,
  false,
  false,
  false,
  false,
];
List textList = [
  "Practice daily UI challenge",
  "Take a bath",
  "Reading for 30 minutes",
  "Post on social media",
  "Practice daily UI challenge",
];

class CheckboxListTileScreen extends StatefulWidget {
  const CheckboxListTileScreen({Key? key}) : super(key: key);

  @override
  State<CheckboxListTileScreen> createState() => _CheckboxListTileScreenState();
}

class _CheckboxListTileScreenState extends State<CheckboxListTileScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: textList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              setState(() {});
            },
            trailing: const CloseButton(),
            title: Text(
              textList[index],
            ),
            leading: Checkbox(
              activeColor: AppColors.materialAppColor,
              onChanged: (value) {
                debugPrint("Value --->> $value");
                boolList[index] = value!;
                setState(() {});
              },
              value: boolList[index],
            ),
          );
        },
      ),
    );
  }
}
