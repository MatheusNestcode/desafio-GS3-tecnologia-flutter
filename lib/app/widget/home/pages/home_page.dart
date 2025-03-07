import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gs3_desafio_flutter/app/presentation/controllers/home_controller.dart';
import 'package:gs3_desafio_flutter/app/design_system/creditCard/credit_card_container.dart';
import 'package:gs3_desafio_flutter/app/design_system/creditCard/util/colors.dart';
import 'package:gs3_desafio_flutter/app/widget/home/pages/cartao/pages/latest_releases.dart';
import 'package:gs3_desafio_flutter/app/design_system/cards/cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3C6AB2), Color(0xFFFFFFFF)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {},
                  ),
                  title: Text("Olá, ${controller.userName}", style: const TextStyle(color: Colors.white)),
                  actions: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chat_bubble, size: 20, color: Colors.white),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications, size: 25, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                const Divider(color: Colors.white54, thickness: 1),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => controller.changeCard("5621"),
                        child: const CreditCardWidget(
                          bandeira: "lib/app/design_system/creditCard/assets/visa.png",
                          cardName: "GS3 TEC",
                          cardNumber: "5621",
                          bestPurchaseDay: "20",
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
                const Divider(color: Colors.white54, thickness: 1),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Meus favoritos",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        label: const Text("Personalizar", style: TextStyle(fontSize: 12, color: Colors.black)),
                        icon: const Icon(Icons.apps, size: 20, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const FavoriteItem(icon: Icons.credit_card, title: "Cartão virtual"),
                      const SizedBox(width: 20),
                      const FavoriteItem(icon: Icons.add_card, title: "Cartão adicional"),
                      const SizedBox(width: 20),
                      const FavoriteItem(icon: Icons.security, title: "Seguros"),
                      const SizedBox(width: 20),
                      const FavoriteItem(icon: Icons.card_giftcard, title: "Pacotes"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Últimos lançamentos",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LatestReleasesPage()),
                          );
                        },
                        label: const Text("Ver todos", style: TextStyle(fontSize: 12, color: Colors.black)),
                        icon: const Icon(Icons.chevron_right, size: 20, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
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
                              backgroundColor: Colors.grey.shade200,
                              child: Icon(
                                IconData(transaction.icon, fontFamily: 'MaterialIcons'),
                                color: const Color(0xFF346CBD),
                              ),
                            ),
                            title: Text(transaction.title),
                            subtitle: Text(transaction.date, style: const TextStyle(color: Color(0xFF2890CF))),
                            trailing: Text(transaction.amount),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}