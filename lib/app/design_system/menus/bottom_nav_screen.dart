import 'package:flutter/material.dart';
import 'package:gs3_desafio_flutter/app/widget/home/pages/home_page.dart';
import 'package:gs3_desafio_flutter/app/widget/home/pages/cartao/pages/cartao_page.dart';
import 'package:gs3_desafio_flutter/app/widget/home/pages/cartao/pages/fatura_page.dart';
import 'package:gs3_desafio_flutter/app/widget/home/pages/cartao/pages/shop_page.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const FaturaPage(),
    const CartaoPage(),
    const ShopPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Fatura"),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Cartão"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Shop"),
        ],
      ),
    );
  }
}
