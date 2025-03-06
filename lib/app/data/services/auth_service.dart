import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential?> signInWithCPF(String cpf, String password) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection("users")
          .where("cpf", isEqualTo: cpf)
          .get();

      if (snapshot.docs.isEmpty) {
        throw Exception("CPF não encontrado.");
      }

      String email = snapshot.docs.first["email"];
      String correctPassword = snapshot.docs.first["password"];

      if (password != correctPassword) {
        throw Exception("Senha incorreta.");
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } catch (e) {
      print("Erro no login: $e");
      return null;
    }
  }
}