import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;
  String? errorMessage;

  Future<bool> login(String cpf, String senha) async {
    if (cpf.isEmpty || senha.isEmpty) {
      errorMessage = "CPF e senha são obrigatórios.";
      notifyListeners();
      return false;
    }

    try {
      QuerySnapshot<Map<String, dynamic>> result = await _firestore
          .collection("users")
          .where("cpf", isEqualTo: cpf)
          .limit(1)
          .get();

      if (result.docs.isEmpty) {
        errorMessage = "CPF não encontrado.";
        notifyListeners();
        return false;
      }

      var userData = result.docs.first.data();

      if (userData["password"] != senha) {
        errorMessage = "Senha incorreta.";
        notifyListeners();
        return false;
      }

      return true;
    } catch (e) {
      errorMessage = "Erro ao fazer login: $e";
      notifyListeners();
      return false;
    }
  }
}
