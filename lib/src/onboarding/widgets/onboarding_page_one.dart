import 'package:fashon_app/common/utils/kcolors.dart';
import 'package:fashon_app/common/utils/kstrings.dart';
import 'package:fashon_app/common/widgets/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/resource.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          Image.asset(R.ASSETS_IMAGES_EXPERIENCE_PNG, fit: BoxFit.cover,),
          Positioned(
            bottom: 180,
              left: 30,
              right: 30,
              child: Text(AppText.kOnboardHome, textAlign: TextAlign.center,style: appStyle(11, Kolors.kGray, FontWeight.normal),)
          )
        ],
      ),
    );
  }
}
