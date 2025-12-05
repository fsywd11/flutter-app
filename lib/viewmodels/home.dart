
class BannerItem {
 String id;
 String imgUrl;

  BannerItem({
    required this.imgUrl,
    required this.id,
  });

  //拓展一个工厂函数，一般用factory来声明，一般用来创建实例对象
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json['id']??'',
      imgUrl: json['imgUrl']??'',
    );
  }
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



class GoodsItem {
  String id;
  String name;
  String desc;
  String price;
  String picture;
  int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJSON(Map<String, dynamic> json) {
    // 处理picture字段，去除可能包含的反引号
    String pictureUrl = json['picture']?.toString() ?? '';
    // 去除前后的反引号
    pictureUrl = pictureUrl.replaceAll('`', '').trim();
    
    return GoodsItem(
      id: json['id'].toString() ?? '',
      name: json['name']?.toString() ?? '',
      desc: json['desc']?.toString() ?? '',
      price: json['price']?.toString() ?? '',
      picture: pictureUrl,
      orderNum: int.tryParse(json['orderNum']?.toString() ?? "0") ?? 0,
    );
  }
}



class GoodsItems {
    int counts;
    int pageSize;
    int pages;
    int page;
    List<GoodsItem> items;
    GoodsItems({
        required this.counts,
        required this.pageSize,
        required this.pages,
        required this.page,
        required this.items,
    });
    factory GoodsItems.fromJSON(Map<String, dynamic> json) {
        return GoodsItems(
            counts: int.tryParse(json["counts"]?.toString() ?? "0") ?? 0,
            pageSize: int.tryParse(json["pageSize"]?.toString() ?? "0") ?? 0,
            pages: int.tryParse(json["pages"]?.toString() ?? "0") ?? 0,
            page: int.tryParse(json["page"]?.toString() ?? "0") ?? 0,
            items: (json["items"] as List ?? [])
                .map((item) => GoodsItem.fromJSON(item as Map<String, dynamic>))
                .toList(),
        );
    }
}


class SubType {
    String id;
    String title;
    GoodsItems goodsItems;
    SubType(
        {
          required this.id,
          required this.title,
          required this.goodsItems,

        }
    );
    factory SubType.fromJSON(Map<String, dynamic> json) {
        return SubType(
            id: json["id"]?.toString() ?? "",
            title: json["title"]?.toString() ?? "",
            goodsItems: GoodsItems.fromJSON(
                json["goodsItems"] as Map<String, dynamic>,
            ), // GoodsItems.fromJSON
        ); // SubType
    }
}

class SpecialRecommendResult {
    String id;
    String title;
    List<SubType> subTypes;
    SpecialRecommendResult({
        required this.id,
        required this.title,
        required this.subTypes,
    });
    factory SpecialRecommendResult.fromJson(Map<String, dynamic> json) {
        return SpecialRecommendResult(
            id: json["id"]?.toString() ?? "",
            title: json["title"]?.toString() ?? "",
            subTypes: (json["subTypes"] as List ?? [])
                .map((item) => SubType.fromJSON(item as Map<String, dynamic>))
                .toList()
        ); // SpecialRecommendResult
    }
}



class GoodDetailItem extends GoodsItem {
  int payCount = 0;

  /// 商品详情项
  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: "");
  // 转化方法
  factory GoodDetailItem.formJSON(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
      payCount: int.tryParse(json["payCount"]?.toString() ?? "0") ?? 0,
    );
  }
}



class GoodsDetailsItems {
    int counts;
    int pageSize;
    int pages;
    int page;
    List<GoodDetailItem> items;
    GoodsDetailsItems({
        required this.counts,
        required this.pageSize,
        required this.pages,
        required this.page,
        required this.items,
    });
    factory GoodsDetailsItems.fromJSON(Map<String, dynamic> json) {
        return GoodsDetailsItems(
            counts: int.tryParse(json["counts"]?.toString() ?? "0") ?? 0,
            pageSize: int.tryParse(json["pageSize"]?.toString() ?? "0") ?? 0,
            pages: int.tryParse(json["pages"]?.toString() ?? "0") ?? 0,
            page: int.tryParse(json["page"]?.toString() ?? "0") ?? 0,
            items: (json["items"] as List ?? [])
                .map((item) => GoodDetailItem.formJSON(item as Map<String, dynamic>))
                .toList(),
        );
    }
}




// 生成对应的class
class UserInfo {
  String account;
  String avatar;
  String birthday;
  String cityCode;
  String gender;
  String id;
  String mobile;
  String nickname;
  String profession;
  String provinceCode;
  String token;

  UserInfo({
    required this.account,
    required this.avatar,
    required this.birthday,
    required this.cityCode,
    required this.gender,
    required this.id,
    required this.mobile,
    required this.nickname,
    required this.profession,
    required this.provinceCode,
    required this.token,
  });

  factory UserInfo.fromJSON(Map<String, dynamic> json) => UserInfo(
    account: json["account"] ?? "",
    avatar: json["avatar"] ?? "",
    birthday: json["birthday"] ?? "",
    cityCode: json["cityCode"] ?? "",
    gender: json["gender"] ?? "",
    id: json["id"] ?? "",
    mobile: json["mobile"] ?? "",
    nickname: json["nickname"] ?? "",
    profession: json["profession"] ?? "",
    provinceCode: json["provinceCode"] ?? "",
    token: json["token"] ?? "",
  );
}
