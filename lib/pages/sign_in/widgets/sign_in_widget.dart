import 'package:debestech_course_project/common/values/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
      backgroundColor: Colors.white,
      bottom: PreferredSize(
          child: Container(
            color: AppColors.primarySecondaryBackground,
            //height defines the thickness of the line
            height: 1.0,
          ),
          preferredSize: const Size.fromHeight(1.0)),
      title: Center(
        child: Text(
          "Log In",
          style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal),
        ),
      ));
}

// we need context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: 40.w,
                  height: 40.w,
                  child: Image.asset("assets/icons/google.png"),
                )),
            _reusableIcons("apple"),
            _reusableIcons("facebook"),
          ],
        ),
      ),
    ],
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Image.asset("assets/icons/$iconName.png"),
      ));
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: Colors.black)),
    child: Row(children: [
      Container(
        width: 16.w,
        height: 16.h,
        margin: EdgeInsets.only(left: 17.w),
        child: Image.asset("assets/icons/$iconName.png"),
      ),
      SizedBox(
        width: 270.w,
        height: 50.h,
        child: TextField(
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              hintStyle: TextStyle(color: Colors.grey)),
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 14.sp),
          autocorrect: false,
          obscureText: textType == "password" ? true : false,
        ),
      ),
    ]),
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(left: 25.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot password",
        style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
          fontSize: 12.sp,
        ),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(String buttonName, String buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: buttonType
      
      =="login" ? 40.h:20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: buttonType=="login"? AppColors.primaryElement:AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
            //check for registration button border color
            color: buttonType == "login" ? Colors.transparent: AppColors.primaryFourElementText
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
              color: Colors.grey.withOpacity(0.1),
            )
          ]),
      child: Center(child: Text(buttonName,style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: buttonType == "login" ? AppColors.primaryBackground : AppColors.primaryText
      ),),),
    ),
  );
}
