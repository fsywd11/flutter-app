//全局常量
class GlobalConstants {
  static const String BASE_URL = 'https://meikou-api.itheima.net';//基础地址
  static const int TIME_OUT = 10;//超时时间
  static const String SUCCESS_CODE = '1';//成功状态
}

//存放请求地址接口的常量
class HttpConstants { 
  static const String BANNER_LIST = '/home/banner';
  static const String CATEGORY_LIST = '/home/category/head';//分类列表
}

class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id']??'',
      name: json['name']?? '' ,
      picture: json['picture']?? '',
      children: json['children'] != null
          ? (json['children'] as List)
              .map((item) => CategoryItem.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
}