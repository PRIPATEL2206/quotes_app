import 'package:get/get.dart';
import 'package:quotes/api/web_api.dart';
import 'package:quotes/models/quote_model.dart';

class WebRepo {
  final WebApi _webApi;
  WebRepo(this._webApi);

  Future<List<Quote>> getQuotes(String url) async {
    Response response = await _webApi.getQuotes(url);
    List<Quote> quotes = [];
    // print(url);
    // print("web repo response code = ${response.statusCode}");
    if (response.statusCode == 200) {
      for (var value in (response.body["results"] as List)) {
        quotes.add(Quote.fromJson(value));
      }
      // print("web repo return list = = ${quotes[0].content}");
    }
    return quotes;
  }
}
