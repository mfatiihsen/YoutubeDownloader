import 'package:flutter/material.dart';
import 'package:video_downloader/screens/browser_screen.dart';
import 'package:video_downloader/screens/paste_link_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_filled), label: "Ana Sayfa"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.web), label: "Youtube Tarayıcı"),
  ];

  List<Widget> screens = [
    const PastLinkScreen(),
    const BrowserScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "YouTube Video İndirici",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        items: items,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
