import 'package:debestech_course_project/common/values/color.dart';
import 'package:debestech_course_project/common/widgets/base_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
        child: Container(
      child: Center(child: reusableText("Settings")),
    )),
  );
}

Widget settingsButton(BuildContext context, void Function()? func) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Confirm Logout"),
              content: Text("Confirm Logout"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Cancel")),
                TextButton(onPressed: func, child: Text("Confirm")),
              ],
            );
          });
    },
    child: Container(
      height: 100.w,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/icons/Logout.png"))),
    ),
  );
}
