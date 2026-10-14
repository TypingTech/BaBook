import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/library_page.dart';
import 'pages/profile_page.dart';

void main() => runApp(const BaBookApp());

class BaBookApp extends StatelessWidget {
  const BaBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BaBook',
      debugShowCheckedModeBanner: false,
      home: MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  static const List<Widget> _pages = [
    HomePage(),
    LibraryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}