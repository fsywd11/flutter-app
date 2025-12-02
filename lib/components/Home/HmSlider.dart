import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/BannerItem.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  const HmSlider({super.key, required this.bannerList}); 

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {


  Widget _getSlider() {
    final double screenWidth=MediaQuery.of(context).size.width;
    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (int index) {
        return  Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
);
}),
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlay: true,
        enlargeCenterPage: true,
        //aspectRatio: 2.0//轮播图的宽高比（宽度 / 高度 = 2.0）
      )
    );
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_getSlider()],
    );
  }
}