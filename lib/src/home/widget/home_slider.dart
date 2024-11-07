import 'package:fashon_app/common/utils/kcolors.dart';
import 'package:fashon_app/const/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:cached_network_image/cached_network_image.dart';
class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kRadiusAll,
      child: Stack(
        children: [
          SizedBox(
            height: ScreenUtil().screenHeight*0.2,
            width: ScreenUtil().screenWidth,
            child: ImageSlideshow(
              onPageChanged: (p){
                print(p);
              },
                autoPlayInterval: 5000,
                isLoop: true,
                indicatorColor: Kolors.kPrimaryLight,
                children:
                List.generate(images.length, (i) {
                  return CachedNetworkImage(
                    errorWidget: errorWidget,
                    imageUrl:  images[i],
                    fit: BoxFit.fill,
                  );
                })
            ),
          ),
        ],
      ),
    );
  }
}
List<String> images = [
  "https://images.unsplash.com/photo-1507297448044-a99b358cd06e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njd8fGZhc2hpb258ZW58MHx8MHx8fDA%3D",
  "https://images.unsplash.com/flagged/photo-1570733117311-d990c3816c47?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODZ8fGZhc2hpb258ZW58MHx8MHx8fDA%3D",
  "https://images.unsplash.com/photo-1483985988355-763728e1935b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D",
  "https://plus.unsplash.com/premium_photo-1664202526559-e21e9c0fb46a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D",
  "https://plus.unsplash.com/premium_photo-1708632849593-3e0d77b47b97?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDV8fGZhc2hpb258ZW58MHx8MHx8fDA%3D"
];
