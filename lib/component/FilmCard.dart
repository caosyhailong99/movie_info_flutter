import 'package:flutter/material.dart';
import 'package:mvvm_example/presentation/FilmInfoViewModel.dart';

class FilmCard extends StatelessWidget{
  final FilmInfoViewModel viewModel;
  final int index;

  const FilmCard({Key? key, required this.viewModel, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card (
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10,),
        child: Column(
          children: [
            if(viewModel.movieList[index].posterUrl.compareTo("N/A") == 0)
              Expanded(
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
                    viewModel.movieList[index].posterUrl,
                  ),
                ),
              ),
            Text(
              viewModel.movieList[index].title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      shadowColor: Colors.black,
      elevation: 10,
    );
  }

}