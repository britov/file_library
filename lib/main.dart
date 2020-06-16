import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_library/model/custom_set.dart';
import 'model/library.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LibraryModel(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => CustomSetModel(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: AppBarTheme(elevation: 0),
            tabBarTheme: TabBarTheme(labelColor: Colors.black)),
        initialRoute: Routes.home,
        routes: {Routes.home: (_) => MyHomePage(title: 'Flutter Demo Home Page')},
      ),
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
      appBar: AppBar(
        title: Text("App"),
      ),
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
    return BottomNavigationBarItem(icon: Icon(destination.icon), title: Text(destination.title));
  }
}

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Selector<LibraryModel, List<LibraryItemType>>(
            selector: (_, value) => value.types,
            builder: (_, types, child) => DefaultTabController(
                  length: types.length,
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        tabs: <Widget>[for (final type in types) _buildTab(type)],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[for (final type in types) _buildTabView(type)],
                        ),
                      )
                    ],
                  ),
                )),
        Positioned(
          right: 20,
          bottom: 20,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              File file = await FilePicker.getFile(type: FileType.any);
              if (file != null) {
                var category = await Navigator.push(context, MaterialPageRoute(builder: (_) => SelectCategoryPage()));
                if (category != null) {
                  context.read<LibraryModel>().addNewFile(file, category);
                }
              }
            },
          ),
        )
      ],
    );
  }

  Widget _buildTab(LibraryItemType type) {
    String text;
    IconData icon;
    switch (type) {
      case LibraryItemType.audio:
        text = 'AUDIO';
        icon = Icons.audiotrack;
        break;
      case LibraryItemType.gif:
        text = 'GIF';
        icon = Icons.gif;
        break;
      case LibraryItemType.picture:
        text = 'PICTURE';
        icon = Icons.image;
        break;
    }
    return Tab(
      text: text,
      icon: Icon(icon),
    );
  }

  Widget _buildTabView(LibraryItemType type) {
    return Selector<LibraryModel, List<LibraryItemFile>>(
      selector: (_, value) => value.files,
      shouldRebuild: (a, b) => a != b,
      builder: (_, files, __) => ListView(
        children: <Widget>[
          for (final item in LibraryModel.filesTree(files, type).entries) ...[
            ListTile(
              title: Text(
                item.key.title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            for (final file in item.value)
              ListTile(
                title: Text(file.title ?? 'Unnamed'),
              )
          ]
        ],
      ),
    );
  }
}

class SelectCategoryPage extends StatefulWidget {
  @override
  _SelectCategoryPageState createState() => _SelectCategoryPageState();
}

class _SelectCategoryPageState extends State<SelectCategoryPage> {

  @override
  Widget build(BuildContext context) {
    var categories = context.watch<LibraryModel>().categories;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Select category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: categories.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('You don\'t have any categories'),
                          FlatButton(
                              textTheme: ButtonTextTheme.accent,
                              onPressed: () async {
                                await _createCategory(context);
                              },
                              child: Text('CREATE FIRST')),
                        ],
                      ),
                    )
                  : ListView(children: <Widget>[
                      for (final category in categories)
                        ListTile(
                          onTap: () async {
                            Navigator.pop(context, category);
                          },
                          title: Text(category.title),
                        ),
                    ]),
            ),
            SizedBox(
              height: 40,
            ),
            if (categories.isNotEmpty)
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                    FlatButton(
                        onPressed: () async {
                          await _createCategory(context);
                        },
                        child: Text('NEW CATEGORY')
                    ),
                ]
              )
          ],
        ),
      ),
    );
  }

  Future _createCategory(BuildContext context) async {
    var category =
        await Navigator.of(context).push(MaterialPageRoute(builder: (_) => EnterTextPage(label: 'Category title')));
    if (category is String && category.isNotEmpty) {
      context.read<LibraryModel>().addNewCategory(category);
    }
  }
}

class EnterTextPage extends StatefulWidget {
  final String label;

  const EnterTextPage({Key key, @required this.label}) : super(key: key);

  @override
  _EnterTextPageState createState() => _EnterTextPageState();
}

class _EnterTextPageState extends State<EnterTextPage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: textController,
                decoration: InputDecoration(labelText: widget.label),
              ),
              SizedBox(
                height: 40,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(child: Text("NEXT"), onPressed: () => Navigator.pop(context, textController.text))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SetsPage extends StatefulWidget {
  @override
  _SetsPageState createState() => _SetsPageState();
}

class _SetsPageState extends State<SetsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('SETS'),
    );
  }
}
