//基于Dio进行二次封装

import 'package:dio/dio.dart';
import 'package:hm_shop/constants/index.dart';

class DioRequest {
  final dio = Dio();
    DioRequest(){
      dio.options..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
      _addInterceptors();
    }

  void _addInterceptors(){
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request,handler){ 
        return handler.next(request);
      },
      onResponse: (response,handler){
        if(response.statusCode! >= 200&&response.statusCode! < 300){
          return handler.next(response);
        }else{
          return handler.reject(DioException(requestOptions: response.requestOptions,response: response));
        }
      },
      onError: (error,handler){ 
        return handler.reject(error);
      }
    ));
  }
  
  Future<dynamic> get(String url,{Map<String,dynamic>? params}){
    return _handleResponse(dio.get(url,queryParameters: params));
  }

//进一步处理返回结果的函数
   Future<dynamic> _handleResponse(Future<Response<dynamic>> task)async{
      try{
   Response<dynamic> res=await task;
   final Map<String,dynamic> data=res.data as Map<String,dynamic>;
   if(data['code']==GlobalConstants.SUCCESS_CODE){
    //认定http状态和业务状态均正常就可以正常的放行通过
     return data['result'];
   }else{
     throw Exception(data["msg"]??"加载数据异常");
   }
  }catch(e){
    throw Exception(e);
  } 
 }

 }



//单例模式
final dioRequest =DioRequest();