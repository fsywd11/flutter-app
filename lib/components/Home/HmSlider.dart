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
  final CarouselSliderController _controller=CarouselSliderController();
  int _currentIndex=0;//判断是否激活，改变颜色

  Widget _getSlider() {
    final double screenWidth=MediaQuery.of(context).size.width;
    return CarouselSlider(
      carouselController: _controller,
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
        onPageChanged: (int index, CarouselPageChangedReason reason){
          setState(() {
            _currentIndex = index;
          });
        },//回调函数，在controllerdialog中，当切换页面时，会调用这个回调函数
        //aspectRatio: 2.0//轮播图的宽高比（宽度 / 高度 = 2.0）
      )
    );
  }

  Widget _getSearch() {
    return Positioned(
      top: 10,
      left:0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child:Text(
            "搜索中...",
            style: TextStyle(color: Colors.white,fontSize: 16),
          )
        )
      )
    );
  }


//返回指示灯
Widget _getDots(){
  return Positioned(
    bottom: 10,
    left: 0,
    right: 0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.bannerList.length, (int index) {
        return GestureDetector(
          onTap: (){
            _controller.animateToPage(index);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: index==_currentIndex?40:12,
            height: 6,
            decoration: BoxDecoration(
              color: index==_currentIndex?Colors.white:Color.fromRGBO(0, 0, 0, 0.3),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        );  
      }),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_getSlider(),_getSearch(),_getDots()],
    );
  }
}