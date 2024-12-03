import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';

class ClassicAppbar extends StatelessWidget implements PreferredSizeWidget{
  final title;
  const ClassicAppbar({
    super.key,
    required this.title
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.zero,
      child: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Constants.getScaffoldBackgroundColor,
        centerTitle: true,
        leadingWidth: 80,
        leading: Image.asset(
          "assets/images/tv_plus_logo.png",
          height: 56,
          width: 56,
          fit: BoxFit.cover,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          _buildAppBarActionsIcon(Icons.search),
          const SizedBox(width: 8,),
          _buildAppBarActionsIcon(Icons.person_3_rounded),
          const SizedBox(width: 8,),
        ],
      ),
    );

  }
  Widget _buildAppBarActionsIcon(IconData icon) {
    return Icon(
      icon,
      size: 36,
      color: Colors.white,
    );
  }

}
