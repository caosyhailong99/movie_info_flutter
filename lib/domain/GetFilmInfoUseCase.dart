import 'package:mvvm_example/data/model/MovieInfo.dart';
import 'package:mvvm_example/data/repository/FilmRepository.dart';
import 'package:mvvm_example/domain/BaseUseCase.dart';

class GetFilmInfoUseCase implements BaseUseCase{
  final FilmRepository filmRepository;
  final String id;

  GetFilmInfoUseCase(this.filmRepository, this.id);



  @override
  Future<MovieInfo> perform() {
    return filmRepository.getFilmInfo(id);
  }

}