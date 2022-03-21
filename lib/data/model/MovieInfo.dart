class MovieInfo {
  final String title;
  final String releasedDate;
  final String runtime;
  final String actors;
  final String plot;
  final String posterUrl;

  MovieInfo({
    required this.title,
    required this.releasedDate,
    required this.runtime,
    required this.actors,
    required this.plot,
    required this.posterUrl,
  });
  factory MovieInfo.fromJson(Map<String, dynamic> json) {
    return MovieInfo(
      title: json['Title'],
      releasedDate: json['Released'],
      runtime: json['Runtime'],
      actors: json['Actors'],
      plot: json['Plot'],
      posterUrl: json['Poster'],
    );
  }
}