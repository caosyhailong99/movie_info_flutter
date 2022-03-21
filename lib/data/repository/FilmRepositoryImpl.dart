import 'package:mvvm_example/data/model/Movie.dart';
import 'package:mvvm_example/data/model/MovieInfo.dart';
import 'package:mvvm_example/data/remote/FilmApi.dart';
import 'FilmRepository.dart';

class FilmRepositoryImpl implements FilmRepository{
  late FilmApi filmApi;

  FilmRepositoryImpl(FilmApi api) {
    this.filmApi = api;
  }

  @override
  Future<MovieInfo> getFilmInfo(String id) {
    return filmApi.getMovieInfo(id);
  }

  @override
  Future<List<Movie>> getFilmList(String title) {
    return filmApi.getMovieList(title);
  }
}