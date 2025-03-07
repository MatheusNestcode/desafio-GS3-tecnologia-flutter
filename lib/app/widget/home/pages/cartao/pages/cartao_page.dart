import 'package:flutter/material.dart';

class CartaoPage extends StatelessWidget {
  const CartaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black),
                    onPressed: () {},
                  ),
        title: const Text("Cartão")),
      body: const Center(
        child: Text("Tela do Cartão em construção"),
      ),
    );
  }
}
