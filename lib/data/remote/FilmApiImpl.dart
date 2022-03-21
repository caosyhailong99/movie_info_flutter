import 'dart:convert';
import 'package:mvvm_example/data/model/Movie.dart';
import 'package:mvvm_example/data/model/MovieInfo.dart';
import 'package:mvvm_example/data/remote/FilmApi.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_example/utils/api_string.dart';

class FilmApiImpl implements FilmApi{
  @override
  Future<MovieInfo> getMovieInfo(String id) async {
    final queryParameter = {'apikey': API_KEY, 'i': id};
    final uri = Uri.https(omdbAPI, "", queryParameter); // omdbAPI là tên trang chủ API
    final response = await http.get(uri);
    if(response.statusCode == 200) {
      return MovieInfo.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception("Không thể lấy nội dung film");
    }
  }

  @override
  Future<List<Movie>> getMovieList(String title) async {
    final queryParameter = {'apikey': API_KEY, 's': title};
    final uri = Uri.https(omdbAPI, "", queryParameter);
    final response = await http.get(uri);
    String responseBody = response.body;
    if (response.statusCode == 200) {
      final parsed = jsonDecode(responseBody)["Search"] as List;
      return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
    }
    else {
      throw Exception("Không thể tìm thấy film");
    }
  }

}