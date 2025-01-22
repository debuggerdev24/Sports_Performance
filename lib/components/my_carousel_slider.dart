import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class MyCarouselSlider extends StatelessWidget {
  final List<String> bannerImages;
  const MyCarouselSlider({super.key,required this.bannerImages});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CarouselSlider(
      items: List.generate(
        bannerImages.length,
            (index) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(bannerImages[index]),
                fit: BoxFit.cover),
            border: Border.all(
                color: darkMode.value
                    ? Colors.white70
                    : Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      // homeController.bannerList
      //     .map(
      //       (item) => InkWell(
      //         onTap: () async {
      //           // myLog(homeController.bannerList.toString());
      //           if (await canLaunchUrl(
      //               Uri.parse(item.bannerUrl))) {
      //             await launchUrl(
      //                 Uri.parse(item.bannerUrl));
      //           }
      //         },
      //         child: Container(
      //           margin: const EdgeInsets.symmetric(
      //               horizontal: 5),
      //           decoration: BoxDecoration(
      //             border: Border.all(
      //                 color: darkMode.value
      //                     ? Colors.white60
      //                     : Colors.black),
      //             borderRadius:
      //                 BorderRadius.circular(15),
      //           ),
      //           child: Image.network(
      //             mainUrl +
      //                 bannerUrl +
      //                 item.bannerImage,
      //             width: size.width,
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       ),
      //     ).toList(),
      options: CarouselOptions(
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        //todo ------------> banner getting height from here
        height: size.height * 0.215,
        // 6,
        autoPlay: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
