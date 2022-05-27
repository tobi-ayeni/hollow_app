import 'package:flutter/material.dart';
import 'package:hollow/app/modules/dashboard/screens/home_screen.dart';
import 'package:hollow/app/modules/dashboard/widgets.dart';
import 'package:hollow/utils/asset_paths.dart';
import 'package:hollow/utils/constants.dart';

class TabLayout extends StatefulWidget {
  const TabLayout({Key? key}) : super(key: key);

  @override
  State<TabLayout> createState() => _TabLayoutState();
}

class _TabLayoutState extends State<TabLayout> {
   int _currentIndex = 0;

  Widget getBody() {
    List<Widget> pages = [
      Container(
        alignment: Alignment.center,
        child: const HomeScreen()
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Users",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Messages",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Settings",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHomePurpleColor300,
      body: getBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }
  Widget _buildBottomBar(){
    return CustomAnimatedBottomBar(
      containerHeight: 80,
      backgroundColor: kPrimaryWhite,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: AssetPaths.homeIcon,
          inactiveColor: kIconColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: AssetPaths.walletIcon,
          inactiveColor: kIconColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: AssetPaths.cardIcon,
          inactiveColor: kIconColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: AssetPaths.userIcon,
          inactiveColor: kIconColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
