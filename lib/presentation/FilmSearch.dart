import 'package:flutter/material.dart';

import 'Search.dart';

class FilmSearch extends StatefulWidget {
  final recentList = List<String>.generate(10, (index) => "Text ${index + 1}");
  @override
  _FilmSearchState createState() => _FilmSearchState();
}

class _FilmSearchState extends State<FilmSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xB0000000),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            onPressed: () {
              showSearch(context: context, delegate: Search(widget.recentList));
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text(
          "FilmInfo List",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Hãy nhập tên phim để tìm kiếm",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
