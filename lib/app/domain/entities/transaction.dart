class AppTransaction {
  final String title;
  final String date;
  final String amount;
  final String cardNumber;
  final int icon;

  AppTransaction({
    required this.title,
    required this.date,
    required this.amount,
    required this.cardNumber,
    required this.icon,
  });

  factory AppTransaction.fromMap(Map<String, dynamic> map) {
    return AppTransaction(
      title: map['title'] ?? '',
      date: map['date'] ?? '',
      amount: map['amount'] ?? '',
      cardNumber: map['cardNumber'] ?? '',
      icon: map['icon'] ?? 0xe89b,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'amount': amount,
      'cardNumber': cardNumber,
      'icon': icon,
    };
  }
}
