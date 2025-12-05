import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

//猜你喜欢有参数
//page:1,pageSize:10
Future<GoodsDetailsItems> getGuessListAPI(Map<String,dynamic> params) async {
return GoodsDetailsItems.fromJSON(await dioRequest.get(HttpConstants.GUESS_LIST,params: params));
  
} 

//登录有参数
//mobile:13800000000,password:123456
Future<UserInfo> loginAPI(Map<String,dynamic> data) async {
  return UserInfo.fromJSON(await dioRequest.post(HttpConstants.LOGIN,data: data));
}