import 'package:flutter/material.dart';
import 'package:mvvm_example/data/model/MovieInfo.dart';
import 'package:mvvm_example/presentation/FilmInfoViewModel.dart';

class FilmInfoScreen extends StatelessWidget {
  final int index;
  final String id;
  final FilmInfoViewModel viewModel;

  const FilmInfoScreen({Key? key, required this.index, required this.id,
    required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: viewModel.getFilmInfo(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            MovieInfo? info = snapshot.data as MovieInfo?;
            print(info!.title);
            print(info.releasedDate);
            return Hero(
              tag: 'infoHero$index',
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if(info.posterUrl.compareTo("N/A") == 0)
                      Flexible(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "N/A",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    else
                      Flexible(
                        child: Image(
                          image: NetworkImage(
                            info.posterUrl,
                          ),
                        ),
                      ),
                    Text(
                      "Title: ${info.title}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "Released date: ${info.releasedDate}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Runtime: ${info.runtime}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Actors: ${info.actors}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Plot",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 20, bottom: 20,),
                    ),
                    Text(
                      info.plot,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Không thể lấy thông tin film"),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}