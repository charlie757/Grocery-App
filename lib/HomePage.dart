import 'package:flutter/material.dart';
import 'package:online_shopping/Pages/AllCategroies.dart';
import 'package:online_shopping/Pages/HomeTabBar.dart';
import 'package:online_shopping/Widget/Drawer.dart';
import 'package:online_shopping/utils/Contrains.dart';

import 'Pages/Searchbar/SearchBarpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.appbar}) : super(key: key);
  final String appbar;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final tabs = [
    HomeTabBar(),
    AllCategroiesPage(),
    Center(child: Text("Profile")),
    Center(child: Text("Orders")),
    Center(child: Text("Help"))
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var appbar;
    return Scaffold(
      body: tabs[_currentIndex],
      appBar: AppBar(
        title: Text("Online-Mart"),
        centerTitle: true,

        // To get the searchbar on AppBar
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Padding(
                padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: Hero(
                    transitionOnUserGestures: true,
                    tag: 'tag',
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchBarPage()));
                        },
                        child: Container(
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: width * 0.8,
                                // color: Colors.red,
                                child: TextField(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchBarPage()));
                                  },
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "Search Products & brands",
                                      isDense: true,
                                      suffixIcon: Container(
                                          width: 60,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                  child: Icon(
                                                Icons.menu,
                                                color: black1,
                                                size: 20,
                                              )),
                                              VerticalDivider(
                                                // color: black,
                                                // width: 5,
                                                thickness: 5,
                                                indent: 12,
                                                endIndent: 10,
                                              ),
                                              Expanded(
                                                  child: Icon(
                                                Icons.qr_code_scanner,
                                                color: black1,
                                                size: 20,
                                              )),
                                              SizedBox(
                                                width: 5,
                                              )
                                            ],
                                          )),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                ),
                              ),
                              Icon(
                                Icons.mic,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ))))),
        actions: [
          IconButton(
              splashRadius: 20,
              icon: Icon(Icons.notifications),
              onPressed: () {}),
          IconButton(
              splashRadius: 20,
              icon: Icon(Icons.shopping_cart),
              onPressed: () {}),
        ],
      ),
      drawer: DrawerPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.black26,
        selectedFontSize: 10,
        elevation: 20,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), title: Text("All Categroies")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Profile")),
          BottomNavigationBarItem(
              icon: Icon(Icons.bento), title: Text("Orders")),
          BottomNavigationBarItem(
              icon: Icon(Icons.help_outline_sharp), title: Text("Help"))
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
