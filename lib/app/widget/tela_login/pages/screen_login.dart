import 'package:flutter/material.dart';
import 'package:gs3_desafio_flutter/app/design_system/cards/cards.dart';
import 'package:gs3_desafio_flutter/app/widget/tela_login/widgets/box_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fundo com imagem
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/fundo1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Conteúdo principal
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Espaçamento antes do logo
                    SizedBox(height: 35), 
                
                    // Logo centralizada
                    Image.asset(
                      "lib/assets/Logo-sem-fundo.png",
                      width: 200, // Tamanho do logo (ajuste conforme necessário)
                      height: 150, 
                      // Tamanho do logo (ajuste conforme necessário)
                    ),
                
                  
                
                    // Texto "Great Services, Smart Solutions"
                    Text(
                      "Great Services, Smart Solutions",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 150),
                
                    // Botão Entrar
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => LoginCardBox(),
                  );                  
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 1,),
                            ),
                            padding: EdgeInsets.all(20),
                            child: Icon(Icons.add, color: Colors.white, size: 30),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Entrar",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 138),
                
                    // Botões inferiores (agora dentro de um Expanded)
                   SingleChildScrollView(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      scrollDirection: Axis.horizontal, // Permite rolagem se necessário
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12, // Espaçamento entre os botões
                        runSpacing: 10, // Espaço entre linhas caso os botões quebrem
                        children: [
                          CardButton( icon: Icons.credit_card, label: "Solicitar cartão"),
                          CardButton(icon: Icons.search, label:  "Acompanhar solicitação"),
                          CardButton(icon: Icons.help_outline, label:  "Perguntas frequentes"),
                          CardButton(icon: Icons.phone, label:  "Central de atendimento"),
                        ],
                      ),
                    ),
                    SizedBox(height: 50), // Ajuste o espaçamento final
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
