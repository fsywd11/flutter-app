import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/BannerItem.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

 final List<BannerItem> banners = [
    BannerItem(
      id: '1',
      imgUrl: 'https://picsum.photos/id/1/200/300',
    ),
    BannerItem(
      id: '2',
      imgUrl: 'https://picsum.photos/id/2/200/300',
    ),
    BannerItem(
      id: '3',
      imgUrl: 'https://picsum.photos/id/3/200/300',
    ),
];

  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(
        child: HmSlider(bannerList: banners),
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 10,
        ),
      ),
      SliverToBoxAdapter(
        child:HmCategory(),
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 10,
        ),
      ),
      SliverToBoxAdapter(
        child:HmSuggestion(),
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 10,
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
          direction: Axis.horizontal,
          children: [
           Expanded(
            child: HmHot(),
           ),
           SizedBox(
            width: 10,
           ),
           Expanded(
            child: HmHot(),
           ),
          ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 10,
        ),
      ),
      HmMoreList(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getScrollChildren()
    );
  }
}