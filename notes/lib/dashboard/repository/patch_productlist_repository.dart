import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:notes/dashboard/model/product.dart';
import 'package:notes/utils/apis.dart';
import 'package:notes/utils/http_manager.dart';

class PatchProductListRepository {
  HttpManager manager = HttpManager(client: Client());

  Future<int> hitProductpatchapi(
      {required String id, required String name, required int price}) async {
    dynamic sendData = {"id": id, "name": name, "price": price};
    log('benfakdsndsa');
    try {
      final respo = await manager.hitApi(
          requestType: RequestEnum.patch,
          url: Api.getProductList,
          param: jsonEncode(sendData));
      log('repo response code ${respo.statusCode}');

      if (respo.statusCode == 200) {
        log('hello  this is runnning');
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
