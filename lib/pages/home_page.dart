import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';
import 'package:tv_plus/pages/special_for_me_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [
    SpecialForMePage()
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Image.asset(
            "assets/images/tv_plus_logo.png",
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        leadingWidth: 70,
        actions: [
          _buildAppBarActionsIcon(Icons.search),
          const SizedBox(width: 8,),
          _buildAppBarActionsIcon(Icons.person_3_rounded),
          const SizedBox(width: 4,),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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

  Widget _buildAppBarActionsIcon(IconData icon){
    return Icon(
      icon,
      size: 36,
      color: Colors.white,
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