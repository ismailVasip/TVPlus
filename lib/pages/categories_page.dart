import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';
import 'package:tv_plus/widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _categories = [
      'Shots',
      'Belgesel',
      'Dram',
      'Bilim Kurgu',
      'Animasyon',
      'Türk Filmi',
      'Aksiyon',
      'Aile',
      'Çocuk',
      'Korku',
      'Gerilim',
      'Fantastik',
      'Komedi',
      'Aşk',
      'Müzik',
      'Romantik Komedi',
      'Macera',
      'Yaşam'
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Kategoriler",
          style: Constants.getAppBarCategoryStyle(),
        ),
        titleSpacing: 0,
        leading: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.amber,
              size: 27,
            )
        ),
      ),
      body: ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (context,index) {
          return CategoryItem(category: _categories[index]);
        }
      ),
    );
  }
}
