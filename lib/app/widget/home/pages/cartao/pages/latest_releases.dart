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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: controller.transactions.isEmpty
            ? const Center(child: Text("Nenhuma transação encontrada"))
            : ListView.separated(
                itemCount: controller.transactions.length,
                separatorBuilder: (context, index) => const Divider(thickness: 1),
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
      ),
    );
  }
}
