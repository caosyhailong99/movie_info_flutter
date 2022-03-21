import 'package:mvvm_example/data/model/Movie.dart';
import 'package:mvvm_example/data/model/MovieInfo.dart';
import 'package:mvvm_example/data/remote/FilmApiImpl.dart';
import 'package:mvvm_example/data/repository/FilmRepositoryImpl.dart';
import 'package:mvvm_example/domain/GetFilmInfoUseCase.dart';
import 'package:mvvm_example/domain/GetFilmListUseCase.dart';

class FilmInfoViewModel {
  late MovieInfo movieInfo;
  List<Movie> movieList = [];

  Future<MovieInfo> getFilmInfo(String id) async {
    GetFilmInfoUseCase getFilmInfoUseCase = GetFilmInfoUseCase(FilmRepositoryImpl(FilmApiImpl()), id);
    movieInfo = await getFilmInfoUseCase.perform();
    print("Title: " + movieInfo.title);
    print("Poster URL: " + movieInfo.posterUrl);
    return movieInfo;
  }

  Future<List<Movie>> getFilmList(String title) async {
    final getFilmListUseCase = GetFilmListUseCase(FilmRepositoryImpl(FilmApiImpl()), title);
    movieList = await getFilmListUseCase.perform();
    return movieList;
  }
}