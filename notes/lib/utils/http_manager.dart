import 'package:http/http.dart';

enum RequestEnum { get, post, patch, delete }

class HttpManager {
  final Client client;
  HttpManager({required this.client});

  Future<Response> hitApi(
      {required RequestEnum requestType, required String url, dynamic param}) {
    Map<String, String> heading = {
      'Content-Type': 'application/json',
    };

    switch (requestType) {
      case RequestEnum.get:
        return client.get(Uri.parse(url), headers: heading);
      case RequestEnum.post:
        return client.post(Uri.parse(url), headers: heading, body: param);
      case RequestEnum.patch:
        return client.patch(Uri.parse(url), headers: heading, body: param);
      case RequestEnum.delete:
        return client.delete(Uri.parse(url), headers: heading, body: param);
      default:
        throw Exception('sorry the provided path is not right');
    }
  }
}
