import 'package:flutter/material.dart';

class ToastUtils {
  static void showToast(BuildContext context,String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        duration: Duration(seconds: 5),
        width: 120,
        behavior: SnackBarBehavior.floating,
        content: Text(msg??"加载成功",textAlign: TextAlign.center,),
      ),
    );
  }
}