import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gs3_desafio_flutter/app/domain/entities/transaction.dart';
import 'package:gs3_desafio_flutter/app/domain/usecases/get_transactions_firebase_usecase.dart';
import 'package:intl/intl.dart';

class HomeController extends ChangeNotifier {
  final GetTransactionsFirebaseUseCase getTransactionsUseCase;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String selectedCard = "5621";
  String userName = "Cliente";
  String? userId;
  List<AppTransaction> transactions = [];
  List<TransactionGroup> groupedTransactions = [];

  HomeController(this.getTransactionsUseCase) {
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        userId = user.uid;

        DocumentSnapshot userDoc = await _firestore.collection("users").doc(userId).get();
        if (userDoc.exists && userDoc.data() != null) {
          Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
          userName = userData["name"] ?? "Cliente";
        }

        await updateTransactions();
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
      groupTransactionsByDate();
      notifyListeners();
    }
  }

  void groupTransactionsByDate() {
    groupedTransactions.clear();
    Map<String, List<AppTransaction>> groupedMap = {};

    for (var transaction in transactions) {
      String formattedDate = Intl.withLocale('pt_BR', () {
        return DateFormat("dd MMM", "pt_BR").format(transaction.dateTime);
      });

      groupedMap.putIfAbsent(formattedDate, () => []).add(transaction);
    }

    groupedTransactions = groupedMap.entries.map((entry) {
      return TransactionGroup(date: entry.key, transactions: entry.value);
    }).toList();

    groupedTransactions.sort((a, b) => b.transactions.first.dateTime.compareTo(a.transactions.first.dateTime));
  }
}

class TransactionGroup {
  final String date;
  final List<AppTransaction> transactions;

  TransactionGroup({required this.date, required this.transactions});
}
