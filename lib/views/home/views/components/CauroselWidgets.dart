
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_satka_matka/views/home/controllers/home_controllers.dart';




class ImageSlider extends StatelessWidget {
  final HomeController bannerController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Obx(() {
      if (bannerController.isLoading.value) {
        return Center(
          child: Container(
            margin: EdgeInsets.only(top: 5),
            width: width *0.85,
            height: height * 0.18,
            color: Colors.grey,
          ),
        );
      }

      if (bannerController.banners.isEmpty) {
        return SizedBox();
      }

      return CarouselSlider(
        items: bannerController.banners.map((banner) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                color: Colors.grey.shade100,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.network(
                  banner.path,
                  width: width * 0.89,
                  fit: BoxFit.fill,
                ),
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: height * 0.18,
          aspectRatio: 16 / 9,
          viewportFraction: 0.7,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 810),
          autoPlayCurve: Curves.easeOutQuad,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          scrollDirection: Axis.horizontal,
        ),
      );
    });
  }
}

