import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gs3_desafio_flutter/app/presentation/controllers/login_controller.dart';

class LoginCardBox extends StatefulWidget {
  const LoginCardBox({super.key});

  @override
  LoginCardBoxSheetState createState() => LoginCardBoxSheetState();
}

class LoginCardBoxSheetState extends State<LoginCardBox> {
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  bool isPasswordVisible = false;
  bool isLoading = false;
  String? errorMessage;

  bool get isFormValid => cpfController.text.isNotEmpty && senhaController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  @override
  void dispose() {
    cpfController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cpfController.text = prefs.getString('cpf') ?? '';
    });
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cpf', cpfController.text);
  }

  Future<void> _login(BuildContext context) async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    final loginController = Provider.of<LoginController>(context, listen: false);
    await loginController.login(context);

    if (loginController.errorMessage != null) {
      setState(() {
        errorMessage = loginController.errorMessage;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsets.only(bottom: keyboardHeight),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
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
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 24),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isFormValid ? const Color(0xFF013972) : Colors.grey[400],
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: isFormValid ? () => _login(context) : null,
                      child: const Text("Confirmar", style: TextStyle(color: Colors.white)),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
