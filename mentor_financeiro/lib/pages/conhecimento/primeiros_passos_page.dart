import 'package:flutter/material.dart';

class PrimeirosPassosPage extends StatelessWidget {
  const PrimeirosPassosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Primeiros Passos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPasso(
            1,
            'Escolha uma Corretora',
            'Busque instituições financeiras seguras e reguladas pelo Banco Central. Compare taxas e reputação.',
            Icons.business,
          ),
          const SizedBox(height: 12),
          _buildPasso(
            2,
            'Abra sua Conta',
            'Processo digital gratuito. Você precisará de documentos pessoais (CPF, RG) e comprovante de residência.',
            Icons.person_add,
          ),
          const SizedBox(height: 12),
          _buildPasso(
            3,
            'Transfira Recursos',
            'Envie dinheiro via PIX ou TED da sua conta bancária para a corretora. O dinheiro fica disponível para investimento.',
            Icons.swap_horiz,
          ),
          const SizedBox(height: 12),
          _buildPasso(
            4,
            'Descubra seu Perfil',
            'Responda ao questionário de suitability. Entenda se você é conservador, moderado ou arrojado.',
            Icons.psychology,
          ),
          const SizedBox(height: 12),
          _buildPasso(
            5,
            'Invista no Primeiro Ativo',
            'Comece pela Reserva de Emergência (Tesouro Selic ou CDB). Depois, diversifique gradualmente.',
            Icons.rocket_launch,
          ),
          const SizedBox(height: 24),
          _buildDica(),
        ],
      ),
    );
  }

  Widget _buildPasso(
    int numero,
    String titulo,
    String descricao,
    IconData icone,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF00D9FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                '$numero',
                style: const TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icone, color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      titulo,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  descricao,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDica() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.withAlpha(40), Colors.green.withAlpha(15)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.withAlpha(75), width: 1),
      ),
      child: const Row(
        children: [
          Icon(Icons.lightbulb, color: Colors.green, size: 24),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dica do Mentor:',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Comece devagar, invista consistentemente e evite tentar "timbar" o mercado. O tempo é seu maior aliado.',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
