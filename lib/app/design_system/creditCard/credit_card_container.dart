import 'package:flutter/material.dart';
import 'package:gs3_desafio_flutter/app/design_system/creditCard/util/colors.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardName;
  final String cardNumber;
  final String bestPurchaseDay;
  final String availableLimit;
  final String bandeira;
  final List<Color> colorsCards;

  const CreditCardWidget({
    super.key,
    required this.cardName,
    required this.cardNumber,
    required this.bestPurchaseDay,
    required this.availableLimit,
    required this.bandeira,
    required this.colorsCards,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 301,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: colorsCards,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  bandeira,
                  width: 88,
                  height: 56,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '**** ${cardNumber.substring(cardNumber.length - 4)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      cardName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(color: Colors.white.withOpacity(0.5), thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Limite disponível',
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                    Text(
                      availableLimit,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Melhor dia de compra',
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                    Text(
                      bestPurchaseDay,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
