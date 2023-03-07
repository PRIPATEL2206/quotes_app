import 'package:quotes/constants/constants.dart';
import 'package:quotes/models/quote_model.dart';
import 'package:quotes/repos/cache_quote_repo.dart';
import 'package:quotes/repos/web_repo.dart';

class AllQuoteControler {
  final WebRepo _webRepo;
  final CacheQuoteRepo _cacheQuoteRepo;
  bool _isQuoteLoded = false;
  AllQuoteControler(this._webRepo, this._cacheQuoteRepo);
  List<Quote> _allQuotes = [];
  List<Quote> _cacheAllQuote = [];

  bool get isQuoteLoded => _isQuoteLoded;
  List<Quote> get allQuotes => _allQuotes;
  List<Quote> get cacheAllQuote => _cacheAllQuote;

  Future<void> getAllQuote(String topic, int limit) async {
    _isQuoteLoded = false;
    _allQuotes = await _webRepo
        .getQuotes("${AppConstants.allQuoteUrl}?query=$topic&limit=$limit");

    if (_allQuotes != []) {
      _saveCachAllQuotes();
    }
    _isQuoteLoded = true;
  }

  // caching
  Future<void> _saveCachAllQuotes() async {
    _cacheQuoteRepo.cacheQuotes(_allQuotes, AppConstants.allCachQuoteKey);
  }

  void getCachAllQuote() {
    _cacheAllQuote =
        _cacheQuoteRepo.getCachQoutes(AppConstants.allCachQuoteKey);
  }
}
