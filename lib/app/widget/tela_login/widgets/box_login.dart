import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCardBox extends StatefulWidget {
  const LoginCardBox({super.key});

  @override
  LoginCardBoxSheetState createState() => LoginCardBoxSheetState();
}

class LoginCardBoxSheetState extends State<LoginCardBox> with WidgetsBindingObserver {
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  bool isPasswordVisible = false;
  double bottomInset = 0;

  bool get isFormValid => cpfController.text.isNotEmpty && senhaController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadSavedData();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    cpfController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cpfController.text = prefs.getString('cpf') ?? '';
      senhaController.text = prefs.getString('senha') ?? '';
    });
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cpf', cpfController.text);
    prefs.setString('senha', senhaController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 375,
        height: 364,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Seja bem-vindo(a)!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("Digite sua senha do aplicativo."),
            const SizedBox(height: 16),
            TextField(
              controller: cpfController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "CPF"),
              onChanged: (value) {
                setState(() {});
                _saveData();
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: senhaController,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                labelText: "Senha",
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {});
                _saveData();
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: isFormValid ? const Color(0xFF013972) : Colors.grey[400],
    minimumSize: const Size(double.infinity, 50),
  ),
  onPressed: isFormValid
      ? () {
          Navigator.pushReplacementNamed(context, '/home');
        }
      : null,
  child: const Text("Confirmar", style: TextStyle(color: Colors.white)),
),

          ],
        ),
      ),
    );
  }
}
