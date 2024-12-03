import 'package:tv_plus/models/movie_model.dart';

class DataHelper{
  static List<MovieModel> downloadedMovies = [
    MovieModel(movieName: "Acil Teslimat", categories: ["Fantastik"], imagePath: "assets/images/acil_teslimat.jpg"),
    MovieModel(movieName: "Aile Arasında", categories: ["Aile","Komedi"], imagePath: "assets/images/aile_arasında.jpg"),
  ];

  static List<MovieModel> movieList = [
    MovieModel(movieName: "Acil Teslimat", categories: ["Fantastik"], imagePath: "assets/images/acil_teslimat.jpg"),
    MovieModel(movieName: "Aile Arasında", categories: ["Aile","Komedi"], imagePath: "assets/images/aile_arasında.jpg"),
    MovieModel(movieName: "Alabora Aşk", categories: ["Aşk"], imagePath: "assets/images/alabora_ask.jpg"),
    MovieModel(movieName: "Aşk Sarhoşu", categories: ["Romantik Komedi"], imagePath: "assets/images/ask_sarhosu.jpg"),
    MovieModel(movieName: "Automata", categories: ["Bilim Kurgu"], imagePath: "assets/images/automata.jpg"),
    MovieModel(movieName: "Ayrıldık", categories: ["Aşk","Romantik Komedi"], imagePath: "assets/images/ayrildik.jpg"),
    MovieModel(movieName: "Canavarlar Ligi", categories: ["Animasyon"], imagePath: "assets/images/canavarlar_ligi.jpg"),
    MovieModel(movieName: "Carlos", categories: ["Belgesel","Müzik"], imagePath: "assets/images/carlos.jpg"),
    MovieModel(movieName: "İç Savaş", categories: ["Dram","Aksiyon"], imagePath: "assets/images/ic_savas.jpg"),
    MovieModel(movieName: "Jackie", categories: ["Yaşam","Dram"], imagePath: "assets/images/jackie.jpg"),
    MovieModel(movieName: "Kuklacı", categories: ["Korku"], imagePath: "assets/images/kuklaci.jpg"),
    MovieModel(movieName: "Kutup Köpekleri", categories: ["Animasyon"], imagePath: "assets/images/kutup_kopekleri.jpg"),
    MovieModel(movieName: "Masal Zamanı 2 : Sihirli Kapı", categories: ["Fantastik"], imagePath: "assets/images/masal_zamani_2_sihirli_kapi.jpg"),
    MovieModel(movieName: "Messi", categories: ["Belgesel"], imagePath: "assets/images/messi.jpg"),
    MovieModel(movieName: "Ölümlü Dünya", categories: ["Aile","Komedi","Türk Filmi","Aksiyon"], imagePath: "assets/images/olumlu_dunya.jpg"),
    MovieModel(movieName: "Sesinde Aşk Var", categories: ["Aşk"], imagePath: "assets/images/sesinde_ask_var.jpg"),
    MovieModel(movieName: "Simulasyon", categories: ["Gerilim"], imagePath: "assets/images/simulasyon.jpg"),
    MovieModel(movieName: "Sir Ayet", categories: ["Türk Filmi","Korku"], imagePath: "assets/images/sir_ayet.jpg"),
    MovieModel(movieName: "Şövalye", categories: ["Müzik","Dram"], imagePath: "assets/images/sovalye.jpg"),
    MovieModel(movieName: "Vesper", categories: ["Macera"], imagePath: "assets/images/vesper.jpg"),
    MovieModel(movieName: "Wonder Woman - 1984", categories: ["Macera"], imagePath: "assets/images/wonder_woman_1984.jpg"),
    MovieModel(movieName: "Zaman Döngüsü", categories: ["Bilim Kurgu","Gerilim"], imagePath: "assets/images/zaman_dongusu.jpg"),
  ];

  static List<MovieModel> filteredList(int key){
    List<MovieModel> list;
    switch(key){
      case 1:
        list = movieList.where((x) => x.movieName.length<7).toList();
        break;
      case 2:
        list = movieList.where((x) => x.movieName.length>7).toList();
        break;
      case 3:
        list = movieList.where((x) => x.categories.contains("Macera")
        || x.categories.contains("Belgesel")
        || x.categories.contains("Animasyon")).toList();
        break;
      case 4:
        list = movieList.where((x) => x.categories.contains("Fantastik")
            || x.categories.contains("Bilim Kurgu")).toList();
        break;
      case 5:
        list = movieList.where((x) => x.categories.contains("Aşk")
            || x.categories.contains("Aile")
            || x.categories.contains("Romantik Komedi")).toList();
        break;
      case 6:
        list = movieList;
        break;
      case 7:
        list = movieList.where((x) => x.categories.contains("Korku")
            || x.categories.contains("Müzik")
            || x.categories.contains("Türk Filmi")
            || x.categories.contains("Dram")).toList();
        break;
        default:
          list = movieList;
          break;
    }

    return list;
  }

}