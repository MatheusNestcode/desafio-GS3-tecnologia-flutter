import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gs3_desafio_flutter/app/domain/entities/transaction.dart';

class TransactionRepositoryFirebase {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveTransaction(AppTransaction transaction) async {
    await firestore.collection("transactions").doc(transaction.title).set(
          transaction.toMap(),
          SetOptions(merge: true),
        );
  }

  Future<List<AppTransaction>> getTransactions(String userId, String cardNumber) async {
    QuerySnapshot snapshot = await firestore
        .collection("transactions")
        .where("userId", isEqualTo: userId) // Filtra pelo usuário
        .where("cardNumber", isEqualTo: cardNumber) // Filtra pelo número do cartão
        .get();

    return snapshot.docs
        .map((doc) => AppTransaction.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
