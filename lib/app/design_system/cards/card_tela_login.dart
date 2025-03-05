import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final IconData icon;
  final String label;

  // Construtor que recebe o ícone e o texto
  const CardButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 87,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1), // Cor de fundo levemente transparente
        borderRadius: BorderRadius.circular(12), // Bordas arredondadas
      ),
      padding: EdgeInsets.all(10), // Padding interno
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Alinha os itens centralizados
        children: [
          Icon(icon, color: Colors.white, size: 28),
          SizedBox(height: 4),
          // Ajuste o comportamento do texto para não ultrapassar
          Flexible(
            child: Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center, // Alinha o texto centralizado
              overflow: TextOverflow.ellipsis, // Caso o texto seja maior, será cortado
              maxLines: 2, // Limita a uma linha
            ),
          ),
        ],
      ),
    );
  }
}
