
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:app_flutter/config/httpHeader.dart';
import 'package:app_flutter/config/serviceUrl.dart';


Future getCommunityData() async{
    // 捕获异常
  try {
    Response response;
    Dio dio = Dio();
    // 设置请求头（类型）
    dio.options.contentType=ContentType.parse('application/x-www-form-urlencoded');
    var formData={'type':1};
    response = await dio.post(servicePath['community'], data: formData);
    if (response.statusCode==200) {
      return response.data;
    } else {
      throw Exception('接口错误'); 
    }
  } catch (error) {
    return print('error ====>  $error');
  }
} 
// 分类数据
  /*
   * 获取category 数据 
   */

Future requestCategoryData(param) async{
  return requestGet('category', geekH5httpHeaders, parameters: param);
}


// 首页数据
/*
 * 获取推荐数据 
 */
Future getRecommendList() async{
  return requestGet('recommendList', geekH5httpHeaders);
}

/*
 * 请求优选数据 
 */
Future getExcellentList(param) async{
  return requestGet('excellentList', geekH5httpHeaders, parameters: param);
}

Future getTopNavListData() async{
  return requestGet('topNavList', geekH5httpHeaders);
  // try {
  //   Response response;
  //   Dio dio = Dio();
  //   dio.options.headers = geekH5httpHeaders;
  //   response=await dio.get(servicePath['topNavList']);
  //   if (response.statusCode==200) {
  //     return response.data;
  //   } else {
  //     throw Exception('接口错误');
  //   }
  // } catch (e) {
  //   return print(e);
  // }
}

/*
 * 获取极客时间banner 数据 
 */
Future getGeekBannerListData() async{
  return requestPost('bannerList', httpHeaders);

    // try {
    //   Response response;
    //   // 申明Dio 对象，需要对operation 赋值
    //   Dio dio = Dio();
    //   dio.options.headers=httpHeaders;
    //   response=await dio.post(servicePath['bannerList']);
    //   print(response);
    //   if (response.statusCode==200) {
    //     return response.data;
    //   } else {
    //     throw Exception('接口错误');
    //   } 
    // } catch (error) {
    //   return print(error);
    // }
  }

/*
 * 获取极客时间所有数据接口 
 */
Future getGeekNewAllData() async{
  return requestPost('newAll', httpHeaders);

  // try {
  //   Dio dio = new Dio();
  //   dio.options.headers = httpHeaders;
  //   Response response;
  //   response = await dio.post(servicePath['newAll']);
  //   if (response.statusCode==200) {
  //     return response.data;
  //   } else {
  //     throw Exception('极客NewAll接口错误');
  //   }
  // } catch (e) {
  //   return print('getGeekNewAllData Error ====> $e');
  // }
}


Future getNewProductListData() async{
  return requestGet('newProduct', geekH5httpHeaders);

/*
  try {
    Response response;
    Dio dio = Dio();
    dio.options.headers = geekH5httpHeaders;
    response=await dio.get(servicePath['newProduct']);
    if (response.statusCode==200) {
      return response.data;
    } else {
      throw Exception('接口错误');
    }
  } catch (e) {
    return print(e);
  }
  */
}

/*
 * Dio get 请求测试 
 */
Future getHttp(String typeStr) async{
    try{
      Response response;
      var parameters = {'name': typeStr};
      response = await Dio().get(
        'https://easy-mock.com/mock/5d3c316e96f5a648a8495fa2/example/flutter_test_get',
        queryParameters: parameters,
        onReceiveProgress: (progress, tap){
          print(progress);
        } 
      );
      return response.data;
    }catch(error){
      return print(error);
    }
  }


  /*
 * TODO: 封装简单Get网络请求
 * url: 请求地址
 * {formData} 可选参数 
 */ 

Future requestPost(url, headers, {formData}) async{
  try {
    print('start request === $url, formData = $formData');
    Response response;
    Dio dio = Dio();
    dio.options.headers = headers;
    // 设置请求头（类型）
    // dio.options.contentType=ContentType.parse('application/x-www-form-urlencoded');
    if (formData==null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    if (response.statusCode==200) {
      return response.data;
    } else {
      throw Exception('接口错误'); 
    }
  } catch (error) {
    return print('error ====>  $error');
  }
}

/*
 * TODO: 封装简单Post网络请求
 * url: 请求地址
 * {parameters} 可选参数 
 */ 
Future requestGet(url, headers, {parameters}) async{
  try {
    print('start request === $url, formData = $parameters');
    Response response;
    Dio dio = Dio();
    dio.options.headers = headers;
    // 设置请求头（类型）
    // dio.options.contentType=ContentType.parse('application/x-www-form-urlencoded');
    if (parameters==null) {
      response = await dio.get(servicePath[url]);
    } else {
      response = await dio.get(servicePath[url], queryParameters: parameters);
    }
    if (response.statusCode==200) {
      return response.data;
    } else {
      throw Exception('接口错误'); 
    }
  } catch (error) {
    return print('error ====>  $error');
  }
}