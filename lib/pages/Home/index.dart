import 'package:flutter/material.dart';
import 'package:hm_shop/api/index.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/viewmodels/BannerItem.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

//分类列表
  List<CategoryItem> categoryList = [];

// 轮播图数据
  List<BannerItem> banners = [];


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
        child:HmCategory(categoryList: categoryList),
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
  void initState() {
    super.initState();
    getBannerList();
    getCategoryList();
  }

//获取轮播图数据
  Future<void> getBannerList() async {
    banners = await getBannerListAPI();
    setState(() {});
  }

//获取分类数据
  Future<void> getCategoryList() async {
    categoryList = await getCategoryListAPI();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getScrollChildren()
    );
  }
}