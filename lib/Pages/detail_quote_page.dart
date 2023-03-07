import 'package:flutter/material.dart';
import 'package:quotes/components/app_text.dart';
import 'package:quotes/models/quote_model.dart';

class DetailQutePage extends StatelessWidget {
  final Quote quote;

  const DetailQutePage({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const AppText(
        text: "Quotes",
      )),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            AppText(
              text: quote.content,
              fontSize: 27,
              maxLine: 15,
              textAlign: TextAlign.center,
              color: const Color.fromARGB(255, 2, 66, 60),
              fontWeight: FontWeight.w500,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText(
                  text: "- ${quote.author}",
                  fontSize: 18,
                  color: Colors.teal,
                ),
              ],
            ),
            Expanded(flex: 4, child: Container())
          ],
        ),
      ),
    );
  }
}
