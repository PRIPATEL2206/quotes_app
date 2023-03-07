import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/Pages/detail_quote_page.dart';
import 'package:quotes/components/app_text.dart';
import 'package:quotes/models/quote_model.dart';

class QuoteBox extends StatelessWidget {
  final Quote quote;
  final Icon? icon;
  final VoidCallback? onIconPress;

  const QuoteBox({
    super.key,
    required this.quote,
    this.onIconPress,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => DetailQutePage(quote: quote),
          transition: Transition.fadeIn),
      child: Container(
        height: 110,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [BoxShadow(blurRadius: 2)],
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppText(
                  text: quote.content,
                  color: Colors.white,
                  fontSize: 27,
                  textAlign: TextAlign.center,
                  maxLine: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                  onPressed: onIconPress,
                  icon: icon ??
                      Icon(
                        quote.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: const Color.fromARGB(255, 240, 72, 60),
                        size: 30,
                      )),
            ],
          ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: quote.dateModified,
                color: const Color.fromARGB(255, 156, 204, 198),
              ),
              AppText(
                text: "- ${quote.author}",
                fontSize: 18,
                color: Colors.white,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
