
import 'dart:io';
import 'package:app_flutter/config/chj_service_Url.dart';
import 'package:dio/dio.dart';
import 'package:app_flutter/config/httpHeader.dart';
import 'package:app_flutter/config/serviceUrl.dart';


Future getCommunityData() async{
    // 捕获异常
  try {
    Response response;
    Dio dio = Dio();
    // 设置请求头（类型）
    dio.options.baseUrl=baseUrl;
    dio.options.headers=httpHeaders;
    dio.options.contentType=ContentType.parse('application/x-www-form-urlencoded');
    response = await dio.get(urlPath['communityPageList']);
    if (response.statusCode==200) {
      return response.data;
    } else {
      throw Exception('接口错误'); 
    }
  } catch (error) {
    return print('error ====>  $error');
  }
} 


Future getMockCategoryData() async{
  try {
    Response response;
    Dio dio = Dio();
    String url = mockBaseUrl + '/categoyr/list';
    response = await dio.get(url);
    if (response.statusCode==200) {
      return response.data;
    } else {
      throw Exception('接口错误'); 
    }
  } catch (error) {
    return print('error ====>  $error');
  }
}

Future getGoodsListData(type) async{
  try {
    Response response;
    Dio dio = Dio();
    String url = mockBaseUrl + '/categoyr/goodsList' + type;
    response = await dio.get(url);
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
  try {
    Response response;
    Dio dio = Dio();
    dio.options.headers = geekH5httpHeaders;
    response = await dio.get(servicePath['bannerList']);
    if (response.statusCode==200) {
      return response.data;
    } else {
      throw Exception('接口错误'); 
    }
  } catch (error) {
    return print('error ====>  $error');
  }
}


// 首页数据
/*
 * 获取推荐数据 
 */
Future getRecommendList() async{
  return requestGet('/home/recommend');
}

/*
 * 请求优选数据 
 */
Future getExcellentList(param) async{
  return requestGet('/home/origional');
}

Future getTopNavListData() async{
  return requestGet('topNavList');
}

/*
 * 获取极客时间banner 数据 
 */
Future getGeekBannerListData() async{
  try {
    Response response;
    Dio dio = Dio();
    dio.options.headers = httpHeaders;
    response = await dio.get(servicePath['bannerList']);
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
 * 获取极客时间所有数据接口 
 */
Future getGeekNewAllData() async{
  return requestGet('/home/all');
}


Future getNewProductListData() async{
  // return requestGet(servicePath['newProduct'], headers: httpHeaders, isMock: false);


  try {
    Response response;
    Dio dio = Dio();
    dio.options.headers = httpHeaders;
    response = await dio.get(servicePath['newProduct']);
    if (response.statusCode==200) {
      return response.data;
    } else {
      throw Exception('接口错误'); 
    }
  } catch (error) {
    return print('error ====>  $error');
  }

  // return requestGet('/home/origional');
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
Future requestGet(url, {headers, parameters, isMock=true}) async{
  try {
    print('start request === $url, formData = $parameters');
    
    String requestURL= isMock ? (mockBaseUrl + url) : (geekH5BaseUrl + url);
    Response response;
    Dio dio = Dio();
    if (headers != null){
      dio.options.headers = headers;
    } 
    if (parameters==null) {
      response = await dio.get(requestURL);
    } else {
      response = await dio.get(requestURL, queryParameters: parameters);
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