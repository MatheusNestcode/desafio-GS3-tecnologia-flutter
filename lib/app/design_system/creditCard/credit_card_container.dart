import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardName;
  final String cardNumber;
  final String bestPurchaseDay;
  final String availableLimit;
  final List<Color> gradientColors;

  const CreditCardWidget({
    super.key,
    required this.cardName,
    required this.cardNumber,
    required this.bestPurchaseDay,
    required this.availableLimit,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 301,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cardName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              letterSpacing: 2,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Melhor dia: $bestPurchaseDay',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                'Limite: $availableLimit',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
