import 'package:fashon_app/common/utils/kcolors.dart';
import 'package:fashon_app/src/onboarding/views/controllers/onboarding_notifier.dart';
import 'package:fashon_app/src/onboarding/widgets/onboarding_page_one.dart';
import 'package:fashon_app/src/onboarding/widgets/onboarding_page_two.dart';
import 'package:fashon_app/src/onboarding/widgets/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: context.read<OnboardingNotifier>().selectedPage
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (page){
                context.read<OnboardingNotifier>().setSelectedPage = page;
              },
              children: [
                OnboardingPageOne(),
                OnboardingPageTwo(),
                WelcomeScreen()
              ],
            ),
            context.watch<OnboardingNotifier>().selectedPage == 2 ? SizedBox.shrink() : Positioned(
              bottom: 50.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  width: ScreenUtil().screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      context.watch<OnboardingNotifier>().selectedPage == 0 ? const SizedBox(
                        width: 25,
                      ):
                      GestureDetector(
                        onTap: (){
                          _pageController.animateToPage(
                              context.read<OnboardingNotifier>().selectedPage -1,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn
                          );
                        },
                          child: const Icon(AntDesign.leftcircleo, color: Kolors.kPrimary,size: 30,)),
                      SizedBox(
                        width:  ScreenUtil().screenWidth*0.7,
                        height: 50.h,
                        child: PageViewDotIndicator(
                          currentItem: context.watch<OnboardingNotifier>().selectedPage,
                          count: 3,
                          unselectedColor: Kolors.kGray,
                          selectedColor: Kolors.kPrimary,
                          duration: const Duration(milliseconds: 200),
                          onItemClicked: (index){
                            _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                          },
                        ),
                      ),
                      GestureDetector(
                          onTap: (){
                            _pageController.animateToPage(
                                context.read<OnboardingNotifier>().selectedPage +1,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn
                            );
                          },
                          child: Icon(AntDesign.rightcircleo, color: Kolors.kPrimary,size: 30,)),
                    ],
                  ),
                ))
          ],
        ),
      )
    );
  }
}
