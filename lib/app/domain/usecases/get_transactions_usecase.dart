import 'package:gs3_desafio_flutter/app/data/repositories/transaction_repository_firebase.dart';
import 'package:gs3_desafio_flutter/app/domain/entities/transaction.dart';

class GetTransactionsUseCase {
  final TransactionRepositoryFirebase repository;

  GetTransactionsUseCase(this.repository);

  Future<List<AppTransaction>> call(String cardNumber) async {
    return await repository.getTransactions(cardNumber);
  }
}
