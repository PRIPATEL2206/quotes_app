import 'package:flutter/material.dart';
import 'package:quotes/Pages/all_quote.dart';
import 'package:quotes/Pages/auth_quote.dart';
import 'package:quotes/Pages/favorite_quotes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> pages;
  late int _curentPage;

  @override
  void initState() {
    super.initState();
    pages = [
      const AuthorQuote(),
      const AllQuote(),
      const FavorateQuotes(),
    ];
    _curentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_curentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curentPage,
        onTap: (value) {
          setState(() {
            _curentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: "Auther Quotes", icon: Icon(Icons.person_search_outlined)),
          BottomNavigationBarItem(
              label: "All Quotes", icon: Icon(Icons.book_online)),
          BottomNavigationBarItem(
              label: "Favorite", icon: Icon(Icons.favorite)),
        ],
      ),
    );
  }
}
