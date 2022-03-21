import 'package:flutter/material.dart';
import 'package:mvvm_example/component/FilmCard.dart';
import 'package:mvvm_example/presentation/FilmInfoScreen.dart';
import 'package:mvvm_example/presentation/FilmInfoViewModel.dart';

class Search extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget> [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  String? selectedResult;

  @override
  Widget buildResults(BuildContext context) {
    FilmInfoViewModel viewModel = FilmInfoViewModel();
    return FutureBuilder(
      future: viewModel.getFilmList(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: viewModel.movieList.length,
            itemBuilder: (context, index) => GestureDetector(
              child: Hero(
                tag: 'infoHero$index',
                child: FilmCard(
                  viewModel: viewModel,
                  index: index,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilmInfoScreen(
                      index: index,
                      id: viewModel.movieList[index].id,
                      viewModel: viewModel,
                    ),
                  )
                );
              },
            ),
          );
        }
        if(snapshot.hasError) {
          return Text("Không tìm được kết quả");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  late final List<String> listExample;
  Search(this.listExample);
  List<String> recentList = ["Text 6", "Text 7"];
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
      ? suggestionList = recentList
      : suggestionList.addAll(listExample.where(
          (element) => element.contains(query)));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestionList[index]),
        onTap: () {
          query = suggestionList[index];
          showResults(context);
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme;
  }
}
