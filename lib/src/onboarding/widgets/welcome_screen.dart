import 'package:fashon_app/common/utils/app_routes.dart';
import 'package:fashon_app/common/utils/kcolors.dart';
import 'package:fashon_app/common/widgets/app_style.dart';
import 'package:fashon_app/common/widgets/custom_button.dart';
import 'package:fashon_app/common/widgets/reusable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../common/services/storage.dart';
import '../../../common/utils/kstrings.dart';
import '../../../const/resource.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (
          Container(
            color: Kolors.kWhite,
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Image.asset(R.ASSETS_IMAGES_GETSTARTED_PNG),
                SizedBox(
                  height: 30.h,
                ),
                Text(AppText.kWelcomeHeader,
                  textAlign: TextAlign.center,
                  style: appStyle(24, Kolors.kPrimary, FontWeight.bold),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: ScreenUtil().screenWidth -100,
                  child: Text(AppText.kWelcomeMessage,style: appStyle(11, Kolors.kGray, FontWeight.normal),textAlign: TextAlign.center,),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GradientBtn(
                  text: AppText.kGetStarted,
                  onTap: (){
                    // TODO: UNCOMMENT
                    // Storage().setBool('firstOpen', true);
                    context.go('/home');
                  },
                  btnHieght: 35,
                  btnWidth: ScreenUtil().screenWidth -100,
                  radius: 20,
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReusableText(text: AppText.kHaveAccount, style: appStyle(12, Kolors.kDark, FontWeight.normal)),
                    TextButton(
                        onPressed: (){
                          context.go('/login');
                          },
                        child:
                        Text("Sign In", style: TextStyle(fontSize: 12,color: Colors.blue),))
                  ],
                )
              ],
            ),
        )
    )
    );
  }
}
