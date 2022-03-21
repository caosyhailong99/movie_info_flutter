import 'package:mvvm_example/data/model/Movie.dart';
import 'package:mvvm_example/data/model/MovieInfo.dart';

abstract class FilmApi {
  Future<List<Movie>> getMovieList(String title);
  Future<MovieInfo> getMovieInfo(String id);
}