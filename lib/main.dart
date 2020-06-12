import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class Routes {
  static const String home = '/';
}

class Destination {
  static const home = Destination(0, 'Home', Icons.home);
  static const sets = Destination(1, 'Sets', Icons.favorite);
  static const library = Destination(2, 'Library', Icons.video_library);

  final int index;
  final String title;
  final IconData icon;

  const Destination(this.index, this.title, this.icon);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.home,
      routes: {
        Routes.home: (_) => MyHomePage(title: 'Flutter Demo Home Page')
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedTab = Destination.home.index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedSwitcher(
        duration: Duration(seconds: 2),
        child: Builder(
          builder: (_) {
            if (_selectedTab == Destination.home.index) {
              return Center(
                child: Text('HOME'),
              );
            } else if (_selectedTab == Destination.library.index) {
              return LibraryPage();
            } else if (_selectedTab == Destination.sets.index) {
              return SetsPage();
            }
            return Center(
              child: Text('Oops'),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          _buildBottomNavigationBarItem(Destination.home),
          _buildBottomNavigationBarItem(Destination.sets),
          _buildBottomNavigationBarItem(Destination.library),
        ],
        onTap: (index) => setState(() => _selectedTab = index),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(Destination destination) {
    return BottomNavigationBarItem(
      icon: Icon(destination.icon),
      title: Text(destination.title)
    );
  }
}


class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('LIBRARY'),);
  }
}

class SetsPage extends StatefulWidget {
  @override
  _SetsPageState createState() => _SetsPageState();
}

class _SetsPageState extends State<SetsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('SETS'),);
  }
}

