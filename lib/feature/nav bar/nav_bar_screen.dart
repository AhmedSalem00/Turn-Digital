import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:booking_application/feature/event/event_list_screen.dart';
import 'package:booking_application/feature/maps/maps_screen.dart';
import 'package:booking_application/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [

    HomeScreen(),
    EventsListScreen(),
    MapsScreen(),
    TestScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomAppBar _buildBottomNavigationBar() {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: SizedBox(
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem('assets/images/explore_active.png', "Explore", 0),
            _buildNavItem('assets/images/calender_icon.png', "Events", 1),
            _buildNavItem('assets/images/map_icon.png', "Map", 2),
            _buildNavItem('assets/images/Profile.png', "Profile", 3),
          ],
        ),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.orange,
      shape: const CircleBorder(),
      elevation: 8.0,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  Widget _buildNavItem(String imagePath, String label, int index) {
    final bool isActive = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            height: 24.h,
            color: isActive ? ColorsApp.red : Colors.red,
          ),
          Text(
            label,
            style: isActive
                ? TextStyles.font15GrayRegular.copyWith(
              color: ColorsApp.red,
            )
                : TextStyles.font15GrayRegular,
          ),
        ],
      ),
    );
  }
}