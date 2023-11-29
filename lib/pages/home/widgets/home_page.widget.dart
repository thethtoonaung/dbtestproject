import 'package:debestech_course_project/common/values/color.dart';
import 'package:debestech_course_project/pages/home/bloc/home_page_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/person.png"))),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                    hintText: "search your course",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    hintStyle: const TextStyle(
                        color: AppColors.primarySecondaryElementText)),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
              border: Border.all(color: AppColors.primaryElement)),
          child: Image.asset(
            "assets/icons/options.png",
          ),
        ),
      )
    ],
  );
}

// for slider View
Widget sliderView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 200.h,
        child: PageView(
          onPageChanged: (value) {
            print(value.toString());
            context.read<HomePageBloc>().add(HomePageDots(value));
          },
          children: [
            /* Container(
              width: 325.w,
              height: 160.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.h)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/icons/art.png"))),
            ), */
            _sliderContainer(path: "assets/icons/art.png"),
            _sliderContainer(path: "assets/icons/Image(1).png"),
            _sliderContainer(path: "assets/icons/Image(2).png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
              color: AppColors.primaryFourElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ),
      )
    ],
  );
}

// slider widget
Widget _sliderContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.fill,
        )),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _reusableText("Choose your course"),
            GestureDetector(
              child: _reusableText("See all",
                  color: AppColors.primaryThirdElementText, fontsize: 12),
            )
          ],
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
      Container(
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText("Popular",
                textColor: AppColors.primaryThirdElementText,
                backGroundColor: Colors.white),
            _reusableMenuText("Newest",
                textColor: AppColors.primaryThirdElementText,
                backGroundColor: Colors.white),
          ],
        ),
      ),
    ],
  );
}

Widget _reusableText(String text,
    {Color color = AppColors.primaryText,
    int fontsize = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    child: Text(
      text,
      style: TextStyle(
          color: color, fontWeight: FontWeight.bold, fontSize: fontsize.sp),
    ),
  );
}

// for the menu buttons, reusable text
Widget _reusableMenuText(String menuText,
    {Color textColor = AppColors.primaryElementText,
    int fontsize = 16,
    Color backGroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: backGroundColor)),
    child: _reusableText(menuText,
        color: textColor, fontWeight: FontWeight.normal, fontsize: 11),
  );
}

//for course grid view ui
Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best Course for IT and Engineer",
          maxLines: 1,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "Flutter best course",
          maxLines: 1,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.normal,
              fontSize: 8.sp),
        ),
      ],
    ),
    // width: 100,
    // height: 100,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        image: const DecorationImage(
            fit: BoxFit.fill, image: AssetImage("assets/icons/Image(1).png"))),
  );
}
