import 'dart:convert';
import 'package:quotes/api/local_storage_api.dart';
import 'package:quotes/models/quote_model.dart';

class CacheQuoteRepo {
  final LocalStorageApi _localStorageApi;

  CacheQuoteRepo(this._localStorageApi);

  Future<void> cacheQuotes(List<Quote> quotes, String key) async {
    List<String> quotesS = quotes.map((e) => json.encode(e)).toList();

    await _localStorageApi.setQuotes(key, quotesS);
  }

  List<Quote> getCachQoutes(String key) {
    List<Quote> quotes = [];
    final q = _localStorageApi.getQuotes(key);

    if (q != null) {
      quotes = q.map((e) => Quote.fromJson(json.decode(e))).toList();
    }

    return quotes;
  }
}
