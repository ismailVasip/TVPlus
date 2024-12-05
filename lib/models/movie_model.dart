class MovieModel {
  final int id;
  final String movieType;
  final String movieName;
  final List<String> categories;
  final String imagePath;

  MovieModel(
      {
        required this.id,
        required this.movieType,
        required this.movieName,
        required this.categories,
        required this.imagePath
      }
      );

  @override
  String toString() {
    return categories.join(" , ");
  }
}