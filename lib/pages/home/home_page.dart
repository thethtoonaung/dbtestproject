import 'package:debestech_course_project/common/values/color.dart';
import 'package:debestech_course_project/pages/home/bloc/home_page_bloc.dart';
import 'package:debestech_course_project/pages/home/widgets/home_page.widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        body: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            return Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
                child: CustomScrollView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  slivers: [
                    SliverToBoxAdapter(
                      child: homePageText("Hello",
                          color: AppColors.primaryThirdElementText),
                    ),
                    SliverToBoxAdapter(
                      child: homePageText(
                        "Dbestech",
                        top: 5,
                      ),
                    ),
                    SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                    SliverToBoxAdapter(
                      child: searchView(),
                    ),
                    SliverToBoxAdapter(
                      child: sliderView(context, state),
                    ),
                    SliverToBoxAdapter(
                      child: menuView(),
                    ),
                    SliverPadding(
                      padding:
                          EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 1.6 // adjust width and height
                            ),
                        delegate: SliverChildBuilderDelegate(childCount: 4,
                            (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {},
                            child: courseGrid(),
                          );
                        }),
                      ),
                    )
                  ],
                ));
          },
        ));
  }
}
