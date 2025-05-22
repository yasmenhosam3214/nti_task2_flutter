import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navs/HomeScreen.dart';
import 'navs/accountScreen.dart';
import 'navs/ordersScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme() {
    try {
      setState(() {
        themeMode =
            themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: themeMode,
      home: HomeView(changeTheme: changeTheme, orders: []),
    );
  }
}

class HomeView extends StatefulWidget {
  final VoidCallback changeTheme;
  final List<Map<String, dynamic>> orders;

  const HomeView({super.key, required this.changeTheme, required this.orders});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;

  final List<NavigationDestination> destinations = const [
    NavigationDestination(icon: Icon(Icons.home), label: "Explore"),
    NavigationDestination(icon: Icon(Icons.list), label: "Orders"),
    NavigationDestination(icon: Icon(Icons.person), label: "Account"),
  ];

  void changeIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 50,
            title: Row(
              children: const [
                Icon(Icons.arrow_left),
                SizedBox(width: 8),
                Text(
                  "News",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            actions: [
              IconButton(
                tooltip: "Toggle Theme",
                onPressed: widget.changeTheme,
                icon:
                    isLight
                        ? Icon(Icons.dark_mode)
                        : Icon(Icons.light_mode_outlined, color: Colors.white),
              ),
              IconButton(
                tooltip: "Water Feature",
                onPressed: () {},
                icon: const Icon(Icons.lightbulb_outline_sharp),
              ),
            ],
          ),
          SliverFillRemaining(
            child: IndexedStack(
              index: index,
              children: [
                HomeScreen(),
                OrdersScreen(orders: widget.orders),
                AccountScreen(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        destinations: destinations,
        onDestinationSelected: changeIndex,
      ),
    );
  }
}
