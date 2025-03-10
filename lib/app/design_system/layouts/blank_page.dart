import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  final String title;

  const BlankPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text("Tela em construção")),
    );
  }
}
