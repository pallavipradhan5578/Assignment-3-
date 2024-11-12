import 'package:assignment2/ui/Sos_page.dart';
import 'package:assignment2/ui/people_page.dart';
import 'package:assignment2/utils/app_color.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  // Function to handle item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to get different pages
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return PeoplePage(); // Example for SOS page
    // Add more cases for other pages if needed
      case 2:
        return Container(
          child: Center(
            child: Text("SOS"),
          ),
        );
      case 3:
        return Container(
          child: Center(
            child: Text("Premium"),
          ),
        );
      default:
        return Container(
          child: Center(
            child: Text("default"),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        padding: EdgeInsets.zero,
        height: 64,
        child: Padding(
          padding: const EdgeInsets.only(left: 30,top: 5,right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Home button
              _buildBottomNavItem(
                index: 0,
                iconPath: 'assets/icons/home_page_icon.png',
                label: 'Home',
              ),
              _buildBottomNavItem(
                index: 3,
                iconPath: 'assets/icons/people.png',
                label: 'People',
              ),
              // SOS button
              _buildBottomNavItem(
                index: 1,
                iconPath: 'assets/icons/tool.png',
                label: 'SOS',
              ),
              // Profile button
              _buildBottomNavItem(
                index: 2,
                iconPath: 'assets/icons/quality.png',
                label: 'Premium',
              ),

            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build a navigation item with a blue line for the selected item
  Widget _buildBottomNavItem({required int index, required String iconPath, required String label}) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            height: 30,
            width: 30,
            color: isSelected ? AppColor.primaryBlue : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(color: isSelected ?AppColor.primaryBlue: Colors.grey),
          ),
          // Blue line under the selected item
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 5,
              width: 50,
              color: AppColor.primaryBlue,
            ),
        ],
      ),
    );
  }
}
