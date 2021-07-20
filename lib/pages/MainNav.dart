import 'package:flutter/material.dart';
import 'package:one/pages/Storage.dart';
import 'package:one/pages/home.dart';
import 'package:one/pages/profile.dart';

class MainNav extends StatefulWidget {
  const MainNav({Key? key}) : super(key: key);

  @override
  _MainNavState createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {

  int _selectedIndex = 0;
  Set<Widget> _widgetOptions = <Widget>{
    home(),
    Profile(),
  };
  void _onItemTap (int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Сам себе технадзор',style: TextStyle(fontSize: 30),),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
        bottomNavigationBar:
        BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}