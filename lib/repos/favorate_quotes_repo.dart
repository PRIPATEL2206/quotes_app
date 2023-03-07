import 'dart:convert';
import 'package:quotes/api/local_storage_api.dart';
import 'package:quotes/constants/constants.dart';
import 'package:quotes/models/quote_model.dart';

class FavorateQuoteRepo {
  final LocalStorageApi _localStorageApi;
  FavorateQuoteRepo(this._localStorageApi);

// geting data
  List<Quote> getFavoriteQuotes() {
    List<Quote> quotes = [];
    final q = _localStorageApi.getQuotes(AppConstants.favorateQuoteKey);
    if (q != null) {
      quotes = q.map((e) => Quote.fromJson(json.decode(e))).toList();
    }
    return quotes;
  }

  // seting data

  Future<void> setFavoriteQuotes(List<Quote> quotes) async {
    List<String> quotesS = quotes.map((e) => json.encode(e)).toList();

    await _localStorageApi.setQuotes(AppConstants.favorateQuoteKey, quotesS);
  }
}
