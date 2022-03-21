import 'package:mvvm_example/data/model/Movie.dart';
import 'package:mvvm_example/data/model/MovieInfo.dart';

abstract class FilmRepository {
  Future<MovieInfo> getFilmInfo(String id);

  Future<List<Movie>> getFilmList(String title);
}