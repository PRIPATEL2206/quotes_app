import 'package:quotes/constants/constants.dart';
import 'package:quotes/models/quote_model.dart';
import 'package:quotes/repos/cache_quote_repo.dart';
import 'package:quotes/repos/web_repo.dart';

class AutherQuoteControler {
  final WebRepo _webRepo;
  final CacheQuoteRepo _cacheQuoteRepo;
  AutherQuoteControler(this._webRepo, this._cacheQuoteRepo);
  bool _isQuoteLoded = false;
  List<Quote> _autherQuote = [];
  List<Quote> _cacheAutherQuote = [];

  bool get isQuoteLoded => _isQuoteLoded;
  List<Quote> get autherQuote => _autherQuote;
  List<Quote> get cacheAutherQuote => _cacheAutherQuote;

  Future<void> getAutherQuote(String auther) async {
    _isQuoteLoded = false;
    _autherQuote = await _webRepo
        .getQuotes("${AppConstants.allQuoteUrl}?query=$auther&limit=1");
    if (_autherQuote != []) {
      _saveCachAutherQuotes();
    }
    _isQuoteLoded = true;
  }

// caching
  Future<void> _saveCachAutherQuotes() async {
    _cacheQuoteRepo.cacheQuotes(_autherQuote, AppConstants.authCachingQuoteKey);
  }

  void getCachAutherQuote() {
    _cacheAutherQuote =
        _cacheQuoteRepo.getCachQoutes(AppConstants.authCachingQuoteKey);
  }
}
