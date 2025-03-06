import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gs3_desafio_flutter/app/presentation/controllers/home_controller.dart';

class LatestReleasesPage extends StatelessWidget {
  const LatestReleasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Últimos Lançamentos")),
      body: controller.transactions.isEmpty
          ? const Center(child: Text("Nenhuma transação encontrada"))
          : ListView.builder(
              itemCount: controller.transactions.length,
              itemBuilder: (context, index) {
                final transaction = controller.transactions[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      IconData(transaction.icon, fontFamily: 'MaterialIcons'),
                    ),
                  ),
                  title: Text(transaction.title),
                  subtitle: Text(transaction.date),
                  trailing: Text(transaction.amount),
                );
              },
            ),
    );
  }
}
