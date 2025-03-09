import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gs3_desafio_flutter/app/domain/entities/transaction.dart';
import 'package:gs3_desafio_flutter/app/domain/usecases/get_transactions_firebase_usecase.dart';

class HomeController extends ChangeNotifier {
  final GetTransactionsFirebaseUseCase getTransactionsUseCase;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String selectedCard = "5621";
  String userName = "Cliente";
  String? userId;
  List<AppTransaction> transactions = [];

  HomeController(this.getTransactionsUseCase) {
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        userId = user.uid; // Pegando o UID do usuário autenticado no FirebaseAuth

        DocumentSnapshot userDoc = await _firestore.collection("users").doc(userId).get();
        if (userDoc.exists && userDoc.data() != null) {
          Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
          userName = userData["name"] ?? "Cliente";
        }
        
        await updateTransactions(); // Atualizar transações após obter o userId
      }
    } catch (e) {
      print("Erro ao buscar dados do usuário: $e");
    } finally {
      notifyListeners();
    }
  }

  void changeCard(String cardNumber) {
    selectedCard = cardNumber;
    updateTransactions();
    notifyListeners();
  }

  Future<void> updateTransactions() async {
    if (userId != null) {
      transactions = await getTransactionsUseCase(userId!, selectedCard);
      notifyListeners();
    }
  }
}
