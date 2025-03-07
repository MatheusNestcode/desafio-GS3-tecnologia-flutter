import 'package:flutter/material.dart';

class FaturaPage extends StatelessWidget {
  const FaturaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black),
                    onPressed: () {},
                  ), 
        title: const Text("Fatura")),
      body: const Center(child: Text("Tela da Fatura em construção")),
    );
  }
}
