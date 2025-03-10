import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:gs3_desafio_flutter/app/presentation/controllers/home_controller.dart';

class LatestReleasesPage extends StatelessWidget {
  const LatestReleasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Últimos Lançamentos")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: controller.transactions.isEmpty
            ? const Center(child: Text("Nenhuma transação encontrada"))
            : ListView.builder(
                itemCount: controller.groupedTransactions.length,
                itemBuilder: (context, index) {
                  final transactionGroup = controller.groupedTransactions[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:5),
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
                                Container(
                                  
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
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
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              transaction.title,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              DateFormat("dd/MM 'às' HH:mm").format(transaction.dateTime),
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF828285),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            transaction.amount,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          if (transaction.amount.contains("x"))
                                            Text(
                                              transaction.amount.split(" ")[1],
                                              style: const TextStyle(
                                                fontSize: 8,
                                                color: Color(0xFF828285),
                                              ),
                                            ),
                                        ],
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
    );
  }
}
