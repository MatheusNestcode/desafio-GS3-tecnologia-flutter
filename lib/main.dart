import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:gs3_desafio_flutter/app/routes/routes.dart';
import 'package:gs3_desafio_flutter/app/widget/tela_login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await updateFirestoreData();
  
  runApp(const Gs3Flutter());
}

Future<void> updateFirestoreData() async {
  await FirebaseFirestore.instance.collection("col").doc("doc").set({
    "texto": "matheus",
  }, SetOptions(merge: true));

  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("col").get();
  for (var d in snapshot.docs) {
    print(d.data());
  }
}

class Gs3Flutter extends StatelessWidget {
  const Gs3Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Rotas.login,
      routes: Rotas.definirRotas(),
    );
  }
}
