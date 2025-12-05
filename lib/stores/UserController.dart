import 'package:get/get.dart';
import 'package:hm_shop/viewmodels/home.dart';

class UserController extends GetxController {
    var userInfo = UserInfo.fromJSON({}).obs;

    void updateUserInfo(UserInfo newUser){
      userInfo.value=newUser;
    }
}