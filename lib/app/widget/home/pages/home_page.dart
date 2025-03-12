import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
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
                      const SizedBox(width: 12),
                       GestureDetector(
                        onTap: () => controller.changeCard("1234"),
                        child: const CreditCardWidget(
                          bandeira: "lib/app/design_system/creditCard/assets/master.png",
                          cardName: "GS3 Black",
                          cardNumber: "1234",
                          bestPurchaseDay: "25",
                          availableLimit: "R\$ 17.000.000,00",
                          colorsCards: blackCardColors,
                        ),
                      ),
                       const SizedBox(width: 12),
                       GestureDetector(
                        onTap: () => controller.changeCard("4321"),
                        child: const CreditCardWidget(
                          bandeira: "lib/app/design_system/creditCard/assets/visa.png",
                          cardName: "GS3 Black unique",
                          cardNumber: "4321",
                          bestPurchaseDay: "25",
                          availableLimit: "R\$ 17.000.000,00",
                          colorsCards: blackCardColors,
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
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.groupedTransactions.length,
                          itemBuilder: (context, index) {
                            final transactionGroup = controller.groupedTransactions[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    transactionGroup.date,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2890CF),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: List.generate(
                                    transactionGroup.transactions.length,
                                    (i) {
                                      final transaction = transactionGroup.transactions[i];
                                      return Column(
                                        children: [
                                          ListTile(
                                            leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color: const Color.fromRGBO(229, 229, 229, 0.2),
                                              ),
                                              child: Icon(
                                                IconData(transaction.icon, fontFamily: 'MaterialIcons'),
                                                color: const Color(0xFF346CBD),
                                              ),
                                            ),
                                            title: Text(
                                              transaction.title,
                                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              DateFormat("dd MMM 'às' HH:mm", "pt_BR").format(transaction.dateTime),
                                              style: const TextStyle(fontSize: 12, color: Color(0xFF828285)),
                                            ),
                                            trailing: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  transaction.amount,
                                                  style: const TextStyle(fontSize: 14, color: Colors.black),
                                                ),
                                                if (transaction.installments.isNotEmpty)
                                                  Text(
                                                    transaction.installments,
                                                    style: const TextStyle(fontSize: 12, color: Color(0xFF828285)),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (i < transactionGroup.transactions.length - 1)
                                            const Divider(color: Colors.white54, thickness: 1),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
