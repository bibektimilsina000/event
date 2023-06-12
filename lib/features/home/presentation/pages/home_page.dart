import 'package:event/config/theme.dart';
import 'package:event/features/user/presentation/pages/profile_pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 1);

  int _selectedIndex = 1;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SweetNavBar(
        backgroundColor: ColorConstant.darkBlueWithWhiteShade,
        currentIndex: _selectedIndex,
        items: [
          SweetNavBarItem(
            sweetIcon: const Icon(Icons.home),
            sweetLabel: 'Home',
          ),
          SweetNavBarItem(
            sweetIcon: const Icon(Icons.business),
            sweetLabel: 'Business',
          ),
          SweetNavBarItem(
            sweetIcon: const Icon(Icons.person),
            sweetLabel: 'School',
          ),
        ],
        onTap: (index) => _onPageChanged(index),
      ),
      body: PageView(
        onPageChanged: (index) => _onPageChanged(index),
        controller: _pageController,
        children: const [
          Center(child: Text('Search Page')),
          Center(child: Text('Home Page')),
          ProfilePage()
        ],
      ),
    );
  }
}
