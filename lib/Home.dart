import 'dart:io';

import 'package:flutter/material.dart';
import 'package:Shop_KT/CartScreenAPI.dart';
import 'package:Shop_KT/ListProductAPI.dart';
import 'package:Shop_KT/ShowproductAPI.dart';
import 'package:Shop_KT/Profile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _isSearching = false; // Biến kiểm tra trạng thái tìm kiếm
  TextEditingController _searchController =
      TextEditingController(); // Controller cho TextField

  // Define pages for navigation
  final List<Widget> _pages = [
    ListProductAPI(),
    ShowproductAPI(),
    CartScreenAPI(),
    ProfilePage(),
  ];

  // Function to handle tab switching
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to handle search
  void _onSearchChanged(String value) {
    // Logic xử lý tìm kiếm
    print("Tìm kiếm: $value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  hintText: "Tìm kiếm...",
                  hintStyle: TextStyle(color: Color(0xfffd723b)),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Color(0xfffd723b)),
              )
            : Text(
                "KT-Shop!",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w500, // Giảm độ đậm
                      fontSize: 24, // Tăng kích thước để trông mềm mại hơn
                      color: Color(0xff171717), // Thêm màu nổi bật
                      fontFamily: 'Pacifico', // Font chữ mềm mại
                    ),
              ),
        actions: [
          _isSearching
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _isSearching = false;
                      _searchController.clear();
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _isSearching = true;
                    });
                  },
                ),
        ],
        backgroundColor: Color(0xfff2f1f1),
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), // Biểu tượng Profile
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color(0xff555454),
        selectedItemColor: Color(0xfffe5017),
        onTap: _onItemTapped,
      ),
    );
  }
}
