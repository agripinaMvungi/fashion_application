import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:fashon_app/common/utils/kcolors.dart';
import 'package:fashon_app/common/widgets/app_style.dart';
import 'package:fashon_app/src/cart/views/cart_screen.dart';
import 'package:fashon_app/src/entrypoint/controller/bottom_tab_notifier.dart';
import 'package:fashon_app/src/home/views/home_screen.dart';
import 'package:fashon_app/src/profile/views/profile_screen.dart';
import 'package:fashon_app/src/wishlist/views/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class AppEntryPoint extends StatelessWidget {
  AppEntryPoint({super.key});

  List<Widget> pageList = [
    const HomeScreen(),
    const WishlistScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotifier>(
      builder: (context, tabIndexNotifier, child){
        return Scaffold(
          extendBody: true,
          body: Stack(
            children: [
              pageList[tabIndexNotifier.index],
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                    data: Theme.of(context).copyWith(canvasColor: Kolors.kOffWhite),
                    child:
                    BottomNavigationBar(
                        selectedFontSize: 9,
                        elevation: 0,
                        selectedLabelStyle: appStyle(12, Kolors.kPrimary, FontWeight.w500),
                        selectedItemColor: Kolors.kPrimary,
                        unselectedItemColor: Kolors.kPrimary,
                        showSelectedLabels: true,
                        showUnselectedLabels:false ,
                        currentIndex: tabIndexNotifier.index,
                        unselectedIconTheme: const IconThemeData(
                          color: Colors.black38,
                        ),
                        onTap: (i){
                          tabIndexNotifier.setIndex(i);
                        },
                        items: [
                          BottomNavigationBarItem(
                              icon: tabIndexNotifier.index == 0? Icon(AntDesign.home,color: Kolors.kPrimary,size: 24,)
                                  : Icon(AntDesign.home,color: Kolors.kPrimary,size: 24,), label: 'Home'),

                          BottomNavigationBarItem(
                              icon: tabIndexNotifier.index== 1? Icon(Ionicons.heart,color: Kolors.kPrimary,size: 24,)
                                  : Icon(Ionicons.heart_outline,color: Kolors.kPrimary,size: 24,), label: 'Wishlist'),

                          BottomNavigationBarItem(
                              icon: tabIndexNotifier.index ==2? Badge(label: Text("9"),child: Icon(MaterialCommunityIcons.shopping,color: Kolors.kPrimary,size: 24,)):
                              Badge(label: Text("9"),child: Icon(MaterialCommunityIcons.shopping_outline,color: Kolors.kPrimary,size: 24,)), label: 'Cart'),

                          BottomNavigationBarItem(
                              icon: tabIndexNotifier.index == 3? Icon(EvilIcons.user,color: Kolors.kPrimary,size: 34,)
                                  : Icon(EvilIcons.user,color: Kolors.kPrimary,size: 34,), label: 'Profile'),
                        ]
                    )
                ),
              )
            ],
          ),
        );
      }
    );
  }
}