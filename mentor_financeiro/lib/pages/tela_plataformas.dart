import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/config/app_secrets.dart';

class TelaPlataformas extends StatefulWidget {
  const TelaPlataformas({super.key});

  @override
  State<TelaPlataformas> createState() => _TelaPlataformasState();
}

class _TelaPlataformasState extends State<TelaPlataformas> {
  bool _isPremium = false;

  final List<Map<String, String>> _plataformas = [
    {
      'nome': 'Nubank',
      'tipo': 'Banco Digital',
      'descricao':
          'O maior banco digital do Brasil. Conta digital gratuitas, cartão com annuidade zero e rendimento Diário da conta.',
      'descricaoPremium':
          'Para abrir conta: baixe o app Nubank (iOS/Android) ou acessewww.nubank.com.br. Documentos: CPF e RG. Tempo: 5 minutos. Sem taxa de manutenção.',
      'link': 'https://nubank.com.br',
    },
    {
      'nome': 'BTG Pactual',
      'tipo': 'Banco de Investimentos',
      'descricao':
          'Um dos maiores bancos de investimentos do Brasil. Ótimas opções de renda fixa e fundos.',
      'descricaoPremium':
          'Oferece CDBs com taxas superiores ao CDI. Mínimode R\$1.000 para investir. Fundos de diversos perfis. Acesso via app ou HomeBroker.',
      'link': 'https://www.btgpactual.com',
    },
    {
      'nome': 'Itaú',
      'tipo': 'Banco Múltiplo',
      'descricao':
          'Maior banco do Brasil. Segurança, variedade de produtos e rede de agências.',
      'descricaoPremium':
          'Conta corriente com taxa reduzida. Fundos de investimento com gestão profissional. Serviços integrados. App robusto e agências em todo o Brasil.',
      'link': 'https://www.itau.com.br',
    },
    {
      'nome': 'Santander',
      'tipo': 'Banco Múltiplo',
      'descricao': 'Grande banco internacional com presença global.',
      'descricaoPremium':
          'Conta Digital com mensalidade reduzida. Fundos Santander com diversas estratégias. Promoções frequentes de cashback. App e internet banking completos.',
      'link': 'https://www.santander.com.br',
    },
    {
      'nome': 'Rico',
      'tipo': 'Corretora de Investimentos',
      'descricao':
          'Corretora com ótima plataforma para investimentos em renda variável.',
      'descricaoPremium':
          'HomeBroker moderno e gratuito para operar ações, FIIs e ETFs. Taxas reduzidas paraDay Trade. Análisesgrátis.Excelente para quem opera ativamente.',
      'link': 'https://www.rico.com.vc',
    },
    {
      'nome': 'Modalmais',
      'tipo': 'Corretora de Investimentos',
      'descricao': 'Corretora com foco em traders e investidores ativos.',
      'descricaoPremium':
          'Taxas competitivas para operações de renda variável. PlatformaTrader completa. Análisetécnica integrada.Excelente custo-benefício.',
      'link': 'https://www.modalmais.com.br',
    },
  ];

  @override
  void initState() {
    super.initState();
    _carregarStatus();
  }

  Future<void> _carregarStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final email =
        FirebaseAuth.instance.currentUser?.email?.trim().toLowerCase() ?? '';
    setState(() {
      _isPremium =
          (prefs.getBool('plano_pro') ?? false) ||
          (email.isNotEmpty && AppSecrets.adminEmails.contains(email));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: const Text(
          'Plataformas Sugeridas',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _plataformas.length,
        itemBuilder: (context, index) {
          final plataforma = _plataformas[index];
          return _cartaoPlataforma(plataforma);
        },
      ),
    );
  }

  Widget _cartaoPlataforma(Map<String, String> plataforma) {
    final nome = plataforma['nome']!;
    final tipo = plataforma['tipo']!;
    final descricao = plataforma['descricao']!;
    final descricaoPremium = plataforma['descricaoPremium']!;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF00D9FF).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.account_balance,
                  color: Color(0xFF00D9FF),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nome,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      tipo,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              if (!_isPremium)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('🔒', style: TextStyle(fontSize: 12)),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            descricao,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          if (_isPremium) ...[
            const SizedBox(height: 12),
            Text(
              descricaoPremium,
              style: const TextStyle(
                color: Color(0xFF00D9FF),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _abrirLink(plataforma['link']!),
              style: ElevatedButton.styleFrom(
                backgroundColor: _isPremium
                    ? const Color(0xFF00D9FF)
                    : Colors.white10,
                foregroundColor: _isPremium
                    ? const Color(0xFF0F172A)
                    : Colors.white54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                _isPremium
                    ? 'Acessar Plataforma'
                    : 'Ver análise completa (Premium)',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _abrirLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
