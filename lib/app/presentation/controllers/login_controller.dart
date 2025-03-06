import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;

  Future<void> login(BuildContext context) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      String cpf = cpfController.text.trim();
      String senha = senhaController.text.trim();

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: "$cpf@email.com",
        password: senha,
      );

      if (userCredential.user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      errorMessage = "Erro ao fazer login: $e";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage!)),
      );
    }

    isLoading = false;
    notifyListeners();
  }
}
