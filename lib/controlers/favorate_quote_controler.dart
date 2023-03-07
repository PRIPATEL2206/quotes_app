import 'package:quotes/models/quote_model.dart';
import 'package:quotes/repos/favorate_quotes_repo.dart';

class FavorateQuoteControler {
  final FavorateQuoteRepo _favorateQuoteRepo;
  List<Quote> _favorateQuotes = [];

  List<Quote> get favorateQuotes => _favorateQuotes;

  FavorateQuoteControler(this._favorateQuoteRepo);

  void getAllFavorteQuotes() {
    _favorateQuotes = _favorateQuoteRepo.getFavoriteQuotes();
  }

  void _saveFavorateQuotes() async {
    await _favorateQuoteRepo.setFavoriteQuotes(_favorateQuotes);
  }

  void addToFavorateQuote(Quote quote) {
    _favorateQuotes.add(quote);
    _saveFavorateQuotes();
  }

  void deleteFromFavorateQuote(Quote quote) {
    _favorateQuotes.remove(quote);
    _saveFavorateQuotes();
  }

  void deleteAllFavorateQuotes() {
    _favorateQuotes = [];
    _saveFavorateQuotes();
  }
}
