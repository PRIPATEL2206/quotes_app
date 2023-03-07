import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/components/app_text.dart';
import 'package:quotes/components/quote_box.dart';
import 'package:quotes/controlers/auther_quote_controler.dart';
import 'package:quotes/controlers/favorate_quote_controler.dart';
import 'package:quotes/models/quote_model.dart';

class AuthorQuote extends StatefulWidget {
  const AuthorQuote({super.key});

  @override
  State<AuthorQuote> createState() => _AuthorQuoteState();
}

class _AuthorQuoteState extends State<AuthorQuote> {
  late AutherQuoteControler _autherQuoteControler;
  late TextEditingController _search;
  bool _isSearch = false;
  late FavorateQuoteControler _favorateQuoteControler;
  late List<Quote> _cachQoutes;

  @override
  void initState() {
    super.initState();
    _autherQuoteControler = Get.find<AutherQuoteControler>();
    _search = TextEditingController(text: "");
    _favorateQuoteControler = Get.find<FavorateQuoteControler>();
    _autherQuoteControler.getCachAutherQuote();
    _cachQoutes = _autherQuoteControler.cacheAutherQuote;
  }

  @override
  void dispose() {
    super.dispose();
    _search.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quotesToshow =
        _isSearch ? _autherQuoteControler.autherQuote : _cachQoutes;
    return Scaffold(
      appBar: AppBar(
          title: TextField(
        onEditingComplete: () async {
          if (_search.text != "") {
            await _autherQuoteControler.getAutherQuote(_search.text);
            setState(() {
              _isSearch = true;
            });
          } else {
            setState(() {
              _isSearch = false;
            });
          }
        },
        controller: _search,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
            hintText: "Auther", prefixIcon: Icon(Icons.search)),
      )),
      body: quotesToshow.isNotEmpty
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    QuoteBox(
                      quote: quotesToshow[0],
                      onIconPress: () {
                        if (!quotesToshow[0].isFavorite) {
                          setState(() {
                            quotesToshow[0].isFavorite = true;
                            _favorateQuoteControler
                                .addToFavorateQuote(quotesToshow[0]);
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
            )
          : const Center(
              child: AppText(
                text: "Plese Search any Auther",
                fontSize: 20,
              ),
            ),
    );
  }
}
