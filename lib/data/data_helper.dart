import 'package:tv_plus/models/movie_model.dart';
import 'package:tv_plus/models/tv_model.dart';

class DataHelper{



  static List<MovieModel> movieList = [
    MovieModel(id : 1 ,movieType : "Film",movieName: "Aile Arasında", categories: ["Aile","Komedi"], imagePath: "assets/images/aile_arasında.jpg"),
    MovieModel(id : 2 ,movieType : "Dizi",movieName: "Alabora Aşk", categories: ["Aşk"], imagePath: "assets/images/alabora_ask.jpg"),
    MovieModel(id : 3 ,movieType : "Film",movieName: "Aşk Sarhoşu", categories: ["Romantik Komedi"], imagePath: "assets/images/ask_sarhosu.jpg"),
    MovieModel(id : 4 ,movieType : "Film",movieName: "Automata", categories: ["Bilim Kurgu"], imagePath: "assets/images/automata.jpg"),
    MovieModel(id :  5,movieType : "Film",movieName: "Ayrıldık", categories: ["Aşk","Romantik Komedi"], imagePath: "assets/images/ayrildik.jpg"),
    MovieModel(id :  6,movieType : "Dizi",movieName: "Acil Teslimat", categories: ["Fantastik"], imagePath: "assets/images/acil_teslimat.jpg"),
    MovieModel(id :  7,movieType : "Dizi",movieName: "Canavarlar Ligi", categories: ["Animasyon"], imagePath: "assets/images/canavarlar_ligi.jpg"),
    MovieModel(id :  8,movieType : "Film",movieName: "Carlos", categories: ["Belgesel","Müzik"], imagePath: "assets/images/carlos.jpg"),
    MovieModel(id :  9,movieType : "Film",movieName: "İç Savaş", categories: ["Dram","Aksiyon"], imagePath: "assets/images/ic_savas.jpg"),
    MovieModel(id :  10,movieType: "Dizi",movieName: "Jackie", categories: ["Yaşam","Dram"], imagePath: "assets/images/jackie.jpg"),
    MovieModel(id :  11,movieType: "Dizi",movieName: "Kuklacı", categories: ["Korku"], imagePath: "assets/images/kuklaci.jpg"),
    MovieModel(id :  12,movieType: "Dizi",movieName: "Kutup Köpekleri", categories: ["Animasyon"], imagePath: "assets/images/kutup_kopekleri.jpg"),
    MovieModel(id :  13,movieType: "Dizi",movieName: "Masal Zamanı 2 : Sihirli Kapı", categories: ["Fantastik"], imagePath: "assets/images/masal_zamani_2_sihirli_kapi.jpg"),
    MovieModel(id :  14,movieType: "Dizi",movieName: "Messi", categories: ["Belgesel"], imagePath: "assets/images/messi.jpg"),
    MovieModel(id :  15,movieType: "Dizi",movieName: "Ölümlü Dünya", categories: ["Aile","Komedi","Türk Filmi","Aksiyon"], imagePath: "assets/images/olumlu_dunya.jpg"),
    MovieModel(id :  16,movieType: "Dizi",movieName: "Sesinde Aşk Var", categories: ["Aşk"], imagePath: "assets/images/sesinde_ask_var.jpg"),
    MovieModel(id :  17,movieType:"Film",movieName: "Simulasyon", categories: ["Gerilim"], imagePath: "assets/images/simulasyon.jpg"),
    MovieModel(id :  18,movieType:"Film",movieName: "Sir Ayet", categories: ["Türk Filmi","Korku"], imagePath: "assets/images/sir_ayet.jpg"),
    MovieModel(id :  19,movieType:"Film",movieName: "Şövalye", categories: ["Müzik","Dram"], imagePath: "assets/images/sovalye.jpg"),
    MovieModel(id :  20,movieType:"Film",movieName: "Vesper", categories: ["Macera"], imagePath: "assets/images/vesper.jpg"),
    MovieModel(id :  21,movieType:"Film",movieName: "Wonder Woman - 1984", categories: ["Macera"], imagePath: "assets/images/wonder_woman_1984.jpg"),
    MovieModel(id :  22,movieType:"Film",movieName: "Zaman Döngüsü", categories: ["Bilim Kurgu","Gerilim"], imagePath: "assets/images/zaman_dongusu.jpg"),
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
  static List<TvModel> filteredListTv(int key){
    List<TvModel> list;
    switch(key){
      case 8:
        list = tvList.where((x) => x.category=="Kanal").toList();
        break;
      case 9:
        list = tvList.where((x) => x.category=="Kanal" && x.name.length<5).toList();
        break;
      case 10:
        list = tvList.where((x) => x.name == "Sinema").toList();
        break;
      case 11:
        list = tvList.where((x) => x.category == "Dizi").toList();
        break;
      case 12:
        list = tvList.where((x) => x.category == "Spor").toList();
        break;
      case 13:
        list =  tvList.where((x) => x.category == "Belgesel").toList();
        break;
      case 14:
        list = tvList.where((x) => x.category == "Eğlence" || x.category == "Yaşam").toList();
        break;
      case 15:
        list = tvList.where((x) => x.category == "Tarih").toList();
        break;
        default:
          list = tvList;
          break;
    }

    return list;
  }

  static List<TvModel> tvList = [
    TvModel(id : 1, category :"Kanal" , name : "Blue TV 1", imagePath:"assets/images/bluetv1.png"),
    TvModel(id : 2, category :"Kanal" , name : "Blue TV 2", imagePath:"assets/images/bluetv2.png"),
    TvModel(id : 3, category :"Kanal" , name:"Epic", imagePath:"assets/images/epic.png"),
    TvModel(id : 4, category :"Kanal" , name : "FX", imagePath:"assets/images/fx.png"),
    TvModel(id : 5, category : "Kanal", name : "Sinema", imagePath:"assets/images/sinema.png"),
    TvModel(id : 6, category : "Kanal", name: "Star", imagePath:"assets/images/star.png"),
    TvModel(id : 7, category :"Spor" , name:"Basket", imagePath:"assets/images/basket.jpg"),
    TvModel(id : 8, category : "Belgesel", name:"TRT Belgesel", imagePath:"assets/images/belgesel.jpg"),
    TvModel(id : 9, category :"Eğlence" , name:"Çocuk", imagePath:"assets/images/cocuk.jpg"),
    TvModel(id : 10, category :"Yaşam", name:"Doğa", imagePath:"assets/images/doga.jpg"),
    TvModel(id : 11, category :"Eğlence" , name:"Eğlence", imagePath:"assets/images/eglence.jpg"),
    TvModel(id : 12, category : "Spor", name:"Futbol", imagePath:"assets/images/futbol.jpg"),
    TvModel(id : 13, category :"Yaşam" , name:"Gerçekler", imagePath:"assets/images/gercekler.jpg"),
    TvModel(id : 14, category : "Yaşam", name:"Gündem", imagePath:"assets/images/gundem.jpg"),
    TvModel(id : 15, category : "Dizi", name:"Hurda", imagePath:"assets/images/hurda.jpg"),
    TvModel(id : 16, category : "Dizi", name:"Korkusuz", imagePath:"assets/images/korkusuz.jpg"),
    TvModel(id : 17, category :"Dizi" , name:"Masumlar Apartmanı", imagePath:"assets/images/masumlar.jpg"),
    TvModel(id : 18, category : "Dizi", name:"Osman", imagePath:"assets/images/osman.jpg"),
    TvModel(id : 19, category : "Dizi", name:"Sahipsizler", imagePath:"assets/images/sahipsizler.jpg"),
    TvModel(id : 20, category : "Spor", name:"Spor", imagePath:"assets/images/spor.jpg"),
    TvModel(id : 21, category : "Tarih", name:"Tarih", imagePath:"assets/images/tarih.jpg"),
    TvModel(id : 22, category :"Spor" , name:"Bilardo", imagePath:"assets/images/top.jpg")
  ];
}