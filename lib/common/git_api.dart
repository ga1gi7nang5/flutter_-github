import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

import '../export.dart';

class Git {
  BuildContext context;
  Options _options;

  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'https://api.github.com/',
    headers: {
      HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
          "application/vnd.github.symmetra-preview+json",
    },
  ));

  Git([this.context]) {
    _options = Options(extra: {"context": context});
  }

  static void init() {
    // 添加缓存插件
    dio.interceptors.add(Global.netCache);
    // 设置用户token（可能为null，代表未登录）
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (!Global.isRelease) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.findProxy = (uri) {
          return "PROXY 192.168.217.59:8888";
        };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  Future<User> login(String name, String password) async {
    String basic = 'Basic ' + base64.encode(utf8.encode('$name:$password'));
    var r = await dio.get("/users/$name",
      options: _options.merge(
        headers: {
          HttpHeaders.authorizationHeader: basic
        },
        extra: {
          "noCache": true
        }
    ));
    // 登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
    dio.options.headers[ HttpHeaders.authorizationHeader] = basic;
    // 清空所有的缓存
    Global.netCache.cache.clear();
    //更新profile中的token信息
    Global.profile.token = basic;
    Global.profile.lastLogin = name;
    return User.fromJson(r.data);
  }

}