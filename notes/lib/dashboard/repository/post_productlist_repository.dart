import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:notes/dashboard/model/product.dart';
import 'package:notes/utils/apis.dart';
import 'package:notes/utils/http_manager.dart';

class PostProductRepository {
  HttpManager manager = HttpManager(client: Client());

  Future<int> hitProductPostapi(
      {required String name, required int price}) async {
    dynamic sendData = {"name": name, "price": price};
    try {
      final respo = await manager.hitApi(
          requestType: RequestEnum.post,
          url: Api.getProductList,
          param: jsonEncode(sendData));
      log('repo response code ${respo.statusCode}');

      if (respo.statusCode == 200) {
        log(respo.statusCode.toString());
        log(respo.body);
        return 1;
      } else {
        log(respo.statusCode.toString());
        log(respo.body);
        return 0;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
