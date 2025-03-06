import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gs3_desafio_flutter/app/domain/entities/transaction.dart';
import 'package:gs3_desafio_flutter/app/data/repositories/transaction_repository.dart';

class GetTransactionsUseCase {
  final TransactionRepository repository;

  GetTransactionsUseCase(this.repository);

  List<AppTransaction> call(String cardNumber) {
    return repository.getTransactions(cardNumber);
  }
}
