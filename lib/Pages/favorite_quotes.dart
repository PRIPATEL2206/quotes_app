import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/components/app_text.dart';
import 'package:quotes/components/quote_box.dart';
import 'package:quotes/controlers/favorate_quote_controler.dart';

class FavorateQuotes extends StatefulWidget {
  const FavorateQuotes({super.key});

  @override
  State<FavorateQuotes> createState() => _FavorateQuotesState();
}

class _FavorateQuotesState extends State<FavorateQuotes> {
  late FavorateQuoteControler _favorateQuoteControler;
  late TextEditingController _search;

  @override
  void initState() {
    super.initState();
    _search = TextEditingController(text: "");
    _favorateQuoteControler = Get.find<FavorateQuoteControler>();
    _favorateQuoteControler.getAllFavorteQuotes();
  }

  @override
  Widget build(BuildContext context) {
    final qoutesToShow = _favorateQuoteControler.favorateQuotes.where(
        (element) =>
            element.content.toLowerCase().contains(_search.text.toLowerCase()));
    return Scaffold(
      appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                _favorateQuoteControler.deleteAllFavorateQuotes();
                setState(() {});
              },
              child: const Center(child: AppText(text: "Delete All")),
            )
          ],
          title: TextField(
            controller: _search,
            onChanged: (value) => setState(() {}),
            decoration: const InputDecoration(
                hintText: "Search", prefixIcon: Icon(Icons.search)),
          )),
      body: qoutesToShow.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
              children: [
                for (final quote in qoutesToShow)
                  QuoteBox(
                    quote: quote,
                    onIconPress: () {
                      setState(() {
                        _favorateQuoteControler.deleteFromFavorateQuote(quote);
                      });
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                    ),
                  )
              ],
            ))
          : const Center(
              child: AppText(
                text: "Add to Favorate",
                fontSize: 20,
              ),
            ),
    );
  }
}
