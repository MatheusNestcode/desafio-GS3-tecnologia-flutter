import 'package:gs3_desafio_flutter/app/data/repositories/transaction_repository_firebase.dart';
import 'package:gs3_desafio_flutter/app/domain/entities/transaction.dart';

class GetTransactionsFirebaseUseCase {
  final TransactionRepositoryFirebase repository;

  GetTransactionsFirebaseUseCase(this.repository);

  Future<List<AppTransaction>> call(String userId, String cardNumber) {
    return repository.getTransactions(userId, cardNumber);
  }
}
