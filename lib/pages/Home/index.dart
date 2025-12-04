import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/utils/Toastutils.dart';
import 'package:hm_shop/viewmodels/home.dart';

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
        child:HmSuggestion(specialRecommendResult: productList),
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
              child: HmHot(result: _inVogueResult, type: "hot"),
            ),
           SizedBox(width: 10),
           Expanded(
              child: HmHot(result: _oneStopResult, type: "step"),
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
      HmMoreList(recommendList: _recommendList),
    ];
  }

  @override
  void initState() {
    super.initState();   
     _registerEvent();
     Future.microtask(() {
      _paddingTop = 100;
      setState(() {
        
      });
      _Key.currentState?.show();
     });
     
  }

// 注册滚动事件
  void _registerEvent() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent-50) {
        // 滚动到了最底部
        _getRecommendList();
      }
    });
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
  SpecialRecommendResult productList = SpecialRecommendResult(
    id: '',
    title: '',
    subTypes: []
    );

  //获取特惠推荐数据
  Future<void> getProductList() async {
    productList = await getProductListAPI();
    setState(() {});
  }


// 热榜推荐
SpecialRecommendResult _inVogueResult = SpecialRecommendResult(
  id: "",
  title: "",
  subTypes: [],
);
// 一站式推荐
SpecialRecommendResult _oneStopResult = SpecialRecommendResult(
  id: "",
  title: "",
  subTypes: [],
);

// 获取热榜推荐列表
Future<void> _getInVogueList() async {
  _inVogueResult = await getInVogueListAPI();
  setState(() {});
}

// 获取一站式推荐列表
Future<void> _getOneStopList() async {
  _oneStopResult = await getOneStopListAPI();
  setState(() {});
}

List<GoodDetailItem> _recommendList = [];


//页码
int _page = 1;
bool _isLoading = false;//同时只能加载一个请求，避免重复请求
bool _hasMore = true;//是否还有更多数据
  // 获取推荐列表
  Future<void> _getRecommendList() async {
    if (_isLoading||!_hasMore) {
      return;
    }
    _isLoading = true;
    int requestLimit = _page*8;
    _recommendList = await getRecommendListAPI({"limit": requestLimit});
    setState(() {});
    if (_recommendList.length<requestLimit) {
      _hasMore = false;
    }
    _isLoading = false;
    _page++;
  }

  Future<void> _onRefresh() async {
    _page = 1;
    _hasMore = false;
    _hasMore = true;
    _recommendList = [];
    await getBannerList();
    await getCategoryList();
    await getProductList();
    await _getInVogueList();
    await _getOneStopList();
    await _getRecommendList();
    ToastUtils.showToast(context, "刷新成功");
    _paddingTop = 0;
  }
 final GlobalKey<RefreshIndicatorState> _Key = GlobalKey<RefreshIndicatorState>();
 final ScrollController _scrollController = ScrollController();
 double _paddingTop = 0;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _Key,
      onRefresh: _onRefresh,
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: _paddingTop),
        duration: Duration(milliseconds: 300),
        child: CustomScrollView(
          controller: _scrollController,//绑定控制器
          slivers: _getScrollChildren(),
        ),
      ),
    );
  }
}