import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Full Alive',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const _pages = [
    Center(child: Text('Hello World!')),
    SizedBox.expand(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final highlightColor = colors.primaryContainer;
    final highlightTextColor = colors.onPrimaryContainer;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _svgIcon('assets/favicon.svg', highlightTextColor),
            const SizedBox(width: 10),
            const Text('Full Alive'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(children: const [DrawerHeader(child: null)]),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: highlightColor,
        selectedItemColor: highlightTextColor,
        unselectedItemColor: highlightTextColor.withAlpha(180),
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: _svgIcon(
              'assets/icons/home.svg',
              highlightTextColor.withAlpha(180),
              width: 32,
              height: 32,
            ),
            activeIcon: _svgIcon(
              'assets/icons/home.svg',
              highlightTextColor,
              width: 32,
              height: 32,
            ),
            label: 'Início',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.construction_outlined),
            activeIcon: Icon(Icons.construction),
            label: 'WIP',
          ),
        ],
      ),
    );
  }

  Widget _svgIcon(
    String asset,
    Color color, {
    double width = 32,
    double height = 32,
  }) => SvgPicture.asset(
    asset,
    width: width,
    height: height,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
  );
}
