import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/components/app_slider.dart';
import 'package:quotes/components/app_text.dart';
import 'package:quotes/components/quote_box.dart';
import 'package:quotes/controlers/all_quote_controler.dart';
import 'package:quotes/controlers/favorate_quote_controler.dart';
import 'package:quotes/models/quote_model.dart';

class AllQuote extends StatefulWidget {
  const AllQuote({super.key});

  @override
  State<AllQuote> createState() => _AllQuoteState();
}

class _AllQuoteState extends State<AllQuote> {
  late AllQuoteControler _allQuoteControler;
  late TextEditingController _search;
  bool _isSearch = false;
  int _limit = 10;

  late FavorateQuoteControler _favorateQuoteControler;
  late List<Quote> _cachQoutes;

  @override
  void initState() {
    super.initState();
    _allQuoteControler = Get.find<AllQuoteControler>();
    _search = TextEditingController(text: "");

    _favorateQuoteControler = Get.find<FavorateQuoteControler>();
    _allQuoteControler.getCachAllQuote();
    _cachQoutes = _allQuoteControler.cacheAllQuote;
  }

  @override
  void dispose() {
    super.dispose();
    _search.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quotesToshow = _isSearch ? _allQuoteControler.allQuotes : _cachQoutes;
    return Scaffold(
      appBar: AppBar(
          actions: [
            InkWell(
              onTap: () async {
                _limit = await _showRagePicker(context, _limit);
                setState(() {});
              },
              child: Container(
                  padding: const EdgeInsets.only(right: 4),
                  child: Stack(children: [
                    Column(
                      children: const [
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.settings),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 12,
                      child: Container(
                        padding: const EdgeInsets.all(.5),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: AppText(
                          text: "$_limit",
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ])),
            )
          ],
          title: TextField(
            controller: _search,
            onEditingComplete: () {
              if (_search.text != "") {
                _allQuoteControler
                    .getAllQuote(_search.text, _limit)
                    .then((value) => setState(() {
                          _isSearch = true;
                        }));
              } else {
                setState(() {
                  _isSearch = false;
                });
              }
            },
            textInputAction: TextInputAction.search,
            decoration: const InputDecoration(
                hintText: "Topic", prefixIcon: Icon(Icons.search)),
          )),
      body: quotesToshow.isNotEmpty
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    for (final quote in quotesToshow)
                      QuoteBox(
                        quote: quote,
                        onIconPress: () {
                          if (!quote.isFavorite) {
                            setState(() {
                              quote.isFavorite = true;
                              _favorateQuoteControler.addToFavorateQuote(quote);
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
              text: "Plese Search Any Topic",
              fontSize: 20,
            )),
    );
  }

  Future<int> _showRagePicker(BuildContext context, int limit) async {
    await showDialog(
      context: context,
      builder: (dilogContext) {
        int choses = limit;
        return AlertDialog(
          title: const AppText(text: "Set limit of Quotes"),
          actions: [
            AppSlider(
              limit: choses.toDouble(),
              onChange: (value) {
                choses = value.floor();
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    limit = choses;
                    Navigator.pop(dilogContext);
                  },
                  child: const AppText(
                    text: "Set",
                  )),
            )
          ],
        );
      },
    );

    return limit;
  }
}
