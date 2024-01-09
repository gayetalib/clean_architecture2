import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Color.fromARGB(255, 221, 218, 218)),
      ),
      backgroundColor: const Color.fromARGB(255, 8, 102, 179),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
