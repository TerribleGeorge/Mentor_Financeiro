import 'package:flutter/material.dart';

class FerramentasPage extends StatelessWidget {
  const FerramentasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Melhores Ferramentas',
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
          _buildHeader(),
          const SizedBox(height: 24),
          _buildSection(
            'Calculadoras do Mentor',
            'Simulações inteligentes com orientação prática:',
            Icons.calculate_outlined,
            [
              _buildNavToolItem(
                context,
                'Calculadora Mentora de Juros',
                'Montante nominal, ganho real após inflação e conselhos sobre IR, prazo e disciplina.',
                const Color(0xFF00D9FF),
                '/ferramentas/calculadora-juros',
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSection(
            'Corretoras Recomendadas',
            'As melhores opções para começar a investir no Brasil:',
            Icons.business,
            [
              _buildToolItem(
                'XP Investimentos',
                'Maior corretora do Brasil. Excelente para todos os perfis.',
                Colors.blue,
              ),
              _buildToolItem(
                'BTG Pactual',
                'Ótima plataforma e análise.boa para quem quer dinamismo.',
                Colors.green,
              ),
              _buildToolItem(
                'Rico',
                'Interface simples. Pertence ao Grupo Primo.',
                Colors.purple,
              ),
              _buildToolItem(
                'Inter',
                'Zero taxa de custódia. Ideal para iniciantes.',
                Colors.orange,
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSection(
            'Educação Financeira',
            'Plataformas para aprender a investir:',
            Icons.school,
            [
              _buildToolItem(
                'Grupo Primo (Rico/Íon)',
                'Referência em educação financeira no Brasil. Cursos gratuitos e pagos.',
                Colors.purple,
              ),
              _buildToolItem(
                'Bastter',
                'Aprenda sobre investimentos com profundidade.',
                Colors.teal,
              ),
              _buildToolItem(
                'Suno',
                'Podcasts e cursos sobre investimentos.',
                Colors.amber,
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSection(
            'Análise de Ativos',
            'Sites para consultar dados e números:',
            Icons.analytics,
            [
              _buildToolItem(
                'Status Invest',
                'Dados completos de empresas, FIIs e fundos. essencial.',
                Colors.blue,
              ),
              _buildToolItem(
                'Investidor 10',
                'Comparativos e análises detalhadas.',
                Colors.green,
              ),
              _buildToolItem(
                'Fundamentus',
                'Dados fundamentalistas de ações.',
                Colors.indigo,
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSection(
            'Controle de Carteira',
            'Apps para acompanhar seus investimentos:',
            Icons.dashboard,
            [
              _buildToolItem(
                'Kinvo',
                'Consolida todas as corretoras em um só lugar.',
                Colors.blue,
              ),
              _buildToolItem(
                'Gorila',
                'Agregador de investimentos com análise.',
                Colors.green,
              ),
              _buildToolItem(
                'Warren',
                'Carteira integrada com educação.',
                Colors.purple,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildDicaFinal(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.withAlpha(40), Colors.blue.withAlpha(15)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.withAlpha(75), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withAlpha(50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.build, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ferramentas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Tudo que você precisa para investir melhor',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    String title,
    String subtitle,
    IconData icon,
    List<Widget> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blue, size: 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
        const SizedBox(height: 12),
        ...items,
      ],
    );
  }

  Widget _buildToolItem(String name, String description, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavToolItem(
    BuildContext context,
    String name,
    String description,
    Color color,
    String route,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => Navigator.pushNamed(context, route),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.white38),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDicaFinal() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF00D9FF).withAlpha(25),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF00D9FF).withAlpha(75)),
      ),
      child: const Row(
        children: [
          Icon(Icons.lightbulb, color: Color(0xFF00D9FF), size: 28),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dica do Mentor',
                  style: TextStyle(
                    color: Color(0xFF00D9FF),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Comece com uma corretora só. Só use agregadores quando tiver mais de uma conta.',
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
