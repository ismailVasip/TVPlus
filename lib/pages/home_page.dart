import 'package:flutter/material.dart';
import 'package:tv_plus/pages/special_for_me_page.dart';
import 'package:tv_plus/pages/tv_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [
    const SpecialForMePage(),
    const TvPage(),
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        backgroundColor: Colors.transparent,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        items: [
          _buildBottomNavBarItem(Icons.home_outlined,"BANA ÖZEL"),
          _buildBottomNavBarItem(Icons.tv_rounded,"TV"),
          _buildBottomNavBarItem(Icons.play_arrow_outlined,"SHOTS"),
          _buildBottomNavBarItem(Icons.list_rounded,"LİSTELERİM"),
          _buildBottomNavBarItem(Icons.download,"İNDİRDİKLERİM"),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavBarItem(IconData icon,String label){
    return
         BottomNavigationBarItem(
           icon: Icon(icon),
           label: label,
           tooltip: label
         );
  }
}