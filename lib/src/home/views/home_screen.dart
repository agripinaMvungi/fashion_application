import 'package:fashon_app/common/utils/kcolors.dart';
import 'package:fashon_app/src/home/widget/custom_app_bar.dart';
import 'package:fashon_app/src/home/widget/home_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
          child: CustomAppBar()
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
            HomeSlider()
          ],
        ),
      ),
    );
  }
}
