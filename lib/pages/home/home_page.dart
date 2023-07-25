import 'package:debestech_course_project/common/values/color.dart';
import 'package:debestech_course_project/pages/home/widgets/home_page.widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              homePageText(
                "hello",
                color: AppColors.primaryFourElementText,
                top: 20,
              ),
              homePageText(
                "dbestech",
                color: AppColors.primaryText,
                top: 5,
              ),

              // Container(
              //   margin: EdgeInsets.only(top: 20.h),
              //   child: Text(
              //     "Hello",
              //     style: TextStyle(
              //         color: AppColors.primaryElementText,
              //         fontSize: 24.sp,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),

              SizedBox(height: 20.h,),
              searchView(),
            ],
          )),
    );
  }
}
