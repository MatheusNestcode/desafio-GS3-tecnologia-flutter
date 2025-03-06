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
  List<AppTransaction> transactions = [];

  HomeController(this.getTransactionsUseCase) {
    fetchUserData();
    updateTransactions();
  }

  Future<void> fetchUserData() async {
    try {
      String? userId = _auth.currentUser?.uid;
      if (userId != null) {
        DocumentSnapshot userDoc = await _firestore.collection("users").doc(userId).get();
        if (userDoc.exists && userDoc.data() != null) {
          Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
          userName = userData["name"] ?? "Cliente";
          notifyListeners();
        }
      }
    } catch (e) {
      print("Erro ao buscar nome do usuário: $e");
    }
  }

  void changeCard(String cardNumber) {
    selectedCard = cardNumber;
    updateTransactions();
    notifyListeners();
  }

  void updateTransactions() async {
    transactions = await getTransactionsUseCase(selectedCard);
    notifyListeners();
  }
}
