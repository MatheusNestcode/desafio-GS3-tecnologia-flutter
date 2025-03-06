import 'package:flutter/material.dart';
import 'package:gs3_desafio_flutter/app/design_system/creditCard/credit_card_container.dart';
import 'package:gs3_desafio_flutter/app/design_system/creditCard/util/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 0),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CreditCardWidget(
                bandeira: "lib/app/design_system/creditCard/assets/visa.png",
                cardName: "GS3 TEC",
                cardNumber: "5621",
                bestPurchaseDay: "15",
                availableLimit: "R\$ 7.867,80",
                colorsCards: visaCardColors,
              ),
              SizedBox(width: 12),
              CreditCardWidget(
                bandeira: "lib/app/design_system/creditCard/assets/master.png",
                cardName: "GS3 TEC2",
                cardNumber: "4567",
                bestPurchaseDay: "20",
                availableLimit: "R\$ 17.867,80",
                colorsCards: masterCardColors,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
