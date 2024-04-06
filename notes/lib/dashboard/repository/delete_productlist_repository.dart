import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:notes/dashboard/model/product.dart';
import 'package:notes/utils/apis.dart';
import 'package:notes/utils/http_manager.dart';

class DeleteProductRepository {
  HttpManager manager = HttpManager(client: Client());

  Future<int> hitProductdeleteApi({required String id}) async {
    dynamic sendData = {"id": id};
    try {
      final respo = await manager.hitApi(
          requestType: RequestEnum.delete,
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
