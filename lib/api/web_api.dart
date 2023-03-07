import 'package:get/get_connect.dart';

class WebApi extends GetConnect {
  WebApi({required String homeUrl}) {
    baseUrl = homeUrl;
  }

  Future<Response> getQuotes(String url) async {
    return await get(url);
  }
}
