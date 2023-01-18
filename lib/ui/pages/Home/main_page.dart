import 'package:attendancce/shared/theme_style.dart';
import 'package:attendancce/ui/pages/Home/home_menu.dart';
import 'package:attendancce/ui/pages/profile_menu.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    const Home(),
    const Profile(),
  ];

  int _selectedIndex = 0;
  void _ontap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///BODY
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      /// BOTTOM NAVIGATOR
      bottomNavigationBar: BottomAppBar(
        color: bgWhite,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 8,
        child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _ontap,
            elevation: 0,
            backgroundColor: bgWhite,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_home.png',
                  width: 24,
                  height: 24,
                ),
                activeIcon: Image.asset(
                  'assets/ic_home_new.png',
                  width: 24,
                  height: 24,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_profile.png',
                  width: 24,
                  height: 24,
                ),
                activeIcon: Image.asset(
                  'assets/ic_profile_new.png',
                  width: 24,
                  height: 24,
                ),
                label: "Profile",
              ),
            ]),
      ),

      /// BOTTOM FLOATING
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/LiveAttendance');
        },
        backgroundColor: primary,
        child: Image.asset(
          'assets/ic_face.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
