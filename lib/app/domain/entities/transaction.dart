import 'package:intl/intl.dart';

class AppTransaction {
  final String title;
  final DateTime dateTime;
  final String amount;
  final String cardNumber;
  final int icon;
  final String installments;

  AppTransaction({
    required this.title,
    required this.dateTime,
    required this.amount,
    required this.cardNumber,
    required this.icon,
    required String installments,
  }) : installments = installments.isNotEmpty ? "em $installments" : '';

  factory AppTransaction.fromMap(Map<String, dynamic> map) {
    return AppTransaction(
      title: map['title'] ?? '',
      dateTime: _parseFirebaseDate(map['date'] ?? ''),
      amount: map['amount'] ?? '',
      cardNumber: map['cardNumber'] ?? '',
      icon: map['icon'] ?? 0xe89b,
      installments: map['installments'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': _formatDate(dateTime),
      'amount': amount,
      'cardNumber': cardNumber,
      'icon': icon,
      'installments': installments.replaceAll("em ", ""),
    };
  }

  static String _formatDate(DateTime date) {
    return Intl.withLocale('pt_BR', () {
      return DateFormat("dd MMM 'às' HH:mm", "pt_BR").format(date);
    });
  }

  static DateTime _parseFirebaseDate(String dateString) {
    try {
      List<String> parts = dateString.split(" às ");
      if (parts.length == 2) {
        List<String> dateParts = parts[0].split("/");
        int day = int.parse(dateParts[0]);
        int month = int.parse(dateParts[1]);
        return DateTime(DateTime.now().year, month, day);
      }
    } catch (e) {
      print("Erro ao converter data: $dateString");
    }
    return DateTime.now();
  }
}
