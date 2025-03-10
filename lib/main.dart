import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart'; 

import 'package:gs3_desafio_flutter/app/data/repositories/transaction_repository_firebase.dart';
import 'package:gs3_desafio_flutter/app/domain/usecases/get_transactions_firebase_usecase.dart';
import 'package:gs3_desafio_flutter/app/presentation/controllers/home_controller.dart';
import 'package:gs3_desafio_flutter/app/presentation/controllers/login_controller.dart';
import 'package:gs3_desafio_flutter/app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Inicializa o Locale para PT-BR antes de rodar o app
  await initializeDateFormatting('pt_BR', null);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeController(
            GetTransactionsFirebaseUseCase(TransactionRepositoryFirebase()),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Rotas.login,
      routes: Rotas.definirRotas(),
    );
  }
}
