//封装一个api，目的是返回业务侧腰的数据结构
import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/BannerItem.dart';

Future<List<BannerItem>> getBannerListAPI() async {
final tt = ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((item){
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();

  return tt;
}
//分类列表

Future<List<CategoryItem>> getCategoryListAPI() async {
  final tt = ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((item){
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();

  return tt;
}
