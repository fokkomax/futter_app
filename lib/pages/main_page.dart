import 'package:flutter/material.dart';
import 'package:max/pages/google_map_page.dart';
import 'package:max/pages/page_one.dart';
import 'package:max/pages/page_two.dart';
import 'package:max/pages/dashboard.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String name = 'Fokko Max';
  Map data = {'name': 'max', 'status': 'normal'};
  List num = ['1', '2', '3'];
  int _currentIndex = 0;
  List pages = [Dashboard(), PageOne(), PageTwo()];

  @override
  Widget build(BuildContext context) {
    BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
        fixedColor: Colors.blue,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('HOME')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('PERSON')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('SETTING'))
        ]);

    BottomAppBar bottomAppBar = BottomAppBar(
      color: Color(0xff232f34),
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: (IconButton(
                    icon: Icon(
                      Icons.home,
                      color: _currentIndex == 0 ? Colors.pink : Colors.white,
                      size: _currentIndex == 0 ? 30 : 25,
                    ),
                    onPressed: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    })),
              ),
              IconButton(
                icon: (IconButton(
                    icon: Icon(
                      Icons.mode_edit,
                      color: _currentIndex == 1 ? Colors.pink : Colors.white,
                      size: _currentIndex == 1 ? 30 : 25,
                    ),
                    onPressed: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    })),
              )
            ],
          ),
          IconButton(
            icon: (IconButton(
                icon: Icon(
                  Icons.search,
                  color: _currentIndex == 2 ? Colors.pink : Colors.white,
                  size: _currentIndex == 2 ? 30 : 25,
                ),
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                })),
          )
        ],
      ),
    );

    Drawer drawer = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Hawke Fokko',
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: Text(
              'fokkomax@gmail.com',
              style: TextStyle(fontSize: 15),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.iconscout.com/icon/free/png-256/avatar-369-456321.png'),
            ),
          ),
          ListTile(
            title: Text('Add User'),
            subtitle: Text('add the user'),
            leading: Icon(Icons.person_add),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, '/add-user');
            },
          ),
          ListTile(
            title: Text('Google Map'),
            subtitle: Text('Open google map'),
            leading: Icon(Icons.map),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GoogleMapPage('1234'),
                      fullscreenDialog: true));
            },
          )
        ],
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        title: Text('Snoop Dog'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person_pin),
              onPressed: () {
                print('test');
              }),
          IconButton(
              icon: Icon(Icons.location_on),
              onPressed: () {
                //Navigator.pushNamed(context, '/google-map');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GoogleMapPage('1234'),
                        fullscreenDialog: true));
              })
        ],
      ),
      body: pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('floating button');
        },
        child: Icon(Icons.camera_alt),
        //backgroundColor: Colors.pink,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomAppBar,
      drawer: drawer,
    );
  }
}
