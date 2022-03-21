import 'package:mvvm_example/data/model/Movie.dart';
import 'package:mvvm_example/data/repository/FilmRepository.dart';
import 'package:mvvm_example/domain/BaseUseCase.dart';

class GetFilmListUseCase implements BaseUseCase{
  late FilmRepository repository;
  String title;

  GetFilmListUseCase(this.repository, this.title);
  @override
  Future<List<Movie>> perform() {
    return repository.getFilmList(title);
  }
}