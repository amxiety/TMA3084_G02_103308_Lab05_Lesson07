import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';
import 'screen4.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TabProvider(),
      child: const BottomNavLab(),
    ),
  );
}

// Manages the selected BottomNavigationBar tab.
class TabProvider extends ChangeNotifier {
  int currentIndex = 0;

  void changeTab(int index) {
    currentIndex = index;
    notifyListeners();
  }
}

class BottomNavLab extends StatelessWidget {
  const BottomNavLab({super.key});

  static const List<Widget> screens = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lab 05: Exercise A'),
          backgroundColor: Colors.blue,
        ),

        // Only the body listens to tab state.
        body: Consumer<TabProvider>(
          builder: (context, tabProvider, child) {
            return screens[tabProvider.currentIndex];
          },
        ),

        bottomNavigationBar: Consumer<TabProvider>(
          builder: (context, tabProvider, child) {
            return BottomNavigationBar(
              currentIndex: tabProvider.currentIndex,
              onTap: (index) {
                tabProvider.changeTab(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.alarm),
                  label: 'Alarm',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'School',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}