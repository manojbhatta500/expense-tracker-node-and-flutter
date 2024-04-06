import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:notes/dashboard/model/product.dart';
import 'package:notes/utils/apis.dart';
import 'package:notes/utils/http_manager.dart';

class GetProductListRepository {
  HttpManager manager = HttpManager(client: Client());

  Future<Either<int, List<ProductClass>>> hitProductListapi() async {
    try {
      final respo = await manager.hitApi(
          requestType: RequestEnum.get, url: Api.getProductList);
      log('repo response code ${respo.statusCode}');

      if (respo.statusCode == 200) {
        final List<dynamic> data = jsonDecode(respo.body);
        return Right(data.map((item) => ProductClass.fromJson(item)).toList());
      } else {
        log(respo.statusCode.toString());
        log(respo.body);
        return Left(0);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
