import 'package:debestech_course_project/common/values/color.dart';
import 'package:debestech_course_project/main.dart';
import 'package:debestech_course_project/pages/welcome/bloc/welcome_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    print("index value is ${index}");
                  },
                  children: [
                    _page(
                        1,
                        context,
                        "next",
                        "First See Learning",
                        "Forgget about a for of paper all knowledge in one learning",
                        "assets/asset1.jpeg"),
                    _page(
                        2,
                        context,
                        "next",
                        "Connect with Everyone",
                        "Always keep in touch with your tutor & friend. lets get connected!",
                        "assets/asset2.jpeg"),
                    _page(
                        3,
                        context,
                        "get started",
                        "Always Fascinated Learning",
                        "Anywhere, anytime .The time is at your discretion so study whenever you want",
                        "assets/asset3.jpeg"),
                  ],
                ),
                Positioned(
                    bottom: 80.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: AppColors.primaryThirdElementText,
                          activeColor: AppColors.primaryElement,
                          size: Size.square(8.0),
                          activeSize: Size(18.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ))
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            width: 345.w,
            height: 345.w,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            child: Text(
              title,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              //within 0-2 index
              if (index < 3) {
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.decelerate);
              } else {
                //jump to a new page
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => MyHomePage(title: title)));
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("signIn", (route) => false);
              }
            },
            child: Container(
              width: 325.w,
              height: 50.h,
              margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.all(Radius.circular(15.w)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1))
                  ]),
              child: Center(
                child: Text(
                  buttonName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
