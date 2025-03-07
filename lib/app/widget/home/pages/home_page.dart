import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gs3_desafio_flutter/app/presentation/controllers/home_controller.dart';
import 'package:gs3_desafio_flutter/app/design_system/creditCard/credit_card_container.dart';
import 'package:gs3_desafio_flutter/app/design_system/creditCard/util/colors.dart';
import 'package:gs3_desafio_flutter/app/widget/home/pages/cartao/pages/latest_releases.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Olá, ${controller.userName}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Seção dos Cartões
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.changeCard("5621"),
                    child: const CreditCardWidget(
                      bandeira: "lib/app/design_system/creditCard/assets/visa.png",
                      cardName: "GS3 TEC",
                      cardNumber: "5621",
                      bestPurchaseDay: "15",
                      availableLimit: "R\$ 7.867,80",
                      colorsCards: visaCardColors,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => controller.changeCard("4567"),
                    child: const CreditCardWidget(
                      bandeira: "lib/app/design_system/creditCard/assets/master.png",
                      cardName: "GS3 TEC2",
                      cardNumber: "4567",
                      bestPurchaseDay: "20",
                      availableLimit: "R\$ 17.867,80",
                      colorsCards: masterCardColors,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            /// Meus Favoritos
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Meus favoritos",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {}, // Personalizar favoritos futuramente
                    child: const Text("Personalizar"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _favoriteItem(Icons.credit_card, "Cartão virtual"),
                  _favoriteItem(Icons.add_card, "Cartão adicional"),
                  _favoriteItem(Icons.security, "Seguros"),
                  _favoriteItem(Icons.card_giftcard, "Pacotes"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            /// Últimos lançamentos
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Últimos lançamentos",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LatestReleasesPage()),
                      );
                    },
                    child: const Text("Ver todos"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            controller.transactions.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text("Nenhuma transação encontrada"),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = controller.transactions[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Icon(
                            IconData(transaction.icon,
                                fontFamily: 'MaterialIcons'),
                          ),
                        ),
                        title: Text(transaction.title),
                        subtitle: Text(transaction.date),
                        trailing: Text(transaction.amount),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }

  /// Widget para os Favoritos
  Widget _favoriteItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.blue, size: 30),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
