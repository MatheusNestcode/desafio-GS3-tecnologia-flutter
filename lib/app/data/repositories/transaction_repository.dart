import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gs3_desafio_flutter/app/domain/entities/transaction.dart';

class TransactionRepository {
  final List<AppTransaction> _transactions = [
    AppTransaction(
      title: "Apple",
      date: "05/09 às 22:35",
      amount: "R\$ 545,99",
      cardNumber: "5621",
      icon: 0xe89b,
    ),
    AppTransaction(
      title: "Uber",
      date: "05/09 às 15:25",
      amount: "R\$ 12,96",
      cardNumber: "4567",
      icon: 0xe531,
    ),
  ];

  List<AppTransaction> getTransactions(String cardNumber) {
    return _transactions.where((t) => t.cardNumber == cardNumber).toList();
  }
}
